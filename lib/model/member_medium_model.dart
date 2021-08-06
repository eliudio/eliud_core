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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/member_medium_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum MediumType {
  Photo, Video, Pdf, Unknown
}


MediumType toMediumType(int? index) {
  switch (index) {
    case 0: return MediumType.Photo;
    case 1: return MediumType.Video;
    case 2: return MediumType.Pdf;
  }
  return MediumType.Unknown;
}


class MemberMediumModel {
  String? documentID;
  String? appId;
  String? authorId;
  String? url;
  String? ref;
  String? urlThumbnail;
  String? refThumbnail;
  List<String>? readAccess;
  MediumType? mediumType;
  int? mediumWidth;
  int? mediumHeight;
  int? thumbnailWidth;
  int? thumbnailHeight;

  // In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.
  String? relatedMediumId;

  MemberMediumModel({this.documentID, this.appId, this.authorId, this.url, this.ref, this.urlThumbnail, this.refThumbnail, this.readAccess, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, this.relatedMediumId, })  {
    assert(documentID != null);
  }

  MemberMediumModel copyWith({String? documentID, String? appId, String? authorId, String? url, String? ref, String? urlThumbnail, String? refThumbnail, List<String>? readAccess, MediumType? mediumType, int? mediumWidth, int? mediumHeight, int? thumbnailWidth, int? thumbnailHeight, String? relatedMediumId, }) {
    return MemberMediumModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, authorId: authorId ?? this.authorId, url: url ?? this.url, ref: ref ?? this.ref, urlThumbnail: urlThumbnail ?? this.urlThumbnail, refThumbnail: refThumbnail ?? this.refThumbnail, readAccess: readAccess ?? this.readAccess, mediumType: mediumType ?? this.mediumType, mediumWidth: mediumWidth ?? this.mediumWidth, mediumHeight: mediumHeight ?? this.mediumHeight, thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth, thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight, relatedMediumId: relatedMediumId ?? this.relatedMediumId, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ authorId.hashCode ^ url.hashCode ^ ref.hashCode ^ urlThumbnail.hashCode ^ refThumbnail.hashCode ^ readAccess.hashCode ^ mediumType.hashCode ^ mediumWidth.hashCode ^ mediumHeight.hashCode ^ thumbnailWidth.hashCode ^ thumbnailHeight.hashCode ^ relatedMediumId.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          authorId == other.authorId &&
          url == other.url &&
          ref == other.ref &&
          urlThumbnail == other.urlThumbnail &&
          refThumbnail == other.refThumbnail &&
          ListEquality().equals(readAccess, other.readAccess) &&
          mediumType == other.mediumType &&
          mediumWidth == other.mediumWidth &&
          mediumHeight == other.mediumHeight &&
          thumbnailWidth == other.thumbnailWidth &&
          thumbnailHeight == other.thumbnailHeight &&
          relatedMediumId == other.relatedMediumId;

  @override
  String toString() {
    String readAccessCsv = (readAccess == null) ? '' : readAccess!.join(', ');

    return 'MemberMediumModel{documentID: $documentID, appId: $appId, authorId: $authorId, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, readAccess: String[] { $readAccessCsv }, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  MemberMediumEntity toEntity({String? appId}) {
    return MemberMediumEntity(
          appId: (appId != null) ? appId : null, 
          authorId: (authorId != null) ? authorId : null, 
          url: (url != null) ? url : null, 
          ref: (ref != null) ? ref : null, 
          urlThumbnail: (urlThumbnail != null) ? urlThumbnail : null, 
          refThumbnail: (refThumbnail != null) ? refThumbnail : null, 
          readAccess: (readAccess != null) ? readAccess : null, 
          mediumType: (mediumType != null) ? mediumType!.index : null, 
          mediumWidth: (mediumWidth != null) ? mediumWidth : null, 
          mediumHeight: (mediumHeight != null) ? mediumHeight : null, 
          thumbnailWidth: (thumbnailWidth != null) ? thumbnailWidth : null, 
          thumbnailHeight: (thumbnailHeight != null) ? thumbnailHeight : null, 
          relatedMediumId: (relatedMediumId != null) ? relatedMediumId : null, 
    );
  }

  static MemberMediumModel? fromEntity(String documentID, MemberMediumEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return MemberMediumModel(
          documentID: documentID, 
          appId: entity.appId, 
          authorId: entity.authorId, 
          url: entity.url, 
          ref: entity.ref, 
          urlThumbnail: entity.urlThumbnail, 
          refThumbnail: entity.refThumbnail, 
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
          appId: entity.appId, 
          authorId: entity.authorId, 
          url: entity.url, 
          ref: entity.ref, 
          urlThumbnail: entity.urlThumbnail, 
          refThumbnail: entity.refThumbnail, 
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

