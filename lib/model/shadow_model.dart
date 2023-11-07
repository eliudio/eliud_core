/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/shadow_entity.dart';

class ShadowModel {
  static const String packageName = 'eliud_core';
  static const String id = 'shadows';

  RgbModel? color;

  // The first argument sets [dx], the horizontal component of the offset
  double? offsetDX;

  // The second argument sets [dy], the vertical component of the offset
  double? offsetDY;

  // The amount the box should be inflated prior to applying the blur.
  double? spreadRadius;

  // The standard deviation of the Gaussian to convolve with the shadow's shape.
  double? blurRadius;

  ShadowModel({
    this.color,
    this.offsetDX,
    this.offsetDY,
    this.spreadRadius,
    this.blurRadius,
  });

  ShadowModel copyWith({
    RgbModel? color,
    double? offsetDX,
    double? offsetDY,
    double? spreadRadius,
    double? blurRadius,
  }) {
    return ShadowModel(
      color: color ?? this.color,
      offsetDX: offsetDX ?? this.offsetDX,
      offsetDY: offsetDY ?? this.offsetDY,
      spreadRadius: spreadRadius ?? this.spreadRadius,
      blurRadius: blurRadius ?? this.blurRadius,
    );
  }

  @override
  int get hashCode =>
      color.hashCode ^
      offsetDX.hashCode ^
      offsetDY.hashCode ^
      spreadRadius.hashCode ^
      blurRadius.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShadowModel &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          offsetDX == other.offsetDX &&
          offsetDY == other.offsetDY &&
          spreadRadius == other.spreadRadius &&
          blurRadius == other.blurRadius;

  @override
  String toString() {
    return 'ShadowModel{color: $color, offsetDX: $offsetDX, offsetDY: $offsetDY, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (color != null) {
      referencesCollector.addAll(await color!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  ShadowEntity toEntity({String? appId}) {
    return ShadowEntity(
      color: (color != null) ? color!.toEntity(appId: appId) : null,
      offsetDX: (offsetDX != null) ? offsetDX : null,
      offsetDY: (offsetDY != null) ? offsetDY : null,
      spreadRadius: (spreadRadius != null) ? spreadRadius : null,
      blurRadius: (blurRadius != null) ? blurRadius : null,
    );
  }

  static Future<ShadowModel?> fromEntity(ShadowEntity? entity) async {
    if (entity == null) return null;
    return ShadowModel(
      color: await RgbModel.fromEntity(entity.color),
      offsetDX: entity.offsetDX,
      offsetDY: entity.offsetDY,
      spreadRadius: entity.spreadRadius,
      blurRadius: entity.blurRadius,
    );
  }

  static Future<ShadowModel?> fromEntityPlus(ShadowEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return ShadowModel(
      color: await RgbModel.fromEntityPlus(entity.color, appId: appId),
      offsetDX: entity.offsetDX,
      offsetDY: entity.offsetDY,
      spreadRadius: entity.spreadRadius,
      blurRadius: entity.blurRadius,
    );
  }
}
