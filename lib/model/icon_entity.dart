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
import 'package:eliud_core/core/base/entity_base.dart';

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

  static IconEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
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

  static IconEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

