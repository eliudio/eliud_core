/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';

class BodyComponentEntity implements EntityBase {
  final String? componentName;
  final String? componentId;

  BodyComponentEntity({
    this.componentName,
    this.componentId,
  });

  BodyComponentEntity copyWith({
    String? documentID,
    String? componentName,
    String? componentId,
  }) {
    return BodyComponentEntity(
      componentName: componentName ?? this.componentName,
      componentId: componentId ?? this.componentId,
    );
  }

  List<Object?> get props => [
        componentName,
        componentId,
      ];

  @override
  String toString() {
    return 'BodyComponentEntity{componentName: $componentName, componentId: $componentId}';
  }

  static BodyComponentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return BodyComponentEntity(
      componentName: map['componentName'],
      componentId: map['componentId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (componentName != null) {
      theDocument["componentName"] = componentName;
    } else {
      theDocument["componentName"] = null;
    }
    if (componentId != null) {
      theDocument["componentId"] = componentId;
    } else {
      theDocument["componentId"] = null;
    }
    return theDocument;
  }

  @override
  BodyComponentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static BodyComponentEntity? fromJsonString(String json,
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
