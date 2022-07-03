/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
import 'package:http/http.dart' as http;
class PublicMediumEntity implements EntityBase {
  final String? authorId;
  final String? base;
  final String? ext;
  final String? url;
  final String? ref;
  final String? urlThumbnail;
  final String? refThumbnail;
  final int? mediumType;
  final int? mediumWidth;
  final int? mediumHeight;
  final int? thumbnailWidth;
  final int? thumbnailHeight;
  final String? relatedMediumId;

  PublicMediumEntity({required this.authorId, this.base, this.ext, this.url, this.ref, this.urlThumbnail, this.refThumbnail, this.mediumType, this.mediumWidth, this.mediumHeight, this.thumbnailWidth, this.thumbnailHeight, this.relatedMediumId, });


  List<Object?> get props => [authorId, base, ext, url, ref, urlThumbnail, refThumbnail, mediumType, mediumWidth, mediumHeight, thumbnailWidth, thumbnailHeight, relatedMediumId, ];

  @override
  String toString() {
    return 'PublicMediumEntity{authorId: $authorId, base: $base, ext: $ext, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  static PublicMediumEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return PublicMediumEntity(
      authorId: map['authorId'], 
      base: map['base'], 
      ext: map['ext'], 
      url: map['url'], 
      ref: map['ref'], 
      urlThumbnail: map['urlThumbnail'], 
      refThumbnail: map['refThumbnail'], 
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
    if (authorId != null) theDocument["authorId"] = authorId;
      else theDocument["authorId"] = null;
    if (base != null) theDocument["base"] = base;
      else theDocument["base"] = null;
    if (ext != null) theDocument["ext"] = ext;
      else theDocument["ext"] = null;
    if (url != null) theDocument["url"] = url;
      else theDocument["url"] = null;
    if (ref != null) theDocument["ref"] = ref;
      else theDocument["ref"] = null;
    if (urlThumbnail != null) theDocument["urlThumbnail"] = urlThumbnail;
      else theDocument["urlThumbnail"] = null;
    if (refThumbnail != null) theDocument["refThumbnail"] = refThumbnail;
      else theDocument["refThumbnail"] = null;
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

  static PublicMediumEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    if (url != null) {
      var theUrl = Uri.parse(url!);
      final response = await http.get(theUrl);
      var bytes = response.bodyBytes.toList();
      theDocument['extract'] = bytes.toList();
    }
    return theDocument;
  }

}

