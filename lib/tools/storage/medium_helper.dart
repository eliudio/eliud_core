import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:path/path.dart';

import 'asset_helper.dart';
import 'basename_helper.dart';
import 'medium_base.dart';
import 'medium_data.dart';
import 'upload_info.dart';

typedef void PdfAvailable(dynamic? mediumModel);

abstract class MediumHelper<T> {
  final String appId;
  final String ownerId;
  final String packageName;

  MediumHelper(this.appId, this.ownerId, this.packageName);

  Map<String, String> readAccessCustomMetaData();

  Future<T> photoWithThumbnailToMediumModel(
      String mediumDocumentId,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      PhotoWithThumbnail photoWithThumbnail,
      );

  Future<T> videoWithThumbnailToMediumModel(
      String mediumDocumentId,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      VideoWithThumbnail videoWithThumbnail,
      );

  Future<T> constructMediumModel(String newDocumentID, UploadInfo? pageImage, UploadInfo? pageThumbnail, PhotoWithThumbnail pageData, dynamic previousMediumId);
  /*
   * We split task in equal parts. That's not entirely correct, but we're ok with that.
   * For each task we forward it's individual progress feedback and aggregate the progress to give feedback
   * to the end user about the entire process.
   */
  void _feedBackAggregatedProgressNormal(int currentTask, int totalTasks,
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
  void _feedBackAggregatedProgress(int currentTask, int totalTasks,
      double? progressCurrentTask, {FeedbackProgress? feedbackProgress}) {
    if (feedbackProgress != null) {
      if (progressCurrentTask == null) {
        feedbackProgress(null);
      } else {
        feedbackProgress(min(1,
            (currentTask - 1 + progressCurrentTask) / (totalTasks) / 75 * 90));
      }
    }
  }


  /*
   * Upload a photo from a blob for a given app with appId
   * baseName is the name to basename
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadPhotoData(
      String memberMediumDocumentId,
      Uint8List fileData,
      String baseName,
      String thumbnailBaseName,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo = await UploadInfo.uploadData(
        baseName,
        fileData,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(),
        feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception('fileInfo is null');
    }

    // Second, create the thumbnail
    var enrichedPhoto = await MediumData.enrichPhoto(baseName, thumbnailBaseName, fileData);
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfo.uploadData(
        thumbnailBaseName,
        enrichedPhoto.thumbNailData.data,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(),
        feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception('fileInfoThumbnail is null');
    }

    var returnMe = await photoWithThumbnailToMediumModel(memberMediumDocumentId,
        fileInfo, fileInfoThumbnail, enrichedPhoto);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadPhotoFile(
      String memberMediumDocumentID,
      String filePath,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
    await UploadInfo.uploadFile(memberMediumDocumentID, filePath, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    var baseName = BaseNameHelper.baseName(memberMediumDocumentID, filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(memberMediumDocumentID, filePath);

    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedPhoto.thumbNailData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception('fileInfoThumbnail is null');
    }

    var returnMe = await photoWithThumbnailToMediumModel(memberMediumDocumentID,
        fileInfo, fileInfoThumbnail, enrichedPhoto);

    _feedBackAggregatedProgress(1, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a photo from an asset for a given app with appId
   *
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   */
  Future<T> createThumbnailUploadPhotoAsset(
      String memberMediumDocumentID,
      String assetPath,
      {FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(memberMediumDocumentID, assetPath);
    return createThumbnailUploadPhotoFile(memberMediumDocumentID,
        filePath, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload photo + thumbnail to firestore storage
   */
  Future<T> uploadPhotoWithThumbnail(
      String memberMediumDocumentID,
      PhotoWithThumbnail photoWithThumbnail,
      {FeedbackProgress? feedbackProgress}) async {
    var fileInfo = await UploadInfo.uploadData(
        photoWithThumbnail.photoData.baseName,
        photoWithThumbnail.photoData.data,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 3, progress, feedbackProgress: feedbackProgress));

    var thumbnailInfo = await UploadInfo.uploadData(
        photoWithThumbnail.thumbNailData.baseName,
        photoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(2, 3, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload photo with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    var returnMe = await photoWithThumbnailToMediumModel(memberMediumDocumentID, fileInfo, thumbnailInfo,
        photoWithThumbnail);
    _feedBackAggregatedProgress(3, 3, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload video + thumbnail to firestore storage
   */
  Future<T> uploadVideoWithThumbnail(
      String memberMediumDocumentID,
      VideoWithThumbnail videoWithThumbnail,
      {FeedbackProgress? feedbackProgress}) async {
    var fileInfo = await UploadInfo.uploadData(
        videoWithThumbnail.videoData.baseName,
        videoWithThumbnail.videoData.data,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 3, progress, feedbackProgress: feedbackProgress));

    var thumbnailInfo = await UploadInfo.uploadData(
        videoWithThumbnail.thumbNailData.baseName,
        videoWithThumbnail.thumbNailData.data,
        appId,
        ownerId,
        packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(2, 3, progress, feedbackProgress: feedbackProgress));

    if (fileInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. fileInfo is null ');
    }

    if (thumbnailInfo == null) {
      throw Exception(
          'Unable to upload video with thumbnail with baseName = $basename. thumbnailInfo is null ');
    }

    var returnMe = await videoWithThumbnailToMediumModel(memberMediumDocumentID, fileInfo, thumbnailInfo,
        videoWithThumbnail);
    _feedBackAggregatedProgress(3, 3, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a photo from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> uploadThumbnailAndPhoto(
      String memberMediumDocumentID,
      String filePath,
      String thumbnailPath,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
    await UploadInfo.uploadFile(memberMediumDocumentID, filePath, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    // var photoData = await createThumbNailFromPhoto(filePath);
    var baseName = BaseNameHelper.baseName(memberMediumDocumentID, filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(memberMediumDocumentID, filePath);

    var enrichedPhoto = await MediumData.enrichPhoto(
        baseName, thumbnailBaseName, File(filePath).readAsBytesSync());
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedPhoto.thumbNailData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    var returnMe = await photoWithThumbnailToMediumModel(memberMediumDocumentID,
        fileInfo, fileInfoThumbnail, enrichedPhoto);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a video from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadVideoAsset(
      String memberMediumDocumentID,
      String assetPath,
      {FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(memberMediumDocumentID, assetPath);
    return createThumbnailUploadVideoFile(memberMediumDocumentID, filePath, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadVideoFile(
      String memberMediumDocumentID,
      String filePath,
      {FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    var fileInfo =
    await UploadInfo.uploadFile(memberMediumDocumentID, filePath, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
        _feedBackAggregatedProgress(1, 4, progress, feedbackProgress: feedbackProgress));

    // Second, create the thumbnail
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(memberMediumDocumentID, filePath);
    var enrichedVideo = await MediumData.enrichVideoWithPath(memberMediumDocumentID, filePath);
    _feedBackAggregatedProgress(2, 4, 1, feedbackProgress: feedbackProgress);

    // Third, upload the thumbnail;
    var fileInfoThumbnail = await UploadInfo.uploadData(thumbnailBaseName,
        enrichedVideo.thumbNailData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));

    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file $filePath. Could not create thumbnail');
    }

    var returnMe = await videoWithThumbnailToMediumModel(memberMediumDocumentID,
        fileInfo, fileInfoThumbnail, enrichedVideo);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a video from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadVideoData(
      String memberMediumDocumentID,
      Uint8List fileData,
      String baseName,
      String thumbnailBaseName,
      {FeedbackProgress? feedbackProgress}) async {
    print('MemberMediumHelper.createThumbnailUploadVideoData: ' + baseName);

    // First, upload the file
    var fileInfo = await UploadInfo.uploadData(
        baseName, fileData, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
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
        enrichedVideo.thumbNailData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
            _feedBackAggregatedProgress(3, 4, progress, feedbackProgress: feedbackProgress));
    if (fileInfoThumbnail == null) {
      throw Exception(
          'Unable to upload file with baseName $baseName. Could not create fileInfoThumbnail');
    }

    var returnMe = await videoWithThumbnailToMediumModel(memberMediumDocumentID,
        fileInfo, fileInfoThumbnail, enrichedVideo);
    _feedBackAggregatedProgress(4, 4, 1, feedbackProgress: feedbackProgress);
    return returnMe;
  }

  /*
   * Upload a pdf from an asset for a given app with appId
   * Asset specified by assetPath. See details about assetPath in _getFileFromAssets.
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadPdfAsset(
      String memberMediumDocumentID,
      String assetPath,
      String documentID,
      {PdfAvailable? feedbackFunction,
        FeedbackProgress? feedbackProgress}) async {
    var filePath = await AssetHelper.getFileFromAssets(memberMediumDocumentID, assetPath);

    return createThumbnailUploadPdfFile(memberMediumDocumentID,
        filePath, documentID, feedbackFunction: feedbackFunction, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload a pdf in  from a file for a given app with appId
   * filePath is the path to the file
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   */
  Future<T> createThumbnailUploadPdfFile(
      String memberMediumDocumentID,
      String filePath,
      String documentID,
      {PdfAvailable? feedbackFunction, FeedbackProgress? feedbackProgress}) async {
    // First, upload the file
    final document = await PdfDocument.openFile(filePath);
    final pageCount = await document.pagesCount;
    var taskCounter = 1;
    var totalTasks = 4 + (pageCount * 4);

    var fileInfo =
    await UploadInfo.uploadFile(memberMediumDocumentID, filePath, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
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
        photoData.thumbNailData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
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
          packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
          _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

      // Third, upload the image
      taskCounter++;
      var pageImage = await UploadInfo.uploadData(pageData.photoData.baseName,
          pageData.photoData.data, appId, ownerId, packageName, readAccessCustomMetaData(), feedbackProgress: (progress) =>
              _feedBackAggregatedProgress(taskCounter, totalTasks, progress, feedbackProgress: feedbackProgress));

      // Create the MediumModel representation
      await constructMediumModel(newDocumentID, pageImage, pageThumbnail, pageData, previousMediumId);

      previousMediumId = newDocumentID;
      taskCounter++;
      _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);
    }

    // Create the ImageModel
    var returnMe = await constructMediumModel(documentID, fileInfo, fileInfoThumbnail, photoData, previousMediumId);

    taskCounter++;
    _feedBackAggregatedProgress(taskCounter, totalTasks, 1, feedbackProgress: feedbackProgress);
    if (feedbackFunction != null) {
      feedbackFunction(returnMe);
    }
    return returnMe;
  }

}
