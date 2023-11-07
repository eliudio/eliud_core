/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/platform_medium_entity.dart';

import 'package:eliud_core/tools/helpers/medium_collect_references.dart';

enum PlatformMediumType { photo, video, pdf, text, unknown }

PlatformMediumType toPlatformMediumType(int? index) {
  switch (index) {
    case 0:
      return PlatformMediumType.photo;
    case 1:
      return PlatformMediumType.video;
    case 2:
      return PlatformMediumType.pdf;
    case 3:
      return PlatformMediumType.text;
  }
  return PlatformMediumType.unknown;
}

class PlatformMediumModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'platformMediums';

  @override
  String documentID;
  @override
  String appId;
  String? authorId;
  String? base;
  String? ext;
  String? url;
  String? ref;
  String? urlThumbnail;
  String? refThumbnail;
  StorageConditionsModel? conditions;
  PlatformMediumType? mediumType;
  int? mediumWidth;
  int? mediumHeight;
  int? thumbnailWidth;
  int? thumbnailHeight;

  // In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.
  String? relatedMediumId;

  PlatformMediumModel({
    required this.documentID,
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

  @override
  PlatformMediumModel copyWith({
    String? documentID,
    String? appId,
    String? authorId,
    String? base,
    String? ext,
    String? url,
    String? ref,
    String? urlThumbnail,
    String? refThumbnail,
    StorageConditionsModel? conditions,
    PlatformMediumType? mediumType,
    int? mediumWidth,
    int? mediumHeight,
    int? thumbnailWidth,
    int? thumbnailHeight,
    String? relatedMediumId,
  }) {
    return PlatformMediumModel(
      documentID: documentID ?? this.documentID,
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

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      authorId.hashCode ^
      base.hashCode ^
      ext.hashCode ^
      url.hashCode ^
      ref.hashCode ^
      urlThumbnail.hashCode ^
      refThumbnail.hashCode ^
      conditions.hashCode ^
      mediumType.hashCode ^
      mediumWidth.hashCode ^
      mediumHeight.hashCode ^
      thumbnailWidth.hashCode ^
      thumbnailHeight.hashCode ^
      relatedMediumId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlatformMediumModel &&
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
          conditions == other.conditions &&
          mediumType == other.mediumType &&
          mediumWidth == other.mediumWidth &&
          mediumHeight == other.mediumHeight &&
          thumbnailWidth == other.thumbnailWidth &&
          thumbnailHeight == other.thumbnailHeight &&
          relatedMediumId == other.relatedMediumId;

  @override
  String toString() {
    return 'PlatformMediumModel{documentID: $documentID, appId: $appId, authorId: $authorId, base: $base, ext: $ext, url: $url, ref: $ref, urlThumbnail: $urlThumbnail, refThumbnail: $refThumbnail, conditions: $conditions, mediumType: $mediumType, mediumWidth: $mediumWidth, mediumHeight: $mediumHeight, thumbnailWidth: $thumbnailWidth, thumbnailHeight: $thumbnailHeight, relatedMediumId: $relatedMediumId}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    referencesCollector.addAll(await mediumCollectReferences(
        appId: appId,
        relatedMediumId: relatedMediumId,
        repo: platformMediumRepository(appId: appId)!,
        packageName: packageName,
        id: id));
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  PlatformMediumEntity toEntity({String? appId}) {
    return PlatformMediumEntity(
      appId: appId,
      authorId: (authorId != null) ? authorId : null,
      base: (base != null) ? base : null,
      ext: (ext != null) ? ext : null,
      url: (url != null) ? url : null,
      ref: (ref != null) ? ref : null,
      urlThumbnail: (urlThumbnail != null) ? urlThumbnail : null,
      refThumbnail: (refThumbnail != null) ? refThumbnail : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
      mediumType: (mediumType != null) ? mediumType!.index : null,
      mediumWidth: (mediumWidth != null) ? mediumWidth : null,
      mediumHeight: (mediumHeight != null) ? mediumHeight : null,
      thumbnailWidth: (thumbnailWidth != null) ? thumbnailWidth : null,
      thumbnailHeight: (thumbnailHeight != null) ? thumbnailHeight : null,
      relatedMediumId: (relatedMediumId != null) ? relatedMediumId : null,
    );
  }

  static Future<PlatformMediumModel?> fromEntity(
      String documentID, PlatformMediumEntity? entity) async {
    if (entity == null) return null;
    return PlatformMediumModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      authorId: entity.authorId,
      base: entity.base,
      ext: entity.ext,
      url: entity.url,
      ref: entity.ref,
      urlThumbnail: entity.urlThumbnail,
      refThumbnail: entity.refThumbnail,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
      mediumType: toPlatformMediumType(entity.mediumType),
      mediumWidth: entity.mediumWidth,
      mediumHeight: entity.mediumHeight,
      thumbnailWidth: entity.thumbnailWidth,
      thumbnailHeight: entity.thumbnailHeight,
      relatedMediumId: entity.relatedMediumId,
    );
  }

  static Future<PlatformMediumModel?> fromEntityPlus(
      String documentID, PlatformMediumEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return PlatformMediumModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      authorId: entity.authorId,
      base: entity.base,
      ext: entity.ext,
      url: entity.url,
      ref: entity.ref,
      urlThumbnail: entity.urlThumbnail,
      refThumbnail: entity.refThumbnail,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
      mediumType: toPlatformMediumType(entity.mediumType),
      mediumWidth: entity.mediumWidth,
      mediumHeight: entity.mediumHeight,
      thumbnailWidth: entity.thumbnailWidth,
      thumbnailHeight: entity.thumbnailHeight,
      relatedMediumId: entity.relatedMediumId,
    );
  }
}
