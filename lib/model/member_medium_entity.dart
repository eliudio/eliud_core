/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class MemberMediumEntity {
  final String? appId;
  final String? authorId;
  final String? url;
  final String? ref;
  final String? urlThumbnail;
  final String? refThumbnail;
  final List<String>? readAccess;
  final int? mediumType;
  final int? mediumWidth;
  final int? mediumHeight;
  final int? thumbnailWidth;
  final int? thumbnailHeight;
  final String? relatedMediumId;

  MemberMediumEntity({this.appId, this.authorId, this.url, this.ref, this.urlThumbnail, this.refThumbnail, this.readAccess, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, this.relatedMediumId, });


  List<Object?> get props => [appId, authorId, url, ref, urlThumbnail, refThumbnail, readAccess, mediumType, mediumWidth, mediumHeight, thumbnailWidth, thumbnailHeight, relatedMediumId, ];

  @override
  String toString() {
    String readAccessCsv = (readAccess == null) ? '' : readAccess!.join(', ');

    return 'MemberMediumEntity{appId: $appId, authorId: $authorId, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, readAccess: String[] { $readAccessCsv }, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  static MemberMediumEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return MemberMediumEntity(
      appId: map['appId'], 
      authorId: map['authorId'], 
      url: map['url'], 
      ref: map['ref'], 
      urlThumbnail: map['urlThumbnail'], 
      refThumbnail: map['refThumbnail'], 
      readAccess: map['readAccess'] == null ? null : List.from(map['readAccess']), 
      mediumType: map['mediumType'], 
      mediumWidth: int.tryParse(map['mediumWidth'].toString()), 
      mediumHeight: int.tryParse(map['mediumHeight'].toString()), 
      thumbnailWidth: int.tryParse(map['thumbnailWidth'].toString()), 
      thumbnailHeight: int.tryParse(map['thumbnailHeight'].toString()), 
      relatedMediumId: map['relatedMediumId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (authorId != null) theDocument["authorId"] = authorId;
      else theDocument["authorId"] = null;
    if (url != null) theDocument["url"] = url;
      else theDocument["url"] = null;
    if (ref != null) theDocument["ref"] = ref;
      else theDocument["ref"] = null;
    if (urlThumbnail != null) theDocument["urlThumbnail"] = urlThumbnail;
      else theDocument["urlThumbnail"] = null;
    if (refThumbnail != null) theDocument["refThumbnail"] = refThumbnail;
      else theDocument["refThumbnail"] = null;
    if (readAccess != null) theDocument["readAccess"] = readAccess!.toList();
      else theDocument["readAccess"] = null;
    if (mediumType != null) theDocument["mediumType"] = mediumType;
      else theDocument["mediumType"] = null;
    if (mediumWidth != null) theDocument["mediumWidth"] = mediumWidth;
      else theDocument["mediumWidth"] = null;
    if (mediumHeight != null) theDocument["mediumHeight"] = mediumHeight;
      else theDocument["mediumHeight"] = null;
    if (thumbnailWidth != null) theDocument["thumbnailWidth"] = thumbnailWidth;
      else theDocument["thumbnailWidth"] = null;
    if (thumbnailHeight != null) theDocument["thumbnailHeight"] = thumbnailHeight;
      else theDocument["thumbnailHeight"] = null;
    if (relatedMediumId != null) theDocument["relatedMediumId"] = relatedMediumId;
      else theDocument["relatedMediumId"] = null;
    return theDocument;
  }

  static MemberMediumEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

