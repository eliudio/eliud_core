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

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/shadow_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ShadowModel {
  static const String packageName = 'eliud_core';
  static const String id = 'Shadow';

  RgbModel? color;

  // The first argument sets [dx], the horizontal component of the offset
  double? offsetDX;

  // The second argument sets [dy], the vertical component of the offset
  double? offsetDY;

  // The amount the box should be inflated prior to applying the blur.
  double? spreadRadius;

  // The standard deviation of the Gaussian to convolve with the shadow's shape.
  double? blurRadius;

  ShadowModel({this.color, this.offsetDX, this.offsetDY, this.spreadRadius, this.blurRadius, })  {
  }

  ShadowModel copyWith({RgbModel? color, double? offsetDX, double? offsetDY, double? spreadRadius, double? blurRadius, }) {
    return ShadowModel(color: color ?? this.color, offsetDX: offsetDX ?? this.offsetDX, offsetDY: offsetDY ?? this.offsetDY, spreadRadius: spreadRadius ?? this.spreadRadius, blurRadius: blurRadius ?? this.blurRadius, );
  }

  @override
  int get hashCode => color.hashCode ^ offsetDX.hashCode ^ offsetDY.hashCode ^ spreadRadius.hashCode ^ blurRadius.hashCode;

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

  ShadowEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
    }
    return ShadowEntity(
          color: (color != null) ? color!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          offsetDX: (offsetDX != null) ? offsetDX : null, 
          offsetDY: (offsetDY != null) ? offsetDY : null, 
          spreadRadius: (spreadRadius != null) ? spreadRadius : null, 
          blurRadius: (blurRadius != null) ? blurRadius : null, 
    );
  }

  static Future<ShadowModel?> fromEntity(ShadowEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return ShadowModel(
          color: 
            await RgbModel.fromEntity(entity.color), 
          offsetDX: entity.offsetDX, 
          offsetDY: entity.offsetDY, 
          spreadRadius: entity.spreadRadius, 
          blurRadius: entity.blurRadius, 
    );
  }

  static Future<ShadowModel?> fromEntityPlus(ShadowEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return ShadowModel(
          color: 
            await RgbModel.fromEntityPlus(entity.color, appId: appId), 
          offsetDX: entity.offsetDX, 
          offsetDY: entity.offsetDY, 
          spreadRadius: entity.spreadRadius, 
          blurRadius: entity.blurRadius, 
    );
  }

}

