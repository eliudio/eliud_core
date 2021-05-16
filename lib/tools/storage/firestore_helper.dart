import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imgpackage;
import 'package:flutter/services.dart' show rootBundle;
import 'package:video_thumbnail/video_thumbnail.dart';

abstract class MediumData {
}

/* Classes to hold data for image, video or pdf */
class ImageData extends MediumData {
  final String baseName;
  final Uint8List data;
  final int? width;
  final int? height;

  ImageData(
      {required this.baseName,
      required this.data,
      required this.width,
      this.height});
}

class VideoData extends MediumData {
  final String filePath;

  VideoData(
      {required this.filePath /*, required this.width, required this.height*/});
}

class PdfData extends MediumData {
  final String filePath;
  final int width;
  final int height;

  PdfData({
    required this.filePath,
    required this.width,
    required this.height,
  });
}

abstract class MediumBase {
}

class PhotoWithThumbnail extends MediumBase {
  final ImageData photoData;
  final ImageData thumbNailData;

  PhotoWithThumbnail({
    required this.photoData,
    required this.thumbNailData,
  });
}

class VideoWithThumbnail extends MediumBase {
  final VideoData videoData;
  final ImageData thumbNailData;

  VideoWithThumbnail({required this.videoData, required this.thumbNailData});
}

class UploadInfo {
  final String url;
  final String ref;

  UploadInfo(this.url, this.ref);
}

/*
 * Before: UploadFile
 */
class AssetHelper {
  /*
   * Copy an asset to a local temporary file
   *
   * Items specified in assetPath must be added to a package lib directory and they must be added to your pubspec.yaml file
   * For example,
   * 1) add file abc.jpg to the package eliud_pkg_apps and put it in directory lib/assets/minkey_app/feed/abc.jpg
   * 2) add the following to your pubspec.yaml
   *    flutter:
   *      assets:
   *        - packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg
   *
   * 3) specify 'packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg' as value for your assetPath
   *
   * Before: _getFileFromAssets
   */
  static Future<String> getFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final newFileName = context.basenameWithoutExtension(path) +
        '-' +
        newRandomKey() +
        context.extension(path); // make sure it's a unique filename
    final newFile = File(Directory.systemTemp.path + '/' + newFileName);
    await newFile.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return newFile.path;
  }
}

class ThumbnailHelper {
  static int thumbnailSize = 200;

  /*
   * Create a thumbnail from a photo
   *
   * Usage: When you need a thumbnail of a photo and information about the photo
   *
   * before: createThumbNailFromPhoto
   */
  static Future<PhotoWithThumbnail> enrichPhoto(
      String baseName, String thumbnailBaseName, Uint8List imgBytes) async {
    var img = imgpackage.decodeImage(imgBytes)!;
    var thumbnailWidth;
    var thumbnailHeight;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);
    var thumbNailData = Uint8List.fromList(imgpackage.encodePng(thumbnail));

    return PhotoWithThumbnail(
      photoData: ImageData(
          baseName: baseName,
          width: img.width,
          height: img.height,
          data: imgBytes),
      thumbNailData: ImageData(
          baseName: thumbnailBaseName,
          width: thumbnailSize,
          height: thumbnailSize,
          data: thumbNailData),
    );
  }

  /*
   * Create a thumbnail from a video
   *
   * Usage: When you need a thumbnail of a video and information about the video
   *
   * before: createThumbNailFromVideo
   */
  static Future<VideoWithThumbnail> enrichVideo(String filePath) async {
    var thumbNailData = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.PNG,
      maxWidth: thumbnailSize,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 30,
    );

    if (thumbNailData == null) {
      throw Exception("Can't create thumbnail for " + filePath);
    }

    // return the data
    return VideoWithThumbnail(
        videoData: VideoData(
            /*width: null,
            height: null,
            */
            filePath: filePath), // we don't know the size of the video... todo
        thumbNailData: ImageData(baseName: BaseNameHelper.thumbnailBaseName(filePath),
            width: thumbnailSize, height: thumbnailSize, data: thumbNailData));
  }

  /*
   * Create an image with thumbnail from a specific page of a pdf doc
   * Before: _createImageFromPdfPage(with thumbnail TRUE)
   */
  static Future<PhotoWithThumbnail> createPhotoWithThumbnailFromPdfPage(
      String filePath, int pageNumber) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }
    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }
    var thumbnailWidth;
    var thumbnailHeight;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);

    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    return PhotoWithThumbnail(
        photoData: ImageData(
            baseName: baseName,
            data: pageImage.bytes, width: img.width, height: img.height),
        thumbNailData: ImageData(
            baseName: thumbnailBaseName,
            width: thumbnailSize,
            height: thumbnailSize,
            data: thumbnail.getBytes()));
  }

  /*
   * Create an image from a specific page of a pdf doc
   * Before: _createImageFromPdfPage(with thumbnail FALSE)
   */
  static Future<ImageData> createPhotoFromPdfPage(
      String filePath, int pageNumber) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }

    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }

    return ImageData(
        baseName: BaseNameHelper.baseName(filePath),
        width: img.width, height: img.height, data: pageImage.bytes);
  }
}

