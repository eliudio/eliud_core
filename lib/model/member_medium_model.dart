/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_medium_entity.dart';

import 'package:eliud_core/tools/helpers/medium_collect_references.dart';

enum MemberMediumAccessibleByGroup {
  Public, Followers, Me, SpecificMembers, Unknown
}

enum MediumType {
  Photo, Video, Pdf, Text, Unknown
}


MemberMediumAccessibleByGroup toMemberMediumAccessibleByGroup(int? index) {
  switch (index) {
    case 0: return MemberMediumAccessibleByGroup.Public;
    case 1: return MemberMediumAccessibleByGroup.Followers;
    case 2: return MemberMediumAccessibleByGroup.Me;
    case 3: return MemberMediumAccessibleByGroup.SpecificMembers;
  }
  return MemberMediumAccessibleByGroup.Unknown;
}

MediumType toMediumType(int? index) {
  switch (index) {
    case 0: return MediumType.Photo;
    case 1: return MediumType.Video;
    case 2: return MediumType.Pdf;
    case 3: return MediumType.Text;
  }
  return MediumType.Unknown;
}


class MemberMediumModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'memberMediums';

  String documentID;
  String appId;
  String? authorId;
  String? base;
  String? ext;
  String? url;
  String? ref;
  String? urlThumbnail;
  String? refThumbnail;
  MemberMediumAccessibleByGroup? accessibleByGroup;

  // In case accessibleByGroup == SpecificMembers, then these are the members
  List<String>? accessibleByMembers;
  List<String>? readAccess;
  MediumType? mediumType;
  int? mediumWidth;
  int? mediumHeight;
  int? thumbnailWidth;
  int? thumbnailHeight;

  // In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.
  String? relatedMediumId;

  MemberMediumModel({required this.documentID, required this.appId, this.authorId, this.base, this.ext, this.url, this.ref, this.urlThumbnail, this.refThumbnail, this.accessibleByGroup, this.accessibleByMembers, this.readAccess, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, this.relatedMediumId, })  {
  }

  MemberMediumModel copyWith({String? documentID, String? appId, String? authorId, String? base, String? ext, String? url, String? ref, String? urlThumbnail, String? refThumbnail, MemberMediumAccessibleByGroup? accessibleByGroup, List<String>? accessibleByMembers, List<String>? readAccess, MediumType? mediumType, int? mediumWidth, int? mediumHeight, int? thumbnailWidth, int? thumbnailHeight, String? relatedMediumId, }) {
    return MemberMediumModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, authorId: authorId ?? this.authorId, base: base ?? this.base, ext: ext ?? this.ext, url: url ?? this.url, ref: ref ?? this.ref, urlThumbnail: urlThumbnail ?? this.urlThumbnail, refThumbnail: refThumbnail ?? this.refThumbnail, accessibleByGroup: accessibleByGroup ?? this.accessibleByGroup, accessibleByMembers: accessibleByMembers ?? this.accessibleByMembers, readAccess: readAccess ?? this.readAccess, mediumType: mediumType ?? this.mediumType, mediumWidth: mediumWidth ?? this.mediumWidth, mediumHeight: mediumHeight ?? this.mediumHeight, thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth, thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight, relatedMediumId: relatedMediumId ?? this.relatedMediumId, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ authorId.hashCode ^ base.hashCode ^ ext.hashCode ^ url.hashCode ^ ref.hashCode ^ urlThumbnail.hashCode ^ refThumbnail.hashCode ^ accessibleByGroup.hashCode ^ accessibleByMembers.hashCode ^ readAccess.hashCode ^ mediumType.hashCode ^ mediumWidth.hashCode ^ mediumHeight.hashCode ^ thumbnailWidth.hashCode ^ thumbnailHeight.hashCode ^ relatedMediumId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          authorId == other.authorId &&
          base == other.base &&
          ext == other.ext &&
          url == other.url &&
          ref == other.ref &&
          urlThumbnail == other.urlThumbnail &&
          refThumbnail == other.refThumbnail &&
          accessibleByGroup == other.accessibleByGroup &&
          ListEquality().equals(accessibleByMembers, other.accessibleByMembers) &&
          ListEquality().equals(readAccess, other.readAccess) &&
          mediumType == other.mediumType &&
          mediumWidth == other.mediumWidth &&
          mediumHeight == other.mediumHeight &&
          thumbnailWidth == other.thumbnailWidth &&
          thumbnailHeight == other.thumbnailHeight &&
          relatedMediumId == other.relatedMediumId;

  @override
  String toString() {
    String accessibleByMembersCsv = (accessibleByMembers == null) ? '' : accessibleByMembers!.join(', ');
    String readAccessCsv = (readAccess == null) ? '' : readAccess!.join(', ');

    return 'MemberMediumModel{documentID: $documentID, appId: $appId, authorId: $authorId, base: $base, ext: $ext, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, accessibleByGroup: $accessibleByGroup, accessibleByMembers: String[] { $accessibleByMembersCsv }, readAccess: String[] { $readAccessCsv }, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    referencesCollector.addAll(await mediumCollectReferences(appId: appId, relatedMediumId: relatedMediumId, repo: memberMediumRepository(appId: appId)!, packageName: packageName, id: id));
    return referencesCollector;
  }

  MemberMediumEntity toEntity({String? appId}) {
    return MemberMediumEntity(
          appId: (appId != null) ? appId : null, 
          authorId: (authorId != null) ? authorId : null, 
          base: (base != null) ? base : null, 
          ext: (ext != null) ? ext : null, 
          url: (url != null) ? url : null, 
          ref: (ref != null) ? ref : null, 
          urlThumbnail: (urlThumbnail != null) ? urlThumbnail : null, 
          refThumbnail: (refThumbnail != null) ? refThumbnail : null, 
          accessibleByGroup: (accessibleByGroup != null) ? accessibleByGroup!.index : null, 
          accessibleByMembers: (accessibleByMembers != null) ? accessibleByMembers : null, 
          readAccess: (readAccess != null) ? readAccess : null, 
          mediumType: (mediumType != null) ? mediumType!.index : null, 
          mediumWidth: (mediumWidth != null) ? mediumWidth : null, 
          mediumHeight: (mediumHeight != null) ? mediumHeight : null, 
          thumbnailWidth: (thumbnailWidth != null) ? thumbnailWidth : null, 
          thumbnailHeight: (thumbnailHeight != null) ? thumbnailHeight : null, 
          relatedMediumId: (relatedMediumId != null) ? relatedMediumId : null, 
    );
  }

  static Future<MemberMediumModel?> fromEntity(String documentID, MemberMediumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberMediumModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          authorId: entity.authorId, 
          base: entity.base, 
          ext: entity.ext, 
          url: entity.url, 
          ref: entity.ref, 
          urlThumbnail: entity.urlThumbnail, 
          refThumbnail: entity.refThumbnail, 
          accessibleByGroup: toMemberMediumAccessibleByGroup(entity.accessibleByGroup), 
          accessibleByMembers: entity.accessibleByMembers, 
          readAccess: entity.readAccess, 
          mediumType: toMediumType(entity.mediumType), 
          mediumWidth: entity.mediumWidth, 
          mediumHeight: entity.mediumHeight, 
          thumbnailWidth: entity.thumbnailWidth, 
          thumbnailHeight: entity.thumbnailHeight, 
          relatedMediumId: entity.relatedMediumId, 
    );
  }

  static Future<MemberMediumModel?> fromEntityPlus(String documentID, MemberMediumEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return MemberMediumModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          authorId: entity.authorId, 
          base: entity.base, 
          ext: entity.ext, 
          url: entity.url, 
          ref: entity.ref, 
          urlThumbnail: entity.urlThumbnail, 
          refThumbnail: entity.refThumbnail, 
          accessibleByGroup: toMemberMediumAccessibleByGroup(entity.accessibleByGroup), 
          accessibleByMembers: entity.accessibleByMembers, 
          readAccess: entity.readAccess, 
          mediumType: toMediumType(entity.mediumType), 
          mediumWidth: entity.mediumWidth, 
          mediumHeight: entity.mediumHeight, 
          thumbnailWidth: entity.thumbnailWidth, 
          thumbnailHeight: entity.thumbnailHeight, 
          relatedMediumId: entity.relatedMediumId, 
    );
  }

}

