/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 rgb_entity.dart
                       
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
class RgbEntity implements EntityBase {
  final int? r;
  final int? g;
  final int? b;
  final double? opacity;

  RgbEntity({this.r, this.g, this.b, this.opacity, });


  List<Object?> get props => [r, g, b, opacity, ];

  @override
  String toString() {
    return 'RgbEntity{r: $r, g: $g, b: $b, opacity: $opacity}';
  }

  static RgbEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return RgbEntity(
      r: int.tryParse(map['r'].toString()), 
      g: int.tryParse(map['g'].toString()), 
      b: int.tryParse(map['b'].toString()), 
      opacity: double.tryParse(map['opacity'].toString()), 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (r != null) theDocument["r"] = r;
      else theDocument["r"] = null;
    if (g != null) theDocument["g"] = g;
      else theDocument["g"] = null;
    if (b != null) theDocument["b"] = b;
      else theDocument["b"] = null;
    if (opacity != null) theDocument["opacity"] = opacity;
      else theDocument["opacity"] = null;
    return theDocument;
  }

  static RgbEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

