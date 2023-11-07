/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 border_radius_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/border_radius_entity.dart';

enum BorderRadiusType { circular, elliptical, unknown }

BorderRadiusType toBorderRadiusType(int? index) {
  switch (index) {
    case 0:
      return BorderRadiusType.circular;
    case 1:
      return BorderRadiusType.elliptical;
  }
  return BorderRadiusType.unknown;
}

class BorderRadiusModel {
  static const String packageName = 'eliud_core';
  static const String id = 'borderRadiuss';

  // Border Radius Type
  BorderRadiusType? borderRadiusType;
  double? circularValue;
  double? ellipticalX;
  double? ellipticalY;

  BorderRadiusModel({
    this.borderRadiusType,
    this.circularValue,
    this.ellipticalX,
    this.ellipticalY,
  });

  BorderRadiusModel copyWith({
    BorderRadiusType? borderRadiusType,
    double? circularValue,
    double? ellipticalX,
    double? ellipticalY,
  }) {
    return BorderRadiusModel(
      borderRadiusType: borderRadiusType ?? this.borderRadiusType,
      circularValue: circularValue ?? this.circularValue,
      ellipticalX: ellipticalX ?? this.ellipticalX,
      ellipticalY: ellipticalY ?? this.ellipticalY,
    );
  }

  @override
  int get hashCode =>
      borderRadiusType.hashCode ^
      circularValue.hashCode ^
      ellipticalX.hashCode ^
      ellipticalY.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BorderRadiusModel &&
          runtimeType == other.runtimeType &&
          borderRadiusType == other.borderRadiusType &&
          circularValue == other.circularValue &&
          ellipticalX == other.ellipticalX &&
          ellipticalY == other.ellipticalY;

  @override
  String toString() {
    return 'BorderRadiusModel{borderRadiusType: $borderRadiusType, circularValue: $circularValue, ellipticalX: $ellipticalX, ellipticalY: $ellipticalY}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  BorderRadiusEntity toEntity({String? appId}) {
    return BorderRadiusEntity(
      borderRadiusType:
          (borderRadiusType != null) ? borderRadiusType!.index : null,
      circularValue: (circularValue != null) ? circularValue : null,
      ellipticalX: (ellipticalX != null) ? ellipticalX : null,
      ellipticalY: (ellipticalY != null) ? ellipticalY : null,
    );
  }

  static Future<BorderRadiusModel?> fromEntity(
      BorderRadiusEntity? entity) async {
    if (entity == null) return null;
    return BorderRadiusModel(
      borderRadiusType: toBorderRadiusType(entity.borderRadiusType),
      circularValue: entity.circularValue,
      ellipticalX: entity.ellipticalX,
      ellipticalY: entity.ellipticalY,
    );
  }

  static Future<BorderRadiusModel?> fromEntityPlus(BorderRadiusEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return BorderRadiusModel(
      borderRadiusType: toBorderRadiusType(entity.borderRadiusType),
      circularValue: entity.circularValue,
      ellipticalX: entity.ellipticalX,
      ellipticalY: entity.ellipticalY,
    );
  }
}
