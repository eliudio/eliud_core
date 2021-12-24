/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DecorationColorEntity {
  final String? appId;
  final RgbEntity? color;
  final double? stop;

  DecorationColorEntity({this.appId, this.color, this.stop, });


  List<Object?> get props => [appId, color, stop, ];

  @override
  String toString() {
    return 'DecorationColorEntity{appId: $appId, color: $color, stop: $stop}';
  }

  static DecorationColorEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);

    return DecorationColorEntity(
      appId: map['appId'], 
      color: colorFromMap, 
      stop: double.tryParse(map['stop'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap = color != null 
        ? color!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (color != null) theDocument["color"] = colorMap;
      else theDocument["color"] = null;
    if (stop != null) theDocument["stop"] = stop;
      else theDocument["stop"] = null;
    return theDocument;
  }

  static DecorationColorEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

