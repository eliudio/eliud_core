import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';

import 'medium_base.dart';
import 'medium_helper.dart';
import 'upload_info.dart';

class MemberMediumHelper extends MediumHelper<MemberMediumModel> {
  static String PACKAGENAME = 'read_access';
  final List<String> readAccess;

  MemberMediumHelper(String appId, String ownerId, this.readAccess)
      : super(appId, ownerId, PACKAGENAME);

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
      'readAccess': readAccess.join(';') + ';'
    };
    return customMetaData;
  }

  /*
   * Construct and add MemberMedium representation entry for photo and it's thumbnail to repository
   */
  @override
  Future<MemberMediumModel> photoWithThumbnailToMediumModel(
    String memberMediumDocumentId,
    String baseName,
    UploadInfo fileInfo,
    UploadInfo fileInfoThumbnail,
    PhotoWithThumbnail photoWithThumbnail,
  ) async {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = MemberMediumModel(
      documentID: memberMediumDocumentId,
      baseName: baseName,
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
   */
  @override
  Future<MemberMediumModel> videoWithThumbnailToMediumModel(
    String memberMediumDocumentId,
    String baseName,
    UploadInfo fileInfo,
    UploadInfo fileInfoThumbnail,
    VideoWithThumbnail videoWithThumbnail,
  ) {
    // Create the MemberImageModel
    var memberImageModel;

    // Create the MemberImageModel
    memberImageModel = MemberMediumModel(
      documentID: memberMediumDocumentId,
      baseName: baseName,
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

  @override
  Future<MemberMediumModel> constructMediumModel(
      String newDocumentID,
      String baseName,
      UploadInfo? pageImage,
      UploadInfo? pageThumbnail,
      PhotoWithThumbnail pageData,
      dynamic previousMediumId) async {
    var pageImageModel = MemberMediumModel(
        documentID: newDocumentID,
        baseName: baseName,
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
    return await memberMediumRepository(appId: appId)!.add(pageImageModel);
  }
}
