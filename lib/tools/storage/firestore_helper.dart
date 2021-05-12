import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:path/path.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as imgpackage;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:video_thumbnail/video_thumbnail.dart';

class MediumData {
  final String? filePath;
  final int? width;
  final int? height;

  MediumData({this.filePath, this.width, this.height});
}

class MediumAndItsThumbnailData {
  final MediumType mediumType;
  final MediumData? mediumData;
  final MediumData? thumbNailData;

  MediumAndItsThumbnailData({required this.mediumType, this.mediumData, this.thumbNailData});
}

/* This helper is used to translate the callback for method decodeImageFromList to be translated into a future
 */
class ThumbnailHelper {
  final int thumbnailSize;
  final String filePath;
  final Completer _completer = new Completer<MediumAndItsThumbnailData>();

  ThumbnailHelper(this.filePath, this.thumbnailSize, );

  Future<MediumAndItsThumbnailData> imageToMediumAndItsThumbnailData(Uint8List list, String thumbNameFilePath, ui.Image img) async {
    var bytes = await img.toByteData();
    var codec = await ui.instantiateImageCodec(list
        , targetHeight: thumbnailSize, targetWidth: thumbnailSize);
    var frameInfo = await codec.getNextFrame();
    var thumbnailImage = frameInfo.image;
    var thumbnailBytes = await thumbnailImage.toByteData();
    if (thumbnailBytes == null) {
      print("Can not retrieve bytes for thumbnail");
      return Future.value(null);
    } else {
      await File(thumbNameFilePath).writeAsBytes(
          thumbnailBytes.buffer.asUint8List(thumbnailBytes.offsetInBytes, thumbnailBytes.lengthInBytes));

      return MediumAndItsThumbnailData(
        mediumType: MediumType.Photo,
          mediumData: MediumData(
              width: img.width, height: img.height, filePath: filePath),
          thumbNailData: MediumData(width: thumbnailSize,
              height: thumbnailSize,
              filePath: thumbNameFilePath)
      );
    }
  }

  void _startOperation() {
    var list = File(filePath).readAsBytesSync();
    var extension = context.extension(filePath);
    var thumbNameFilePath = filePath + '.thumbnail' + extension;
    ui.decodeImageFromList(list, ((ui.Image img) async {
      var mediumAndItsThumbnailData = await imageToMediumAndItsThumbnailData(
          list, thumbNameFilePath, img);
      _finishOperation(mediumAndItsThumbnailData);
    }));
  }

  Future<MediumAndItsThumbnailData> doOperation() {
    _startOperation();
    return _completer.future.then((value) => value as MediumAndItsThumbnailData); // Send future object back to client.
  }

  // Something calls this when the value is ready.
  void _finishOperation(MediumAndItsThumbnailData result) {
    _completer.complete(result);
  }

  // If something goes wrong, call this.
  void _errorHappened(error) {
    _completer.completeError(error);
  }
}

class UploadInfo {
  final String url;
  final String ref;

  UploadInfo(this.url, this.ref);
}

class UploadFile {
  static int thumbnailSize = 200;

