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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class BodyComponentEntity {
  final String? componentName;
  final String? componentId;

  BodyComponentEntity({this.componentName, this.componentId, });


  List<Object?> get props => [componentName, componentId, ];

  @override
  String toString() {
    return 'BodyComponentEntity{componentName: $componentName, componentId: $componentId}';
  }

  static BodyComponentEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return BodyComponentEntity(
      componentName: map['componentName'], 
      componentId: map['componentId'], 
    );
  }

  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (componentName != null) theDocument["componentName"] = componentName;
      else theDocument["componentName"] = null;
    if (componentId != null) theDocument["componentId"] = componentId;
      else theDocument["componentId"] = null;
    return theDocument;
  }

  static BodyComponentEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

