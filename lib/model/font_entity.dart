/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class FontEntity {
  final String? fontName;
  final double? size;
  final int? weight;
  final int? style;
  final int? decoration;
  final RgbEntity? color;

  FontEntity({this.fontName, this.size, this.weight, this.style, this.decoration, this.color, });


  List<Object?> get props => [fontName, size, weight, style, decoration, color, ];

  @override
  String toString() {
    return 'FontEntity{fontName: $fontName, size: $size, weight: $weight, style: $style, decoration: $decoration, color: $color}';
  }

  static FontEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);

    return FontEntity(
      fontName: map['fontName'], 
      size: double.tryParse(map['size'].toString()), 
      weight: map['weight'], 
      style: map['style'], 
      decoration: map['decoration'], 
      color: colorFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap = color != null 
        ? color!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (fontName != null) theDocument["fontName"] = fontName;
      else theDocument["fontName"] = null;
    if (size != null) theDocument["size"] = size;
      else theDocument["size"] = null;
    if (weight != null) theDocument["weight"] = weight;
      else theDocument["weight"] = null;
    if (style != null) theDocument["style"] = style;
      else theDocument["style"] = null;
    if (decoration != null) theDocument["decoration"] = decoration;
      else theDocument["decoration"] = null;
    if (color != null) theDocument["color"] = colorMap;
      else theDocument["color"] = null;
    return theDocument;
  }

  static FontEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

