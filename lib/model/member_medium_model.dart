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
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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
  Photo, Video, Unknown
}


MediumType toMediumType(int index) {
  switch (index) {
    case 0: return MediumType.Photo;
    case 1: return MediumType.Video;
  }
  return MediumType.Unknown;
}


class MemberMediumModel {
  String documentID;
  String appId;
  String authorId;
  String url;
  String urlThumbnail;
  List<String> readAccess;
  MediumType mediumType;
  int mediumWidth;
  int mediumHeight;
  int thumbnailWidth;
  int thumbnailHeight;

  MemberMediumModel({this.documentID, this.appId, this.authorId, this.url, this.urlThumbnail, this.readAccess, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, })  {
    assert(documentID != null);
  }

  MemberMediumModel copyWith({String documentID, String appId, String authorId, String url, String urlThumbnail, List<String> readAccess, MediumType mediumType, int mediumWidth, int mediumHeight, int thumbnailWidth, int thumbnailHeight, }) {
    return MemberMediumModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, authorId: authorId ?? this.authorId, url: url ?? this.url, urlThumbnail: urlThumbnail ?? this.urlThumbnail, readAccess: readAccess ?? this.readAccess, mediumType: mediumType ?? this.mediumType, mediumWidth: mediumWidth ?? this.mediumWidth, mediumHeight: mediumHeight ?? this.mediumHeight, thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth, thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ authorId.hashCode ^ url.hashCode ^ urlThumbnail.hashCode ^ readAccess.hashCode ^ mediumType.hashCode ^ mediumWidth.hashCode ^ mediumHeight.hashCode ^ thumbnailWidth.hashCode ^ thumbnailHeight.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is MemberMediumModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          authorId == other.authorId &&
          url == other.url &&
          urlThumbnail == other.urlThumbnail &&
          ListEquality().equals(readAccess, other.readAccess) &&
          mediumType == other.mediumType &&
          mediumWidth == other.mediumWidth &&
          mediumHeight == other.mediumHeight &&
          thumbnailWidth == other.thumbnailWidth &&
          thumbnailHeight == other.thumbnailHeight;

  @override
  String toString() {
    String readAccessCsv = (readAccess == null) ? '' : readAccess.join(', ');

    return 'MemberMediumModel{documentID: $documentID, appId: $appId, authorId: $authorId, url: $url, urlThumbnail: $urlThumbnail, readAccess: String[] { $readAccessCsv }, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight}';
  }

  MemberMediumEntity toEntity({String appId}) {
    return MemberMediumEntity(
          appId: (appId != null) ? appId : null, 
          authorId: (authorId != null) ? authorId : null, 
          url: (url != null) ? url : null, 
          urlThumbnail: (urlThumbnail != null) ? urlThumbnail : null, 
          readAccess: (readAccess != null) ? readAccess : null, 
          mediumType: (mediumType != null) ? mediumType.index : null, 
          mediumWidth: (mediumWidth != null) ? mediumWidth : null, 
          mediumHeight: (mediumHeight != null) ? mediumHeight : null, 
          thumbnailWidth: (thumbnailWidth != null) ? thumbnailWidth : null, 
          thumbnailHeight: (thumbnailHeight != null) ? thumbnailHeight : null, 
    );
  }

  static MemberMediumModel fromEntity(String documentID, MemberMediumEntity entity) {
    if (entity == null) return null;
    return MemberMediumModel(
          documentID: documentID, 
          appId: entity.appId, 
          authorId: entity.authorId, 
          url: entity.url, 
          urlThumbnail: entity.urlThumbnail, 
          readAccess: entity.readAccess, 
          mediumType: toMediumType(entity.mediumType), 
          mediumWidth: entity.mediumWidth, 
          mediumHeight: entity.mediumHeight, 
          thumbnailWidth: entity.thumbnailWidth, 
          thumbnailHeight: entity.thumbnailHeight, 
    );
  }

  static Future<MemberMediumModel> fromEntityPlus(String documentID, MemberMediumEntity entity, { String appId}) async {
    if (entity == null) return null;

    return MemberMediumModel(
          documentID: documentID, 
          appId: entity.appId, 
          authorId: entity.authorId, 
          url: entity.url, 
          urlThumbnail: entity.urlThumbnail, 
          readAccess: entity.readAccess, 
          mediumType: toMediumType(entity.mediumType), 
          mediumWidth: entity.mediumWidth, 
          mediumHeight: entity.mediumHeight, 
          thumbnailWidth: entity.thumbnailWidth, 
          thumbnailHeight: entity.thumbnailHeight, 
    );
  }

}
