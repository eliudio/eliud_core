/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 icon_entity.dart
                       
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
class IconEntity implements EntityBase {
  final int? codePoint;
  final String? fontFamily;

  IconEntity({this.codePoint, this.fontFamily, });

  IconEntity copyWith({int? codePoint, String? fontFamily, }) {
    return IconEntity(codePoint : codePoint ?? this.codePoint, fontFamily : fontFamily ?? this.fontFamily, );
  }
  List<Object?> get props => [codePoint, fontFamily, ];

  @override
  String toString() {
    return 'IconEntity{codePoint: $codePoint, fontFamily: $fontFamily}';
  }

  static IconEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return IconEntity(
      codePoint: int.tryParse(map['codePoint'].toString()), 
      fontFamily: map['fontFamily'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (codePoint != null) theDocument["codePoint"] = codePoint;
      else theDocument["codePoint"] = null;
    if (fontFamily != null) theDocument["fontFamily"] = fontFamily;
      else theDocument["fontFamily"] = null;
    return theDocument;
  }

  @override
  IconEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static IconEntity? fromJsonString(String json) {
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

