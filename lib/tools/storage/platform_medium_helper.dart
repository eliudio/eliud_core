import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';

import 'medium_base.dart';
import 'medium_helper.dart';
import 'upload_info.dart';

PlatformMediumType platformMediumType(AbstractMediumType abstractMediumType) {
  return toPlatformMediumType(abstractMediumType.index);
}

/*
 * This helper allows to upload PlatformMediumModel, i.e. files in the category "priv_req"
 */
class PlatformMediumHelper extends MediumHelper<PlatformMediumModel> {
  static String thePackageName = 'priv_req';
  final PrivilegeLevelRequiredSimple privilegeLevelRequired;

  PlatformMediumHelper(
      AppModel app, String ownerId, this.privilegeLevelRequired)
      : super(app, ownerId, thePackageName);

  /*
   * Create custom meta data.
   *
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   *
   * Usage: When you need to construct meta data for a file before uploading. Set the owner and read access rights.
   */
  @override
  Map<String, String> readAccessCustomMetaData() {
    var customMetaData = {
      'owner': ownerId,
      'privilegeRequired': privilegeLevelRequired.index.toString()
    };
    return customMetaData;
  }

  /*
   * Construct and add PlatformMedium representation entry for photo and it's thumbnail to repository
   */
  @override
  Future<PlatformMediumModel> photoWithThumbnailToMediumModel(
      String mediumDocumentId,
      String baseName,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      PhotoWithThumbnail photoWithThumbnail,
      {String? relatedMediumId}) async {
    // Create the MemberImageModel
    PlatformMediumModel memberImageModel;

    memberImageModel = PlatformMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      appId: app.documentID,
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      conditions: StorageConditionsModel(
          privilegeLevelRequired: privilegeLevelRequired),
      mediumType: PlatformMediumType.photo,
      urlThumbnail: fileInfoThumbnail.url,
      mediumWidth: photoWithThumbnail.photoData.width,
      mediumHeight: photoWithThumbnail.photoData.height,
      thumbnailWidth: photoWithThumbnail.thumbNailData.width,
      thumbnailHeight: photoWithThumbnail.thumbNailData.height,
      relatedMediumId: relatedMediumId,
    );
    return platformMediumRepository(appId: app.documentID)!
        .add(memberImageModel);
  }

  /*
   * Construct and add PlatformMedium representation entry for video and it's thumbnail to repository
   */
  @override
  Future<PlatformMediumModel> videoWithThumbnailToMediumModel(
      String mediumDocumentId,
      String baseName,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      VideoWithThumbnail videoWithThumbnail,
      {String? relatedMediumId}) {
    // Create the MemberImageModel
    PlatformMediumModel memberImageModel;

    // Create the MemberImageModel
    memberImageModel = PlatformMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      appId: app.documentID,
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      conditions: StorageConditionsModel(
          privilegeLevelRequired: privilegeLevelRequired),
      mediumType: PlatformMediumType.video,
      urlThumbnail: fileInfoThumbnail.url,
      /*
      mediumWidth: videoWithThumbnail.videoData.width,
      mediumHeight: videoWithThumbnail.videoData.height,
      */
      thumbnailWidth: videoWithThumbnail.thumbNailData.width,
      thumbnailHeight: videoWithThumbnail.thumbNailData.height,
      relatedMediumId: relatedMediumId,
    );
    return platformMediumRepository(appId: app.documentID)!
        .add(memberImageModel);
  }

  @override
  Future<PlatformMediumModel> constructMediumModel(
      String newDocumentID,
      String baseName,
      UploadInfo? pageImage,
      UploadInfo? pageThumbnail,
      PhotoWithThumbnail pageData,
      AbstractMediumType type,
      dynamic previousMediumId) async {
    var pageImageModel = PlatformMediumModel(
        documentID: newDocumentID,
        base: MediumHelper.getBaseName(baseName),
        ext: MediumHelper.getExtension(baseName),
        appId: app.documentID,
        authorId: ownerId,
        url: pageImage?.url,
        ref: pageImage?.ref,
        refThumbnail: pageThumbnail?.ref,
        urlThumbnail: pageThumbnail?.url,
        conditions: StorageConditionsModel(
            privilegeLevelRequired: privilegeLevelRequired),
        mediumType: platformMediumType(type),
        mediumWidth: pageData.photoData.width,
        mediumHeight: pageData.photoData.height,
        thumbnailWidth: pageData.thumbNailData.width,
        thumbnailHeight: pageData.thumbNailData.height,
        relatedMediumId: previousMediumId);
    return await platformMediumRepository(appId: app.documentID)!
        .add(pageImageModel);
  }

  @override
  Future<PlatformMediumModel> textToMediumModel(
      String mediumDocumentId, String baseName, UploadInfo fileInfo,
      {String? relatedMediumId}) {
    // Create the MemberImageModel
    PlatformMediumModel memberImageModel;

    memberImageModel = PlatformMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      appId: app.documentID,
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: null,
      url: fileInfo.url,
      conditions: StorageConditionsModel(
          privilegeLevelRequired: privilegeLevelRequired),
      mediumType: PlatformMediumType.text,
      urlThumbnail: null,
      mediumWidth: null,
      mediumHeight: null,
      thumbnailWidth: null,
      thumbnailHeight: null,
      relatedMediumId: relatedMediumId,
    );
    return platformMediumRepository(appId: app.documentID)!
        .add(memberImageModel);
  }
}
