/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DialogEntity {
  final String? appId;
  final String? title;
  final String? description;
  final List<BodyComponentEntity>? bodyComponents;
  final BackgroundEntity? backgroundOverride;
  final int? layout;
  final bool? includeHeading;
  final String? gridViewId;
  final StorageConditionsEntity? conditions;

  DialogEntity({required this.appId, this.title, this.description, this.bodyComponents, this.backgroundOverride, this.layout, this.includeHeading, this.gridViewId, this.conditions, });


  List<Object?> get props => [appId, title, description, bodyComponents, backgroundOverride, layout, includeHeading, gridViewId, conditions, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'DialogEntity{appId: $appId, title: $title, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, includeHeading: $includeHeading, gridViewId: $gridViewId, conditions: $conditions}';
  }

  static DialogEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var bodyComponentsFromMap;
    bodyComponentsFromMap = map['bodyComponents'];
    var bodyComponentsList;
    if (bodyComponentsFromMap != null)
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map)!)
        .toList();
    var backgroundOverrideFromMap;
    backgroundOverrideFromMap = map['backgroundOverride'];
    if (backgroundOverrideFromMap != null)
      backgroundOverrideFromMap = BackgroundEntity.fromMap(backgroundOverrideFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return DialogEntity(
      appId: map['appId'], 
      title: map['title'], 
      description: map['description'], 
      bodyComponents: bodyComponentsList, 
      backgroundOverride: backgroundOverrideFromMap, 
      layout: map['layout'], 
      includeHeading: map['includeHeading'], 
      gridViewId: map['gridViewId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? backgroundOverrideMap = backgroundOverride != null 
        ? backgroundOverride!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (bodyComponents != null) theDocument["bodyComponents"] = bodyComponentsListMap;
      else theDocument["bodyComponents"] = null;
    if (backgroundOverride != null) theDocument["backgroundOverride"] = backgroundOverrideMap;
      else theDocument["backgroundOverride"] = null;
    if (layout != null) theDocument["layout"] = layout;
      else theDocument["layout"] = null;
    if (includeHeading != null) theDocument["includeHeading"] = includeHeading;
      else theDocument["includeHeading"] = null;
    if (gridViewId != null) theDocument["gridViewId"] = gridViewId;
      else theDocument["gridViewId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static DialogEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

