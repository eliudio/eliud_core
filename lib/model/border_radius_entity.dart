/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 border_radius_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class BorderRadiusEntity implements EntityBase {
  final int? borderRadiusType;
  final double? circularValue;
  final double? ellipticalX;
  final double? ellipticalY;

  BorderRadiusEntity({
    this.borderRadiusType,
    this.circularValue,
    this.ellipticalX,
    this.ellipticalY,
  });

  BorderRadiusEntity copyWith({
    int? borderRadiusType,
    double? circularValue,
    double? ellipticalX,
    double? ellipticalY,
  }) {
    return BorderRadiusEntity(
      borderRadiusType: borderRadiusType ?? this.borderRadiusType,
      circularValue: circularValue ?? this.circularValue,
      ellipticalX: ellipticalX ?? this.ellipticalX,
      ellipticalY: ellipticalY ?? this.ellipticalY,
    );
  }

  List<Object?> get props => [
        borderRadiusType,
        circularValue,
        ellipticalX,
        ellipticalY,
      ];

  @override
  String toString() {
    return 'BorderRadiusEntity{borderRadiusType: $borderRadiusType, circularValue: $circularValue, ellipticalX: $ellipticalX, ellipticalY: $ellipticalY}';
  }

  static BorderRadiusEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return BorderRadiusEntity(
      borderRadiusType: map['borderRadiusType'],
      circularValue: double.tryParse(map['circularValue'].toString()),
      ellipticalX: double.tryParse(map['ellipticalX'].toString()),
      ellipticalY: double.tryParse(map['ellipticalY'].toString()),
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (borderRadiusType != null) {
      theDocument["borderRadiusType"] = borderRadiusType;
    } else {
      theDocument["borderRadiusType"] = null;
    }
    if (circularValue != null) {
      theDocument["circularValue"] = circularValue;
    } else {
      theDocument["circularValue"] = null;
    }
    if (ellipticalX != null) {
      theDocument["ellipticalX"] = ellipticalX;
    } else {
      theDocument["ellipticalX"] = null;
    }
    if (ellipticalY != null) {
      theDocument["ellipticalY"] = ellipticalY;
    } else {
      theDocument["ellipticalY"] = null;
    }
    return theDocument;
  }

  @override
  BorderRadiusEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static BorderRadiusEntity? fromJsonString(String json,
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
    return theDocument;
  }
}
