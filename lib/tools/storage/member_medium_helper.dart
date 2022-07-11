import 'dart:async';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'medium_base.dart';
import 'medium_helper.dart';
import 'upload_info.dart';

MediumType memberMediumType(AbstractMediumType abstractMediumType) {
  return toMediumType(abstractMediumType.index);
}

/*
 * This helper allows to upload MemberMediumFiles, i.e. files in the category "read_access"
 */
class MemberMediumHelper extends MediumHelper<MemberMediumModel> {
  static String PACKAGENAME = 'read_access';
//  final List<String> readAccess;
  MemberMediumAccessibleByGroup accessibleByGroup;
  List<String>? accessibleByMembers;

  MemberMediumHelper(AppModel app, String ownerId,
      /*this.readAccess, */ this.accessibleByGroup,
      {this.accessibleByMembers})
      : super(app, ownerId, PACKAGENAME);

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
    // there's basically onlythe need to have owner and readAccess as part of the meta data when it comes to the rules
    // and these are also set by the firebase functions. However, we set owner and readAccess here because
    // that firebase function runs when creating the document, not when creating the file. Hence
    // why we provide a default value to allow the owner to read the file after it was created, allowing the retrieve the downloadURL.
    // We could the accessibleByGroup and accessibleByMember to not be part of metadata as it's actually not
    // currently used for anything
    var customMetaData = {
      'owner': ownerId,
//      'accessibleByGroup': accessibleByGroup.index.toString(),
      'readAccess': ownerId + ';',
    };
/*
    if (accessibleByMembers != null) {
      customMetaData['accessibleByMembers'] =
          accessibleByMembers!.join(';') + ';';
    }
*/
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
      {String? relatedMediumId}) async {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = MemberMediumModel(
      documentID: memberMediumDocumentId,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      appId: app.documentID,
      authorId: ownerId,
      ref: fileInfo.ref,
      refThumbnail: fileInfoThumbnail.ref,
      url: fileInfo.url,
      accessibleByGroup: accessibleByGroup,
      accessibleByMembers: accessibleByMembers,
      mediumType: MediumType.Photo,
      urlThumbnail: fileInfoThumbnail.url,
      mediumWidth: photoWithThumbnail.photoData.width,
      mediumHeight: photoWithThumbnail.photoData.height,
      thumbnailWidth: photoWithThumbnail.thumbNailData.width,
      thumbnailHeight: photoWithThumbnail.thumbNailData.height,
      readAccess: [
        ownerId
      ], // default readAccess to the owner. The function will expand this based on accessibleByGroup/Members
      relatedMediumId: relatedMediumId,
    );
    return memberMediumRepository(appId: app.documentID)!.add(memberImageModel);
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
      {String? relatedMediumId}) {
    // Create the MemberImageModel
    var memberImageModel;

    // Create the MemberImageModel
    memberImageModel = MemberMediumModel(
        documentID: memberMediumDocumentId,
        base: MediumHelper.getBaseName(baseName),
        ext: MediumHelper.getExtension(baseName),
        appId: app.documentID,
        authorId: ownerId,
        ref: fileInfo.ref,
        refThumbnail: fileInfoThumbnail.ref,
        url: fileInfo.url,
        accessibleByGroup: accessibleByGroup,
        accessibleByMembers: accessibleByMembers,
        mediumType: MediumType.Video,
        urlThumbnail: fileInfoThumbnail.url,
        /*
      mediumWidth: videoWithThumbnail.videoData.width,
      mediumHeight: videoWithThumbnail.videoData.height,
      */
        thumbnailWidth: videoWithThumbnail.thumbNailData.width,
        thumbnailHeight: videoWithThumbnail.thumbNailData.height,
        readAccess: [
          ownerId
        ], // default readAccess to the owner. The function will expand this based on accessibleByGroup/Members
        relatedMediumId: relatedMediumId);
    return memberMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }

  @override
  Future<MemberMediumModel> constructMediumModel(
    String newDocumentID,
    String baseName,
    UploadInfo? pageImage,
    UploadInfo? pageThumbnail,
    PhotoWithThumbnail pageData,
    AbstractMediumType type,
    dynamic previousMediumId,
  ) async {
    var pageImageModel = MemberMediumModel(
      documentID: newDocumentID,
      base: MediumHelper.getBaseName(baseName),
      ext: MediumHelper.getExtension(baseName),
      appId: app.documentID,
      authorId: ownerId,
      url: pageImage == null ? null : pageImage.url,
      ref: pageImage == null ? null : pageImage.ref,
      refThumbnail: pageThumbnail == null ? null : pageThumbnail.ref,
      urlThumbnail: pageThumbnail == null ? null : pageThumbnail.url,
      mediumType: memberMediumType(type),
      mediumWidth: pageData.photoData.width,
      mediumHeight: pageData.photoData.height,
      accessibleByGroup: accessibleByGroup,
      accessibleByMembers: accessibleByMembers,
      thumbnailWidth: pageData.thumbNailData.width,
      thumbnailHeight: pageData.thumbNailData.height,
      relatedMediumId: previousMediumId,
      readAccess: [
        ownerId
      ], // default readAccess to the owner. The function will expand this based on accessibleByGroup/Members
    );
    return await memberMediumRepository(appId: app.documentID)!
        .add(pageImageModel);
  }

  @override
  Future<MemberMediumModel> textToMediumModel(
      String memberMediumDocumentId, String baseName, UploadInfo fileInfo,
      {String? relatedMediumId}) async {
    // Create the MemberImageModel
    var memberImageModel;

    memberImageModel = MemberMediumModel(
        documentID: memberMediumDocumentId,
        base: MediumHelper.getBaseName(baseName),
        ext: MediumHelper.getExtension(baseName),
        appId: app.documentID,
        authorId: ownerId,
        ref: fileInfo.ref,
        refThumbnail: null,
        url: fileInfo.url,
        accessibleByGroup: accessibleByGroup,
        accessibleByMembers: accessibleByMembers,
        mediumType: MediumType.Text,
        urlThumbnail: null,
        mediumWidth: 0,
        mediumHeight: 0,
        thumbnailWidth: 0,
        thumbnailHeight: 0,
        readAccess: [
          ownerId
        ], // default readAccess to the owner. The function will expand this based on accessibleByGroup/Members
        relatedMediumId: relatedMediumId);
    return memberMediumRepository(appId: app.documentID)!.add(memberImageModel);
  }
}