class BaseNameHelper {
  static String baseName(String filePath) {
    return context.basename(filePath);
  }

  static String thumbnailBaseName(String filePath) {
    return context.basenameWithoutExtension(filePath) +
        '.thumbnail.' +
        context.extension(filePath);
  }

  static String baseNameWithPage(String filePath, int page) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.' +
        context.extension(filePath);
  }

  static String thumbnailBaseNameWithPage(String filePath, int page) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.thumbnail.' +
        context.extension(filePath);
  }
}

class UploadInfoHelper {
  /*
   * Create custom meta data.
   *
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   *
   * Usage: When you need to construct meta data for a file before uploading. Set the owner and read access rights.
   */
  static Map<String, String> _customMetaData(
      String ownerId, List<String> readAccess) {
    var customMetaData = {
      'owner': ownerId,
      'readAccess': readAccess.join(';') + ';'
    };
    return customMetaData;
  }

  /*
   * Upload data to firebase storage
   *
   * Usage: When you need to upload data (Uint8List) to firebase storage
   *
   * Before: _uploadData
   */
  static Future<UploadInfo?> uploadData(String baseName, Uint8List fileData,
      String appId, String ownerId, List<String> readAccess) async {
    try {
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putData(
              fileData,
              firebase_storage.SettableMetadata(
                  customMetadata: _customMetaData(ownerId, readAccess)));
      var url = await uploadTask.ref.getDownloadURL();
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }

  /*
   * Upload a file to firebase storage
   *
   * Usage: When you need to upload a file to firebase storage
   *
   * Before: _uploadFile
   */
  static Future<UploadInfo> uploadFile(String filePath, String appId,
      String ownerId, List<String> readAccess) async {
    var file = File(filePath);
    try {
      var baseName = BaseNameHelper.baseName(filePath);
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putFile(
              file,
              firebase_storage.SettableMetadata(
                  customMetadata: _customMetaData(ownerId, readAccess)));
      var url = await uploadTask.ref.getDownloadURL();
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }
}

class MemberMediumHelper {
  /*
   * Construct and add MemberMedium representation entry for photo and it's thumbnail to repository
   * Before: mediumAndItsThumbnailDataToMemberMediumModel
   */
  static Future<MemberMediumModel> photoWithThumbnailToMemberMediumModel(
      String appId,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      PhotoWithThumbnail photoWithThumbnail,
      String ownerId,
      List<String> readAccess) {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = MemberMediumModel(
      documentID: newRandomKey(),
      appId: appId,
      authorId: ownerId,
      ref: fileInfo.ref,
      url: fileInfo.url,
      readAccess: readAccess,
      mediumType: MediumType.Photo,
      urlThumbnail: fileInfoThumbnail.url,
      mediumWidth: photoWithThumbnail.photoData.width,
      mediumHeight: photoWithThumbnail.photoData.height,
      thumbnailWidth: photoWithThumbnail.thumbNailData.width,
      thumbnailHeight: photoWithThumbnail.thumbNailData.height,
    );
    return memberMediumRepository(appId: appId)!.add(memberImageModel);
  }

  /*
   * Construct and add MemberMedium representation entry for video and it's thumbnail to repository
   * Before: mediumAndItsThumbnailDataToMemberMediumModel
   */
  static Future<MemberMediumModel> videoWithThumbnailToMemberMediumModel(
      String appId,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      VideoWithThumbnail videoWithThumbnail,
      String ownerId,
      List<String> readAccess) {
    // Create the MemberImageModel
    var memberImageModel;

    // Create the MemberImageModel
    memberImageModel = MemberMediumModel(
      documentID: newRandomKey(),
      appId: appId,
      authorId: ownerId,
      ref: fileInfoThumbnail.ref,
      url: fileInfoThumbnail.url,
      readAccess: readAccess,
      mediumType: MediumType.Video,
      urlThumbnail: fileInfoThumbnail.url,
      /*
      mediumWidth: videoWithThumbnail.videoData.width,
      mediumHeight: videoWithThumbnail.videoData.height,
      */
      thumbnailWidth: videoWithThumbnail.thumbNailData.width,
      thumbnailHeight: videoWithThumbnail.thumbNailData.height,
    );
    return memberMediumRepository(appId: appId)!.add(memberImageModel);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoFile(String appId,
      String filePath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var fileInfo =
        await UploadInfoHelper.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedPhoto = await ThumbnailHelper.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfoHelper.uploadData(
        baseName, enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess);

    if (fileInfoThumbnail == null) {
      throw Exception('fileInfoThumbnail is null');
    }

    return photoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedPhoto, ownerId, readAccess);
  }

  /*
   * Upload a photo from an asset for a given app with appId
   *
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoAsset(String appId,
      String assetPath, String ownerId, List<String> readAccess) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);
    return createThumbnailUploadPhotoFile(appId, filePath, ownerId, readAccess);
  }

  /*
   * Upload photo + thumbnail to firestore storage
   */
  static Future<MemberMediumModel> uploadPhotoWithThumbnail(
      String appId,
      PhotoWithThumbnail photoWithThumbnail,
      String ownerId,
      List<String> readAccess) async {
    var fileInfo = await UploadInfoHelper.uploadData(
        photoWithThumbnail.photoData.baseName,
        photoWithThumbnail.photoData.data,
        appId,
        ownerId,
        readAccess);

    var thumbnailInfo = await UploadInfoHelper.uploadData(
        photoWithThumbnail.thumbNailData.baseName,
        photoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        readAccess);

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    return photoWithThumbnailToMemberMediumModel(appId, fileInfo, thumbnailInfo,
        photoWithThumbnail, ownerId, readAccess);
  }

  /*
   * Upload video + thumbnail to firestore storage
   */
  static Future<MemberMediumModel> uploadVideoWithThumbnail(
      String appId,
      VideoWithThumbnail videoWithThumbnail,
      String ownerId,
      List<String> readAccess) async {
    var filePath = videoWithThumbnail.videoData.filePath;
    var baseName = BaseNameHelper.baseName(filePath);
    var fileInfo =
        await UploadInfoHelper.uploadFile(filePath, appId, ownerId, readAccess);

    var thumbnailInfo = await UploadInfoHelper.uploadData(baseName,
        videoWithThumbnail.thumbNailData.data, appId, ownerId, readAccess);

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    return videoWithThumbnailToMemberMediumModel(appId, fileInfo, thumbnailInfo,
        videoWithThumbnail, ownerId, readAccess);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> uploadThumbnailAndPhoto(
      String appId,
      String filePath,
      String thumbnailPath,
      String ownerId,
      List<String> readAccess) async {
    // First, upload the file
    var fileInfo =
        await UploadInfoHelper.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    // var photoData = await createThumbNailFromPhoto(filePath);
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedPhoto = await ThumbnailHelper.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfoHelper.uploadData(
        baseName, enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess);

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    return photoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedPhoto, ownerId, readAccess);
  }

  /*
   * Upload a video from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoAsset(String appId,
      String assetPath, String ownerId, List<String> readAccess) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);
    return createThumbnailUploadVideoFile(appId, filePath, ownerId, readAccess);
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoFile(String appId,
      String filePath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var fileInfo =
        await UploadInfoHelper.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var enrichedVideo = await ThumbnailHelper.enrichVideo(filePath);

    // Third, upload the thumbnail;
    var baseName = BaseNameHelper.baseName(filePath);
    var fileInfoThumbnail = await UploadInfoHelper.uploadData(
        baseName, enrichedVideo.thumbNailData.data, appId, ownerId, readAccess);

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    return videoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedVideo, ownerId, readAccess);
  }

  /*
   * Upload a pdf from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfAsset(
      String appId, String assetPath, String ownerId, List<String> readAccess,
      {String? documentID}) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);

    return createThumbnailUploadPdfFile(appId, filePath, ownerId, readAccess,
        documentID: documentID);
  }

  /*
   * Upload a pdf in  from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfFile(
      String appId, String filePath, String ownerId, List<String> readAccess,
      {String? documentID}) async {
    // First, upload the file
    var fileInfo =
        await UploadInfoHelper.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData =
        await ThumbnailHelper.createPhotoWithThumbnailFromPdfPage(filePath, 1);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfoHelper.uploadData(
        BaseNameHelper.thumbnailBaseNameWithPage(filePath, 1),
        photoData.thumbNailData.data,
        appId,
        ownerId,
        readAccess);

    // Now create extra MemberImageModels for each page
    final document = await PdfDocument.openFile(filePath);
    final pageCount = await document.pagesCount;
    dynamic previousMediumId;
    for (var i = pageCount; i >= 1; i--) {
      // First, create the thumbnail
      var pageData = await ThumbnailHelper.createPhotoWithThumbnailFromPdfPage(
          filePath, i);

      // Second, upload the thumbnail;
      var pageThumbnail = await UploadInfoHelper.uploadData(
          BaseNameHelper.thumbnailBaseNameWithPage(filePath, 1),
          pageData.thumbNailData.data,
          appId,
          ownerId,
          readAccess);

      // Third, create image
      var imageFromPdf =
          await ThumbnailHelper.createPhotoFromPdfPage(filePath, i);

      // Forth, upload the image
      var pageImage = await UploadInfoHelper.uploadData(
          BaseNameHelper.baseNameWithPage(filePath, 1),
          imageFromPdf.data,
          appId,
          ownerId,
          readAccess);

      var documentID = newRandomKey();
      // Forth, upload the file;
      var pageImageModel = MemberMediumModel(
          documentID: documentID,
          appId: appId,
          authorId: ownerId,
          url: pageImage == null ? null : pageImage.url,
          ref: pageImage == null ? null : pageImage.ref,
          urlThumbnail: pageThumbnail == null ? null : pageThumbnail.url,
          mediumType: MediumType.Photo,
          mediumWidth: imageFromPdf.width,
          mediumHeight: imageFromPdf.height,
          readAccess: readAccess,
          thumbnailWidth: pageData.thumbNailData.width,
          thumbnailHeight: pageData.thumbNailData.height,
          relatedMediumId: previousMediumId);
      previousMediumId = documentID;
      await memberMediumRepository(appId: appId)!.add(pageImageModel);
    }

    // Create the MemberImageModel
    var memberImageModel = MemberMediumModel(
        documentID: documentID ?? newRandomKey(),
        appId: appId,
        authorId: ownerId,
        url: fileInfo.url,
        ref: fileInfo.ref,
        readAccess: readAccess,
        mediumType: MediumType.Pdf,
        urlThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
        thumbnailWidth: photoData.thumbNailData.width,
        thumbnailHeight: photoData.thumbNailData.height,
        relatedMediumId: previousMediumId);
    return await memberMediumRepository(appId: appId)!.add(memberImageModel);
  }
}

class DownloadFile {
  static Future<Uint8List?> downloadFile(MemberMediumModel medium) async {
    try {
      var downloadTask =
          await firebase_storage.FirebaseStorage.instance.ref(medium.ref);
      return downloadTask.getData();
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
      // e.g, e.code == 'canceled'
    }
  }
}

class MediumInfo {
  final int? width;
  final int? height;
  final String? url;

  MediumInfo(this.width, this.height, this.url);
}

class ChainOfMediumModels {
  static void _addUrl(List<String?> urls, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.Photo) {
      urls.add(currentPolicy.url);
    }
  }

  static void _addInfo(List<MediumInfo> infos, MemberMediumModel currentPolicy) {
    if (currentPolicy.mediumType == MediumType.Photo) {
      infos.add(MediumInfo(currentPolicy.mediumWidth,
          currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static Future<List<String?>> getChainOfUrls(
      String appId, MemberMediumModel memberMediumModel) async {
    var urls = <String?>[];
    var currentPolicy = memberMediumModel;
    _addUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<MediumInfo>> getChainOfMediumInfo(
      String? appId, MemberMediumModel memberMediumModel) async {
    var infos = <MediumInfo>[];
    var currentPolicy = memberMediumModel;
    _addInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!
          .get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addInfo(infos, currentPolicy);
      }
    }
    return infos;
  }
}