  /*
   * Copy an asset to a temporary file
   *
   * Items specified in assetPath must be added to a package lib directory and they must be added to your pubspc.yaml file
   * For example,
   * 1) add file abc.jpg to the package eliud_pkg_apps and put it in directory lib/assets/minkey_app/feed/abc.jpg
   * 2) add the following to your pubspec.yaml
   *    flutter:
   *      assets:
   *        - packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg
   *
   * 3) specify 'packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg' as value for your assetPath
   */
  static Future<String> _getFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final newFileName = context.basenameWithoutExtension(path) + '-' + newRandomKey() + context.extension(path); // make sure it's a unique filename
    final newFile = File(Directory.systemTemp.path + '/' + newFileName);
    await newFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return newFile.path;
  }

  /*
   * Create a thumbnail from a photo
   */
  static Future<MediumAndItsThumbnailData> createThumbNailFromPhoto(String filePath) async {
    print("1");
    var img = imgpackage.decodeImage(File(filePath).readAsBytesSync())!;
    print("2");
    var thumbnailWidth;
    var thumbnailHeight;
    print("3");
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    print("4");
    var thumbnail = imgpackage.copyResize(img, width: thumbnailWidth, height: thumbnailHeight);
    var thumbNameFilePath = filePath + '.thumbnail' + '.png';
    print("5");
    File(thumbNameFilePath)..writeAsBytesSync(imgpackage.encodePng(thumbnail));

    print("6");
    return MediumAndItsThumbnailData(
        mediumType: MediumType.Photo,
        mediumData: MediumData(
            width: img.width, height: img.height, filePath: filePath),
        thumbNailData: MediumData(width: thumbnailSize,
            height: thumbnailSize,
            filePath: thumbNameFilePath)
    );

//    return ThumbnailHelper(filePath, thumbnailSize, ).doOperation();
  }

  /*
   * Create a thumbnail from a video
   */
  static Future<MediumAndItsThumbnailData> createThumbNailFromVideo(String filePath) async {
    var thumbNameFilePath = filePath + '.thumbnail' + '.png';
    await VideoThumbnail.thumbnailFile(
      video: filePath,
      thumbnailPath: thumbNameFilePath,
      imageFormat: ImageFormat.PNG,
      maxWidth: thumbnailSize, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 30,
    );

    // return the data
    return MediumAndItsThumbnailData(
        mediumType: MediumType.Video,
        mediumData: MediumData(width: null, height: null, filePath: filePath),  // we don't know the size of the video... todo
        thumbNailData: MediumData(width: thumbnailSize, height: thumbnailSize, filePath: thumbNameFilePath)
    );
  }

  static Future<UploadInfo?> _uploadFile(String filePath, String appId, String ownerId, List<String> readAccess) async {
    File file = File(filePath);
    try {
      var baseName = context.basename(filePath);
      var customMetaData = {
        'owner': ownerId,
        'readAccess': readAccess.join(';') + ";"
      };
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putFile(file, firebase_storage.SettableMetadata(
          customMetadata: customMetaData
      ));
      var url = await uploadTask.ref.getDownloadURL();
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
      // e.g, e.code == 'canceled'
    }
    return null;
  }

  /*
   * Upload a photo from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoAsset(String appId, String assetPath, String ownerId, List<String> readAccess) async {
    String filePath = await _getFileFromAssets(assetPath);
    return createThumbnailUploadPhotoFile(appId, filePath, ownerId, readAccess);
  }

  /*
   * Add MemberMedium representation entry for photo/video and it's thumbnail to repository
   */
  static Future<MemberMediumModel> mediumAndItsThumbnailDataToMemberMediumModel(String appId, UploadInfo? fileInfo, UploadInfo fileInfoThumbnail, MediumAndItsThumbnailData mediumAndItsThumbnailData, String ownerId, List<String> readAccess) {
    // Create the MemberImageModel
    var memberImageModel;

    if (mediumAndItsThumbnailData.mediumData == MediumType.Photo) {
      memberImageModel = MemberMediumModel(
        documentID: newRandomKey(),
        appId: appId,
        authorId: ownerId,
        ref: fileInfo == null ? null : fileInfo.ref,
        url: fileInfo == null ? null : fileInfo.url,
        readAccess: readAccess,
        mediumType: MediumType.Photo,
        urlThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
        mediumWidth: mediumAndItsThumbnailData.mediumData!.width,
        mediumHeight: mediumAndItsThumbnailData.mediumData!.height,
        thumbnailWidth: mediumAndItsThumbnailData.thumbNailData!.width,
        thumbnailHeight: mediumAndItsThumbnailData.thumbNailData!.height,
      );
    } else {
      // Create the MemberImageModel
      memberImageModel = MemberMediumModel(
        documentID: newRandomKey(),
        appId: appId,
        authorId: ownerId,
        ref: fileInfoThumbnail == null ? null : fileInfoThumbnail.ref,
        url: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
        readAccess: readAccess,
        mediumType: MediumType.Video,
        urlThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
        mediumWidth: mediumAndItsThumbnailData.mediumData!.width,
        mediumHeight: mediumAndItsThumbnailData.mediumData!.height,
        thumbnailWidth: mediumAndItsThumbnailData.thumbNailData!.width,
        thumbnailHeight: mediumAndItsThumbnailData.thumbNailData!.height,
      );
    }
    return memberMediumRepository(appId: appId)!.add(memberImageModel);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoFile(String appId, String filePath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var fileInfo = await _uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData = await createThumbNailFromPhoto(filePath);

    if (photoData.thumbNailData == null)
      throw Exception('photoData.thumbNailData is null');

    if (photoData.thumbNailData!.filePath == null)
      throw Exception('photoData.thumbNailData.filePath is null');

    // Third, upload the thumnail;
    var fileInfoThumbnail = await _uploadFile(photoData.thumbNailData!.filePath!, appId, ownerId, readAccess);

    if (fileInfo == null)
      throw Exception('Unable to upload file ' + filePath);

    if (fileInfoThumbnail == null)
      throw Exception('Unable to upload file ' + photoData.thumbNailData!.filePath!);

    return mediumAndItsThumbnailDataToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, photoData, ownerId, readAccess);
  }

  static Future<MemberMediumModel> uploadMediumAndItsThumbnailData(String appId, MediumAndItsThumbnailData mediumAndItsThumbnailData, String ownerId, List<String> readAccess) async {
    if (mediumAndItsThumbnailData.mediumData == null)
      throw Exception('mediumAndItsThumbnailData.mediumData is null');

    if (mediumAndItsThumbnailData.mediumData!.filePath == null)
      throw Exception('mediumAndItsThumbnailData.mediumData.filePath is null');

    if (mediumAndItsThumbnailData.thumbNailData == null)
      throw Exception('mediumAndItsThumbnailData.thumbNailData is null');

    if (mediumAndItsThumbnailData.thumbNailData!.filePath == null)
      throw Exception('mediumAndItsThumbnailData.thumbNailData.filePath is null');

    var fileInfo = await _uploadFile(mediumAndItsThumbnailData.mediumData!.filePath!, appId, ownerId, readAccess);
    var fileInfoThumbnail = await _uploadFile(mediumAndItsThumbnailData.thumbNailData!.filePath!, appId, ownerId, readAccess);

    if (fileInfo == null)
      throw Exception('Unable to upload file ' + mediumAndItsThumbnailData.mediumData!.filePath!);

    if (fileInfoThumbnail == null)
      throw Exception('Unable to upload file ' + mediumAndItsThumbnailData.thumbNailData!.filePath!);

    return mediumAndItsThumbnailDataToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, mediumAndItsThumbnailData, ownerId, readAccess);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> uploadThumbnailAndPhoto(String appId, String filePath, String thumbnailPath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var fileInfo = await _uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData = await createThumbNailFromPhoto(filePath);

    // Third, upload the thumnail;
    var fileInfoThumbnail = await _uploadFile(photoData.thumbNailData!.filePath!, appId, ownerId, readAccess);

    if (fileInfo == null)
      throw Exception('Unable to upload file ' + filePath);

    if (fileInfoThumbnail == null)
      throw Exception('Unable to upload file ' + photoData.thumbNailData!.filePath!);

    return mediumAndItsThumbnailDataToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, photoData, ownerId, readAccess);
  }

  /*
   * Upload a video from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoAsset(String appId, String assetPath, String ownerId, List<String> readAccess) async {
    String filePath = await _getFileFromAssets(assetPath);
    return createThumbnailUploadVideoFile(appId, filePath, ownerId, readAccess);
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoFile(String appId, String filePath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var fileInfo = await _uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var videoData = await createThumbNailFromVideo(filePath);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await _uploadFile(videoData.thumbNailData!.filePath!, appId, ownerId, readAccess);

    if (fileInfo == null)
      throw Exception('Unable to upload file ' + filePath);

    if (fileInfoThumbnail == null)
      throw Exception('Unable to upload file ' + videoData.thumbNailData!.filePath!);

    return mediumAndItsThumbnailDataToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, videoData, ownerId, readAccess);
  }

  /*
   * Create a thumbnail from a pdf doc
   */
  static Future<MediumAndItsThumbnailData> _createImageFromPdfPage(String filePath, int pageNumber, bool thumbNail) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    if (pageImage == null) {
      print("Can't find render image $filePath");
      return Future.value(null);
    } else {
      imgpackage.Image? img = imgpackage.decodeImage(pageImage.bytes);
      if (thumbNail) {
        var thumbnailWidth;
        var thumbnailHeight;
        if (img!.width > img.height) {
          thumbnailWidth = thumbnailSize;
        } else {
          thumbnailHeight = thumbnailSize;
        }
        var thumbnail = imgpackage.copyResize(
            img, width: thumbnailWidth, height: thumbnailHeight);
        var thumbNameFilePath = filePath + '.page' + pageNumber.toString() +
            '.tumbnail.png';
        File(thumbNameFilePath)
          ..writeAsBytesSync(imgpackage.encodePng(thumbnail));

        return MediumAndItsThumbnailData(
            mediumType: MediumType.Photo,
            thumbNailData: MediumData(width: thumbnailSize,
                height: thumbnailSize,
                filePath: thumbNameFilePath)
        );
      } else {
        var imageFilePath = filePath + '.page' + pageNumber.toString() + '.png';
        File(imageFilePath)
          ..writeAsBytesSync(imgpackage.encodePng(img!));

        return MediumAndItsThumbnailData(
            mediumType: MediumType.Photo,
            mediumData: MediumData(width: img.width,
                height: img.height,
                filePath: imageFilePath)
        );
      }
    }
  }

  /*
   * Create a thumbnail from a pdf doc
   */
  static Future<MediumAndItsThumbnailData> _createThumbNailFromPdf(String filePath) async {
    return _createImageFromPdfPage(filePath, 1, true);
  }

  /*
   * Upload a pdf from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfAsset(String appId, String assetPath, String ownerId, List<String> readAccess, {String? documentID}) async {
    var filePath = await _getFileFromAssets(assetPath);

    return createThumbnailUploadPdfFile(appId, filePath, ownerId, readAccess, documentID: documentID);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfFile(String appId, String filePath, String ownerId, List<String> readAccess, {String? documentID}) async {
    // First, upload the file
    var fileInfo = await _uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData = await _createThumbNailFromPdf(filePath);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await _uploadFile(photoData.thumbNailData!.filePath!, appId, ownerId, readAccess);

    // Now create extra MemberImageModels for each page
    final document = await PdfDocument.openFile(filePath);
    final pageCount = await document.pagesCount;
    dynamic previousMediumId = null;
    for (var i = pageCount; i >= 1; i--) {
      // First, create the thumbnail
      var pageData = await _createImageFromPdfPage(filePath, i, true);

      // Second, upload the thumbnail;
      var pageThumbnail = await _uploadFile(pageData.thumbNailData!.filePath!, appId, ownerId, readAccess);

      // Third, create image
      var imageFromPdf = await _createImageFromPdfPage(filePath, i, false);

      // Forth, upload the image
      var pageImage = await _uploadFile(imageFromPdf.mediumData!.filePath!, appId, ownerId, readAccess);

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
        mediumWidth: imageFromPdf.mediumData!.width,
        mediumHeight: imageFromPdf.mediumData!.height,
        readAccess: readAccess,
        thumbnailWidth: pageData.thumbNailData!.width,
        thumbnailHeight: pageData.thumbNailData!.height,
        relatedMediumId: previousMediumId
      );
      previousMediumId = documentID;
      await memberMediumRepository(appId: appId)!.add(pageImageModel);
    }

    // Create the MemberImageModel
    var memberImageModel = MemberMediumModel(
      documentID: documentID != null ? documentID : newRandomKey(),
      appId: appId,
      authorId: ownerId,
      url: fileInfo == null ? null : fileInfo.url,
      ref: fileInfo == null ? null : fileInfo.ref,
      readAccess: readAccess,
      mediumType: MediumType.Pdf,
      urlThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
      thumbnailWidth: photoData.thumbNailData!.width,
      thumbnailHeight: photoData.thumbNailData!.height,
      relatedMediumId: previousMediumId
    );
    return await memberMediumRepository(appId: appId)!.add(memberImageModel);
  }
}

class DownloadFile {
  static Future<Uint8List?> downloadFile(MemberMediumModel medium) async {
    try {
      var downloadTask = await firebase_storage.FirebaseStorage.instance
          .ref(medium.ref);
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
      infos.add(MediumInfo(currentPolicy.mediumWidth, currentPolicy.mediumHeight, currentPolicy.url));
    }
  }

  static Future<List<String?>> getChainOfUrls(String appId, MemberMediumModel memberMediumModel) async {
    List<String?> urls = [];
    var currentPolicy = memberMediumModel;
    _addUrl(urls, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!.get(currentPolicy.relatedMediumId);
      if (newPolicy == null) {
        print("Can't get policy");
      } else {
        currentPolicy = newPolicy;
        _addUrl(urls, currentPolicy);
      }
    }
    return urls;
  }

  static Future<List<MediumInfo>> getChainOfMediumInfo(String? appId, MemberMediumModel memberMediumModel) async {
    List<MediumInfo> infos = [];
    var currentPolicy = memberMediumModel;
    _addInfo(infos, currentPolicy);
    while (currentPolicy.relatedMediumId != null) {
      var newPolicy = await memberMediumRepository(appId: appId)!.get(currentPolicy.relatedMediumId);
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
