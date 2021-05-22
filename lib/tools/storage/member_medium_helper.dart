import 'dart:async';
import 'dart:io';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:path/path.dart';

import 'asset_helper.dart';
import 'basename_helper.dart';
import 'medium_base.dart';
import 'medium_data.dart';
import 'upload_info.dart';

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
      ref: fileInfo.ref,
      url: fileInfo.url,
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
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfo.uploadData(
        thumbnailBaseName, enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess);

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
    var fileInfo = await UploadInfo.uploadData(
        photoWithThumbnail.photoData.baseName,
        photoWithThumbnail.photoData.data,
        appId,
        ownerId,
        readAccess);

    var thumbnailInfo = await UploadInfo.uploadData(
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
    var fileInfo = await UploadInfo.uploadData(
        videoWithThumbnail.videoData.baseName,
        videoWithThumbnail.videoData.data,
        appId,
        ownerId,
        readAccess);

    var thumbnailInfo = await UploadInfo.uploadData(
        videoWithThumbnail.thumbNailData.baseName,
        videoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        readAccess);

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. thumbnailInfo is null ');
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
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    // var photoData = await createThumbNailFromPhoto(filePath);
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(
        thumbnailBaseName, enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess);

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
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedVideo = await MediumData.enrichVideo(baseName, thumbnailBaseName, File(filePath).readAsBytesSync());

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(
        thumbnailBaseName, enrichedVideo.thumbNailData.data, appId, ownerId, readAccess);

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
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess);

    // Second, create the thumbnail
    var photoData =
        await MediumData.createPhotoWithThumbnailFromPdfPage(filePath, 1);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(
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
      var pageData = await MediumData.createPhotoWithThumbnailFromPdfPage(
          filePath, i);

      // Second, upload the thumbnail;
      var pageThumbnail = await UploadInfo.uploadData(
          BaseNameHelper.thumbnailBaseNameWithPage(filePath, 1),
          pageData.thumbNailData.data,
          appId,
          ownerId,
          readAccess);

      // Third, create image
      var imageFromPdf =
          await MediumData.createPhotoFromPdfPage(filePath, i);

      // Forth, upload the image
      var pageImage = await UploadInfo.uploadData(
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
