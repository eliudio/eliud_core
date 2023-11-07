/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:http/http.dart' as http;

class PlatformMediumEntity implements EntityBase {
  final String? appId;
  final String? authorId;
  final String? base;
  final String? ext;
  final String? url;
  final String? ref;
  final String? urlThumbnail;
  final String? refThumbnail;
  final StorageConditionsEntity? conditions;
  final int? mediumType;
  final int? mediumWidth;
  final int? mediumHeight;
  final int? thumbnailWidth;
  final int? thumbnailHeight;
  final String? relatedMediumId;

  PlatformMediumEntity({
    required this.appId,
    this.authorId,
    this.base,
    this.ext,
    this.url,
    this.ref,
    this.urlThumbnail,
    this.refThumbnail,
    this.conditions,
    this.mediumType,
    this.mediumWidth,
    this.mediumHeight,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.relatedMediumId,
  });

  PlatformMediumEntity copyWith({
    String? documentID,
    String? appId,
    String? authorId,
    String? base,
    String? ext,
    String? url,
    String? ref,
    String? urlThumbnail,
    String? refThumbnail,
    StorageConditionsEntity? conditions,
    int? mediumType,
    int? mediumWidth,
    int? mediumHeight,
    int? thumbnailWidth,
    int? thumbnailHeight,
    String? relatedMediumId,
  }) {
    return PlatformMediumEntity(
      appId: appId ?? this.appId,
      authorId: authorId ?? this.authorId,
      base: base ?? this.base,
      ext: ext ?? this.ext,
      url: url ?? this.url,
      ref: ref ?? this.ref,
      urlThumbnail: urlThumbnail ?? this.urlThumbnail,
      refThumbnail: refThumbnail ?? this.refThumbnail,
      conditions: conditions ?? this.conditions,
      mediumType: mediumType ?? this.mediumType,
      mediumWidth: mediumWidth ?? this.mediumWidth,
      mediumHeight: mediumHeight ?? this.mediumHeight,
      thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth,
      thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight,
      relatedMediumId: relatedMediumId ?? this.relatedMediumId,
    );
  }

  List<Object?> get props => [
        appId,
        authorId,
        base,
        ext,
        url,
        ref,
        urlThumbnail,
        refThumbnail,
        conditions,
        mediumType,
        mediumWidth,
        mediumHeight,
        thumbnailWidth,
        thumbnailHeight,
        relatedMediumId,
      ];

  @override
  String toString() {
    return 'PlatformMediumEntity{appId: $appId, authorId: $authorId, base: $base, ext: $ext, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, conditions: $conditions, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  static PlatformMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return PlatformMediumEntity(
      appId: map['appId'],
      authorId: map['authorId'],
      base: map['base'],
      ext: map['ext'],
      url: map['url'],
      ref: map['ref'],
      urlThumbnail: map['urlThumbnail'],
      refThumbnail: map['refThumbnail'],
      conditions: conditionsFromMap,
      mediumType: map['mediumType'],
      mediumWidth: int.tryParse(map['mediumWidth'].toString()),
      mediumHeight: int.tryParse(map['mediumHeight'].toString()),
      thumbnailWidth: int.tryParse(map['thumbnailWidth'].toString()),
      thumbnailHeight: int.tryParse(map['thumbnailHeight'].toString()),
      relatedMediumId: map['relatedMediumId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (authorId != null) {
      theDocument["authorId"] = authorId;
    } else {
      theDocument["authorId"] = null;
    }
    if (base != null) {
      theDocument["base"] = base;
    } else {
      theDocument["base"] = null;
    }
    if (ext != null) {
      theDocument["ext"] = ext;
    } else {
      theDocument["ext"] = null;
    }
    if (url != null) {
      theDocument["url"] = url;
    } else {
      theDocument["url"] = null;
    }
    if (ref != null) {
      theDocument["ref"] = ref;
    } else {
      theDocument["ref"] = null;
    }
    if (urlThumbnail != null) {
      theDocument["urlThumbnail"] = urlThumbnail;
    } else {
      theDocument["urlThumbnail"] = null;
    }
    if (refThumbnail != null) {
      theDocument["refThumbnail"] = refThumbnail;
    } else {
      theDocument["refThumbnail"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    if (mediumType != null) {
      theDocument["mediumType"] = mediumType;
    } else {
      theDocument["mediumType"] = null;
    }
    if (mediumWidth != null) {
      theDocument["mediumWidth"] = mediumWidth;
    } else {
      theDocument["mediumWidth"] = null;
    }
    if (mediumHeight != null) {
      theDocument["mediumHeight"] = mediumHeight;
    } else {
      theDocument["mediumHeight"] = null;
    }
    if (thumbnailWidth != null) {
      theDocument["thumbnailWidth"] = thumbnailWidth;
    } else {
      theDocument["thumbnailWidth"] = null;
    }
    if (thumbnailHeight != null) {
      theDocument["thumbnailHeight"] = thumbnailHeight;
    } else {
      theDocument["thumbnailHeight"] = null;
    }
    if (relatedMediumId != null) {
      theDocument["relatedMediumId"] = relatedMediumId;
    } else {
      theDocument["relatedMediumId"] = null;
    }
    return theDocument;
  }

  @override
  PlatformMediumEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PlatformMediumEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    if (url != null) {
      var theUrl = Uri.parse(url!);
      final response = await http.get(theUrl);
      var bytes = response.bodyBytes.toList();
      theDocument['extract'] = bytes.toList();
    }
    return theDocument;
  }
}
