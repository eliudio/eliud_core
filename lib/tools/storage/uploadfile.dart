import 'dart:async';
import 'dart:io';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
import 'package:image/image.dart' as img;
import 'package:thumbnails/thumbnails.dart';
import 'package:flutter/services.dart' show AssetBundle, rootBundle;

class MediumData {
  final String filePath;
  final int width;
  final int height;

  MediumData({this.filePath, this.width, this.height});
}

class MediumAndItsThumbnailData {
  final MediumData mediumData;
  final MediumData thumbNailData;

  MediumAndItsThumbnailData({this.mediumData, this.thumbNailData});
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
  static Future<String> _getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File(Directory.systemTemp.path + newRandomKey());
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file.path;
  }

  /*
   * Create a thumbnail from a photo
   */
  static MediumAndItsThumbnailData _createThumbNailFromPhoto(String filePath) {
    img.Image image = img.decodeImage(File(filePath).readAsBytesSync());
    int width = image.width;
    int height = image.height;
    var thumbNailImage;
    if (image.width > image.height) {
      thumbNailImage = img.copyResize(image, width: thumbnailSize);
    } else {
      thumbNailImage = img.copyResize(image, height: thumbnailSize);
    }
    int thumbNailWidth = thumbNailImage.width;
    int thumbNailHeight = thumbNailImage.height;
    var thumbNameFilePath = filePath + '.thumbnail' + context.extension(filePath);
    File(thumbNameFilePath)..writeAsBytesSync(img.encodePng(thumbNailImage));

    return MediumAndItsThumbnailData(
        mediumData: MediumData(width: width, height: height, filePath: filePath),
        thumbNailData: MediumData(width: thumbNailWidth, height: thumbNailHeight, filePath: thumbNameFilePath)
    );
  }

  /*
   * Create a thumbnail from a video
   */
  static Future<MediumAndItsThumbnailData> _createThumbNailFromVideo(String filePath) async {
    String thumnailFromVideo = await Thumbnails.getThumbnail(
        thumbnailFolder: Directory.systemTemp.path ,
        videoFile: filePath,
        imageType: ThumbFormat.PNG,//this image will store in created folderpath
        quality: 30);

    // the thumnailFromVideo is too big, it's 512 x something, so we make a thumbnail from the thumbnail
    var photoData = _createThumbNailFromPhoto(thumnailFromVideo);

    // return the data
    return MediumAndItsThumbnailData(
        mediumData: MediumData(width: null, height: null, filePath: filePath),  // we don't know the size of the video... todo
        thumbNailData: MediumData(width: photoData.thumbNailData.width, height: photoData.thumbNailData.height, filePath: photoData.thumbNailData.filePath)
    );
  }

  static Future<String> _uploadFile(String filePath, String ownerId, List<String> readAccess) async {
    File file = File(filePath);
    try {
      var baseName = newRandomKey() + context.extension(filePath);
      var customMetaData = {
        'owner': ownerId,
        'readAccess': readAccess.join(';') + ";"
      };
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref('$ownerId/$baseName')
          .putFile(file, firebase_storage.SettableMetadata(
          customMetadata: customMetaData
      ));
      var url = await uploadTask.ref.getDownloadURL();
      return url;
    } on firebase_storage.FirebaseException catch (e) {
      print(e);
      // e.g, e.code == 'canceled'
    }
  }

  /*
   * Upload a photo from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getImageFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoAsset(String appId, String assetPath, String ownerId, List<String> readAccess) async {
    String filePath = await _getImageFileFromAssets(assetPath);
    return createThumbnailUploadPhotoFile(appId, filePath, ownerId, readAccess);
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoFile(String appId, String filePath, String ownerId, List<String> readAccess) async {
    // First, upload the file
    var url = await _uploadFile(filePath, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData = _createThumbNailFromPhoto(filePath);

    // Third, upload the thumnail;
    var thumbnailUrl = await _uploadFile(photoData.thumbNailData.filePath, ownerId, readAccess);

    // Create the MemberImageModel
    var memberImageModel = MemberMediumModel(
      documentID: newRandomKey(),
      appId: appId,
      authorId: ownerId,
      url: url,
      readAccess: readAccess,
      mediumType: MediumType.Photo,
      urlThumbnail: thumbnailUrl,
      mediumWidth: photoData.mediumData.width,
      mediumHeight: photoData.mediumData.height,
      thumbnailWidth: photoData.thumbNailData.width,
      thumbnailHeight: photoData.thumbNailData.height,
    );
    return memberMediumRepository(appId: appId).add(memberImageModel);
  }

  /*
   * Upload a video from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getImageFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoAsset(String appId, String assetPath, String ownerId, List<String> readAccess) async {
    String filePath = await _getImageFileFromAssets(assetPath);
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
    var url = await _uploadFile(filePath, ownerId, readAccess);

    // Second, create the thumbnail
    var videoData = await _createThumbNailFromVideo(filePath);

    // Third, upload the thumbnail;
    var thumbnailUrl = await _uploadFile(videoData.thumbNailData.filePath, ownerId, readAccess);

    // Create the MemberImageModel
    var memberImageModel = MemberMediumModel(
      documentID: newRandomKey(),
      appId: appId,
      authorId: ownerId,
      url: url,
      readAccess: readAccess,
      mediumType: MediumType.Video,
      urlThumbnail: thumbnailUrl,
      mediumWidth: videoData.mediumData.width,
      mediumHeight: videoData.mediumData.height,
      thumbnailWidth: videoData.thumbNailData.width,
      thumbnailHeight: videoData.thumbNailData.height,
    );

    return memberMediumRepository(appId: appId).add(memberImageModel);
  }
}
