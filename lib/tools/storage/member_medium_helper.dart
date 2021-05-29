import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

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
      refThumbnail: fileInfoThumbnail.ref,
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
      refThumbnail: fileInfoThumbnail.ref,
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
   * We split task in equal parts. That's not entirely correct, but we're ok with that.
   * For each task we forward it's individual progress feedback and aggregate the progress to give feedback
   * to the end user about the entire process.
   */
  static void _feedBackAggregatedProgressNormal(int currentTask, int totalTasks,
      double progressCurrentTask, {FeedbackProgress? feedbackProgress}) {
    if (feedbackProgress != null) {
      feedbackProgress((currentTask - 1 + progressCurrentTask) / totalTasks);
    }
  }

  /*
   * This progress indicator assumes the last task assumes a tiny task at the end which is 1/(totalTask * totalTask) in size
   * So for example, 4 tasks would represent
   * task 1 progress up till: 0.33 - 0.0625 = 0.27
   * task 2 progress up till: 0.66 - 0.0625 = 0.54
   * task 2 progress up till: 1.00 - 0.0625 = 0.81
   * task 4 progress up till: 1
   */
  static void _feedBackAggregatedProgress(int currentTask, int totalTasks,
      double progressCurrentTask, {FeedbackProgress? feedbackProgress}) {
    if (feedbackProgress != null) {
      feedbackProgress(min(1, (currentTask - 1 + progressCurrentTask) / (totalTasks) / 75 * 90));
    }
  }

  /*
   * Upload a photo from a blob for a given app with appId
   * baseName is the name to basename
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoData(
      String appId,
      Uint8List fileData,
      String baseName,
      String thumbnailBaseName,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo = await UploadInfo.uploadData(
        baseName,
        fileData,
        appId,
        ownerId,
        readAccess,
        feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception('fileInfo is null');
    }

    // Second, create the thumbnail
    var enrichedPhoto =
        await MediumData.enrichPhoto(baseName, thumbnailBaseName, fileData);
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfo.uploadData(
        thumbnailBaseName,
        enrichedPhoto.thumbNailData.data,
        appId,
        ownerId,
        readAccess,
        feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception('fileInfoThumbnail is null');
    }

    var returnMe = await photoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedPhoto, ownerId, readAccess);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoFile(
      String appId,
      String filePath,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);

    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception('fileInfoThumbnail is null');
    }

    var returnMe = await photoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedPhoto, ownerId, readAccess);

    _feedBackAggregatedProgress(1, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a photo from an asset for a given app with appId
   *
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   */
  static Future<MemberMediumModel> createThumbnailUploadPhotoAsset(
      String appId,
      String assetPath,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);
    return createThumbnailUploadPhotoFile(
        appId, filePath, ownerId, readAccess, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload photo + thumbnail to firestore storage
   */
  static Future<MemberMediumModel> uploadPhotoWithThumbnail(
      String appId,
      PhotoWithThumbnail photoWithThumbnail,
      String ownerId,
      List<String> readAccess,
  {FeedbackProgress? feedbackProgress}) async {
    var fileInfo = await UploadInfo.uploadData(
        photoWithThumbnail.photoData.baseName,
        photoWithThumbnail.photoData.data,
        appId,
        ownerId,
        readAccess, feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 3, progress, feedbackProgress: feedbackProgress));

    var thumbnailInfo = await UploadInfo.uploadData(
        photoWithThumbnail.thumbNailData.baseName,
        photoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        readAccess, feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(2, 3, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    var returnMe = await photoWithThumbnailToMemberMediumModel(appId, fileInfo, thumbnailInfo,
        photoWithThumbnail, ownerId, readAccess);
    _feedBackAggregatedProgress(3, 3, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload video + thumbnail to firestore storage
   */
  static Future<MemberMediumModel> uploadVideoWithThumbnail(
      String appId,
      VideoWithThumbnail videoWithThumbnail,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    var fileInfo = await UploadInfo.uploadData(
        videoWithThumbnail.videoData.baseName,
        videoWithThumbnail.videoData.data,
        appId,
        ownerId,
        readAccess, feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 3, progress, feedbackProgress: feedbackProgress));

    var thumbnailInfo = await UploadInfo.uploadData(
        videoWithThumbnail.thumbNailData.baseName,
        videoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        readAccess, feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(2, 3, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    var returnMe = await videoWithThumbnailToMemberMediumModel(appId, fileInfo, thumbnailInfo,
        videoWithThumbnail, ownerId, readAccess);
    _feedBackAggregatedProgress(3, 3, 1, feedbackProgress: feedbackProgress);
    return returnMe;
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
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    // var photoData = await createThumbNailFromPhoto(filePath);
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);

    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedPhoto.thumbNailData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    var returnMe = await photoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedPhoto, ownerId, readAccess);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a video from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoAsset(
      String appId,
      String assetPath,
      String ownerId,
      List<String> readAccess,
  {FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);
    return createThumbnailUploadVideoFile(appId, filePath, ownerId, readAccess, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoFile(
      String appId,
      String filePath,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(filePath);
    var enrichedVideo = await MediumData.enrichVideoWithPath(filePath);
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedVideo.thumbNailData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    var returnMe = await videoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedVideo, ownerId, readAccess);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadVideoData(
      String appId,
      Uint8List fileData,
      String baseName,
      String thumbnailBaseName,
      String ownerId,
      List<String> readAccess,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo = await UploadInfo.uploadData(
        baseName, fileData, appId, ownerId, readAccess, feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload file with baseName $baseName. Could not create fileInfo');
    }

    // Second, create the thumbnail
    var enrichedVideo =
        await MediumData.enrichVideoUsngHerokuapp(baseName, thumbnailBaseName, fileData, fileInfo.url);
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedVideo.thumbNailData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));
    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file with baseName $baseName. Could not create fileInfoThumbnail');
    }

    var returnMe = await videoWithThumbnailToMemberMediumModel(
        appId, fileInfo, fileInfoThumbnail, enrichedVideo, ownerId, readAccess);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a pdf from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfAsset(
      String appId,
      String assetPath,
      String ownerId,
      List<String> readAccess,
      String documentID,
  {FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(assetPath);

    return createThumbnailUploadPdfFile(
        appId, filePath, ownerId, readAccess, documentID, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload a pdf in  from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  static Future<MemberMediumModel> createThumbnailUploadPdfFile(
      String appId,
      String filePath,
      String ownerId,
      List<String> readAccess,
      String documentID,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    final document = await PdfDocument.openFile(filePath);
    final pageCount = await document.pagesCount;
    var taskCounter = 1;
    var totalTasks = 4 + (pageCount * 4);

    var fileInfo =
        await UploadInfo.uploadFile(filePath, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

    var baseName = context.basenameWithoutExtension(filePath);

    // Second, create the thumbnail
    var photoData = await MediumData.createPhotoWithThumbnailFromPdfPage(
        filePath, documentID, 1);
    taskCounter++; _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var thumbNailName =
        context.basenameWithoutExtension(filePath) + '.thumbnail.png';
    taskCounter++;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbNailName,
        photoData.thumbNailData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

    // Now create extra MemberImageModels for each page
    dynamic previousMediumId;
    var newDocumentID;
    for (var i = pageCount; i >= 1; i--) {
      newDocumentID = documentID + '-' + i.toString();
      var newBaseName = baseName + '-' + i.toString();

      // First, create the image and thumbnail
      var pageData = await MediumData.createPhotoWithThumbnailFromPdfPage(
          filePath, newBaseName, i);
      taskCounter++; _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);

      // Second, upload the thumbnail;
      taskCounter++;
      var pageThumbnail = await UploadInfo.uploadData(
          pageData.thumbNailData.baseName,
          pageData.thumbNailData.data,
          appId,
          ownerId,
          readAccess, feedbackProgress: (progress) =>
          _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

      // Third, upload the image
      taskCounter++;
      var pageImage = await UploadInfo.uploadData(pageData.photoData.baseName,
          pageData.photoData.data, appId, ownerId, readAccess, feedbackProgress: (progress) =>
              _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

      // Create the MemberMediumModel representation
      var pageImageModel = MemberMediumModel(
          documentID: newDocumentID,
          appId: appId,
          authorId: ownerId,
          url: pageImage == null ? null : pageImage.url,
          ref: pageImage == null ? null : pageImage.ref,
          refThumbnail: pageThumbnail == null ? null : pageThumbnail.ref,
          urlThumbnail: pageThumbnail == null ? null : pageThumbnail.url,
          mediumType: MediumType.Photo,
          mediumWidth: pageData.photoData.width,
          mediumHeight: pageData.photoData.height,
          readAccess: readAccess,
          thumbnailWidth: pageData.thumbNailData.width,
          thumbnailHeight: pageData.thumbNailData.height,
          relatedMediumId: previousMediumId);

      previousMediumId = newDocumentID;
      taskCounter++;
      await memberMediumRepository(appId: appId)!.add(pageImageModel);
      _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);
    }

    // Create the MemberImageModel
    var memberImageModel = MemberMediumModel(
        documentID: documentID,
        appId: appId,
        authorId: ownerId,
        url: fileInfo.url,
        ref: fileInfo.ref,
        refThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.ref,
        readAccess: readAccess,
        mediumType: MediumType.Pdf,
        urlThumbnail: fileInfoThumbnail == null ? null : fileInfoThumbnail.url,
        thumbnailWidth: photoData.thumbNailData.width,
        thumbnailHeight: photoData.thumbNailData.height,
        relatedMediumId: previousMediumId);
    var returnMe = await memberMediumRepository(appId: appId)!.add(memberImageModel);
    taskCounter++;
    _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }
}
