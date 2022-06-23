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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class ShadowEntity implements EntityBase {
  final RgbEntity? color;
  final double? offsetDX;
  final double? offsetDY;
  final double? spreadRadius;
  final double? blurRadius;

  ShadowEntity({this.color, this.offsetDX, this.offsetDY, this.spreadRadius, this.blurRadius, });


  List<Object?> get props => [color, offsetDX, offsetDY, spreadRadius, blurRadius, ];

  @override
  String toString() {
    return 'ShadowEntity{color: $color, offsetDX: $offsetDX, offsetDY: $offsetDY, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }

  static ShadowEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);

    return ShadowEntity(
      color: colorFromMap, 
      offsetDX: double.tryParse(map['offsetDX'].toString()), 
      offsetDY: double.tryParse(map['offsetDY'].toString()), 
      spreadRadius: double.tryParse(map['spreadRadius'].toString()), 
      blurRadius: double.tryParse(map['blurRadius'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap = color != null 
        ? color!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (color != null) theDocument["color"] = colorMap;
      else theDocument["color"] = null;
    if (offsetDX != null) theDocument["offsetDX"] = offsetDX;
      else theDocument["offsetDX"] = null;
    if (offsetDY != null) theDocument["offsetDY"] = offsetDY;
      else theDocument["offsetDY"] = null;
    if (spreadRadius != null) theDocument["spreadRadius"] = spreadRadius;
      else theDocument["spreadRadius"] = null;
    if (blurRadius != null) theDocument["blurRadius"] = blurRadius;
      else theDocument["blurRadius"] = null;
    return theDocument;
  }

  static ShadowEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

