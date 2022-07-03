import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
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
  static String PACKAGENAME = 'public';

  PublicMediumHelper(AppModel app, String ownerId)
      : super(app, ownerId, PACKAGENAME);

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
    String memberMediumDocumentId,
    String baseName,
    UploadInfo fileInfo,
    UploadInfo fileInfoThumbnail,
    PhotoWithThumbnail photoWithThumbnail,
  ) async {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = PublicMediumModel(
      documentID: memberMediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      mediumType: PublicMediumType.Photo,
      urlThumbnail: fileInfoThumbnail.url,
      mediumWidth: photoWithThumbnail.photoData.width,
      mediumHeight: photoWithThumbnail.photoData.height,
      thumbnailWidth: photoWithThumbnail.thumbNailData.width,
      thumbnailHeight: photoWithThumbnail.thumbNailData.height,
    );
    return publicMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }

  /*
   * Construct and add PublicMedium representation entry for video and it's thumbnail to repository
   */
  @override
  Future<PublicMediumModel> videoWithThumbnailToMediumModel(
    String memberMediumDocumentId,
    String baseName,
    UploadInfo fileInfo,
    UploadInfo fileInfoThumbnail,
    VideoWithThumbnail videoWithThumbnail,
  ) {
    // Create the MemberImageModel
    var memberImageModel;

    // Create the MemberImageModel
    memberImageModel = PublicMediumModel(
      documentID: memberMediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      mediumType: PublicMediumType.Video,
      urlThumbnail: fileInfoThumbnail.url,
      /*
      mediumWidth: videoWithThumbnail.videoData.width,
      mediumHeight: videoWithThumbnail.videoData.height,
      */
      thumbnailWidth: videoWithThumbnail.thumbNailData.width,
      thumbnailHeight: videoWithThumbnail.thumbNailData.height,
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
        url: pageImage == null ? null : pageImage.url,
        ref: pageImage == null ? null : pageImage.ref,
        refThumbnail: pageThumbnail == null ? null : pageThumbnail.ref,
        urlThumbnail: pageThumbnail == null ? null : pageThumbnail.url,
        mediumType: publicMediumType(type),
        mediumWidth: pageData.photoData.width,
        mediumHeight: pageData.photoData.height,
        thumbnailWidth: pageData.thumbNailData.width,
        thumbnailHeight: pageData.thumbNailData.height,
        relatedMediumId: previousMediumId);
    return await publicMediumRepository(appId: app.documentID)!.add(pageImageModel);
  }

  @override
  Future<PublicMediumModel> textToMediumModel(String mediumDocumentId, String baseName, UploadInfo fileInfo) {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = PublicMediumModel(
      documentID: mediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: null,
      url: fileInfo.url,
      mediumType: PublicMediumType.Text,
      urlThumbnail: null,
      mediumWidth: null,
      mediumHeight: null,
      thumbnailWidth: null,
      thumbnailHeight: null,
    );
    return publicMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }
}
