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
import 'package:eliud_core/core/base/entity_base.dart';

class RgbEntity implements EntityBase {
  final int? r;
  final int? g;
  final int? b;
  final double? opacity;

  RgbEntity({
    this.r,
    this.g,
    this.b,
    this.opacity,
  });

  RgbEntity copyWith({
    int? r,
    int? g,
    int? b,
    double? opacity,
  }) {
    return RgbEntity(
      r: r ?? this.r,
      g: g ?? this.g,
      b: b ?? this.b,
      opacity: opacity ?? this.opacity,
    );
  }

  List<Object?> get props => [
        r,
        g,
        b,
        opacity,
      ];

  @override
  String toString() {
    return 'RgbEntity{r: $r, g: $g, b: $b, opacity: $opacity}';
  }

  static RgbEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return RgbEntity(
      r: int.tryParse(map['r'].toString()),
      g: int.tryParse(map['g'].toString()),
      b: int.tryParse(map['b'].toString()),
      opacity: double.tryParse(map['opacity'].toString()),
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (r != null) {
      theDocument["r"] = r;
    } else {
      theDocument["r"] = null;
    }
    if (g != null) {
      theDocument["g"] = g;
    } else {
      theDocument["g"] = null;
    }
    if (b != null) {
      theDocument["b"] = b;
    } else {
      theDocument["b"] = null;
    }
    if (opacity != null) {
      theDocument["opacity"] = opacity;
    } else {
      theDocument["opacity"] = null;
    }
    return theDocument;
  }

  @override
  RgbEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static RgbEntity? fromJsonString(String json,
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
