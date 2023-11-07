import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';

import 'medium_base.dart';
import 'medium_helper.dart';
import 'upload_info.dart';

PublicMediumType publicMediumType(AbstractMediumType abstractMediumType) {
  return toPublicMediumType(abstractMediumType.index);
}

/*
 * This helper allows to upload PublicMediumModel, i.e. files in the category "public"
 */
class PublicMediumHelper extends MediumHelper<PublicMediumModel> {
  static String thisPackageName = 'public';

  PublicMediumHelper(AppModel app, String ownerId)
      : super(app, ownerId, thisPackageName);

  /*
   * Create custom meta data.
   *
   * ownerId is the memberId
   *
   * Usage: When you need to construct meta data for a file before uploading. Set the owner so
   * everybody can create files
   * the owner is the only one who can overwrite his own image later
   */
  @override
  Map<String, String> readAccessCustomMetaData() {
    var customMetaData = {
      'owner': ownerId,
    };
    return customMetaData;
  }

  /*
   * Construct and add PublicMedium representation entry for photo and it's thumbnail to repository
   */
  @override
  Future<PublicMediumModel> photoWithThumbnailToMediumModel(
      String mediumDocumentId,
      String baseName,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      PhotoWithThumbnail photoWithThumbnail,
      {String? relatedMediumId}) async {
    // Create the MemberImageModel
    PublicMediumModel memberImageModel;

    memberImageModel = PublicMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      mediumType: PublicMediumType.photo,
      urlThumbnail: fileInfoThumbnail.url,
      mediumWidth: photoWithThumbnail.photoData.width,
      mediumHeight: photoWithThumbnail.photoData.height,
      thumbnailWidth: photoWithThumbnail.thumbNailData.width,
      thumbnailHeight: photoWithThumbnail.thumbNailData.height,
      relatedMediumId: relatedMediumId,
    );
    return publicMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }

  /*
   * Construct and add PublicMedium representation entry for video and it's thumbnail to repository
   */
  @override
  Future<PublicMediumModel> videoWithThumbnailToMediumModel(
      String mediumDocumentId,
      String baseName,
      UploadInfo fileInfo,
      UploadInfo fileInfoThumbnail,
      VideoWithThumbnail videoWithThumbnail,
      {String? relatedMediumId}) {
    // Create the MemberImageModel
    PublicMediumModel memberImageModel;

    // Create the MemberImageModel
    memberImageModel = PublicMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      mediumType: PublicMediumType.video,
      urlThumbnail: fileInfoThumbnail.url,
      /*
      mediumWidth: videoWithThumbnail.videoData.width,
      mediumHeight: videoWithThumbnail.videoData.height,
      */
      thumbnailWidth: videoWithThumbnail.thumbNailData.width,
      thumbnailHeight: videoWithThumbnail.thumbNailData.height,
      relatedMediumId: relatedMediumId,
    );
    return publicMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }

  @override
  Future<PublicMediumModel> constructMediumModel(
      String newDocumentID,
      String baseName,
      UploadInfo? pageImage,
      UploadInfo? pageThumbnail,
      PhotoWithThumbnail pageData,
      AbstractMediumType type,
      dynamic previousMediumId) async {
    var pageImageModel = PublicMediumModel(
        documentID: newDocumentID,
        base: MediumHelper.getBaseName(baseName),
        ext: MediumHelper.getExtension(baseName),
        authorId: ownerId,
        url: pageImage?.url,
        ref: pageImage?.ref,
        refThumbnail: pageThumbnail?.ref,
        urlThumbnail: pageThumbnail?.url,
        mediumType: publicMediumType(type),
        mediumWidth: pageData.photoData.width,
        mediumHeight: pageData.photoData.height,
        thumbnailWidth: pageData.thumbNailData.width,
        thumbnailHeight: pageData.thumbNailData.height,
        relatedMediumId: previousMediumId);
    return await publicMediumRepository(appId: app.documentID)!
        .add(pageImageModel);
  }

  @override
  Future<PublicMediumModel> textToMediumModel(
      String mediumDocumentId, String baseName, UploadInfo fileInfo,
      {String? relatedMediumId}) {
    // Create the MemberImageModel
    PublicMediumModel memberImageModel;

    memberImageModel = PublicMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: null,
      url: fileInfo.url,
      mediumType: PublicMediumType.text,
      urlThumbnail: null,
      mediumWidth: null,
      mediumHeight: null,
      thumbnailWidth: null,
      thumbnailHeight: null,
      relatedMediumId: relatedMediumId,
    );
    return publicMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }
}
