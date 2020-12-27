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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class ShadowEntity {
  final String appId;
  final String comments;
  final RgbEntity color;
  final double offsetDX;
  final double offsetDY;
  final double spreadRadius;
  final double blurRadius;

  ShadowEntity({this.appId, this.comments, this.color, this.offsetDX, this.offsetDY, this.spreadRadius, this.blurRadius, });


  List<Object> get props => [appId, comments, color, offsetDX, offsetDY, spreadRadius, blurRadius, ];

  @override
  String toString() {
    return 'ShadowEntity{appId: $appId, comments: $comments, color: $color, offsetDX: $offsetDX, offsetDY: $offsetDY, spreadRadius: $spreadRadius, blurRadius: $blurRadius}';
  }

  static ShadowEntity fromMap(Map map) {
    if (map == null) return null;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);

    return ShadowEntity(
      appId: map['appId'], 
      comments: map['comments'], 
      color: colorFromMap, 
      offsetDX: double.tryParse(map['offsetDX'].toString()), 
      offsetDY: double.tryParse(map['offsetDY'].toString()), 
      spreadRadius: double.tryParse(map['spreadRadius'].toString()), 
      blurRadius: double.tryParse(map['blurRadius'].toString()), 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> colorMap = color != null 
        ? color.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (comments != null) theDocument["comments"] = comments;
      else theDocument["comments"] = null;
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

  static ShadowEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

