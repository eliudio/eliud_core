/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class ShadowEntity implements EntityBase {
  final RgbEntity? color;
  final double? offsetDX;
  final double? offsetDY;
  final double? spreadRadius;
  final double? blurRadius;

  ShadowEntity({
    this.color,
    this.offsetDX,
    this.offsetDY,
    this.spreadRadius,
    this.blurRadius,
  });

  ShadowEntity copyWith({
    RgbEntity? color,
    double? offsetDX,
    double? offsetDY,
    double? spreadRadius,
    double? blurRadius,
  }) {
    return ShadowEntity(
      color: color ?? this.color,
      offsetDX: offsetDX ?? this.offsetDX,
      offsetDY: offsetDY ?? this.offsetDY,
      spreadRadius: spreadRadius ?? this.spreadRadius,
      blurRadius: blurRadius ?? this.blurRadius,
    );
  }

  List<Object?> get props => [
        color,
        offsetDX,
        offsetDY,
        spreadRadius,
        blurRadius,
      ];

  @override
  String toString() {
    return 'ShadowEntity{color: $color, offsetDX: $offsetDX, offsetDY: $offsetDY, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }

  static ShadowEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap = map['color'];
    if (colorFromMap != null) {
      colorFromMap =
          RgbEntity.fromMap(colorFromMap, newDocumentIds: newDocumentIds);
    }

    return ShadowEntity(
      color: colorFromMap,
      offsetDX: double.tryParse(map['offsetDX'].toString()),
      offsetDY: double.tryParse(map['offsetDY'].toString()),
      spreadRadius: double.tryParse(map['spreadRadius'].toString()),
      blurRadius: double.tryParse(map['blurRadius'].toString()),
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap =
        color != null ? color!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (color != null) {
      theDocument["color"] = colorMap;
    } else {
      theDocument["color"] = null;
    }
    if (offsetDX != null) {
      theDocument["offsetDX"] = offsetDX;
    } else {
      theDocument["offsetDX"] = null;
    }
    if (offsetDY != null) {
      theDocument["offsetDY"] = offsetDY;
    } else {
      theDocument["offsetDY"] = null;
    }
    if (spreadRadius != null) {
      theDocument["spreadRadius"] = spreadRadius;
    } else {
      theDocument["spreadRadius"] = null;
    }
    if (blurRadius != null) {
      theDocument["blurRadius"] = blurRadius;
    } else {
      theDocument["blurRadius"] = null;
    }
    return theDocument;
  }

  @override
  ShadowEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static ShadowEntity? fromJsonString(String json,
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
