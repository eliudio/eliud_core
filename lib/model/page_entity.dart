/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class PageEntity {
  final String? appId;
  final String? description;
  final String? title;
  final String? appBarId;
  final String? drawerId;
  final String? endDrawerId;
  final String? homeMenuId;
  final List<BodyComponentEntity>? bodyComponents;
  final BackgroundEntity? backgroundOverride;
  final int? layout;
  final String? gridViewId;
  final StorageConditionsEntity? conditions;

  PageEntity({required this.appId, this.description, this.title, this.appBarId, this.drawerId, this.endDrawerId, this.homeMenuId, this.bodyComponents, this.backgroundOverride, this.layout, this.gridViewId, this.conditions, });


  List<Object?> get props => [appId, description, title, appBarId, drawerId, endDrawerId, homeMenuId, bodyComponents, backgroundOverride, layout, gridViewId, conditions, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'PageEntity{appId: $appId, description: $description, title: $title, appBarId: $appBarId, drawerId: $drawerId, endDrawerId: $endDrawerId, homeMenuId: $homeMenuId, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, gridViewId: $gridViewId, conditions: $conditions}';
  }

  static PageEntity? fromMap(Object? o) {
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

    return PageEntity(
      appId: map['appId'], 
      description: map['description'], 
      title: map['title'], 
      appBarId: map['appBarId'], 
      drawerId: map['drawerId'], 
      endDrawerId: map['endDrawerId'], 
      homeMenuId: map['homeMenuId'], 
      bodyComponents: bodyComponentsList, 
      backgroundOverride: backgroundOverrideFromMap, 
      layout: map['layout'], 
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
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (appBarId != null) theDocument["appBarId"] = appBarId;
      else theDocument["appBarId"] = null;
    if (drawerId != null) theDocument["drawerId"] = drawerId;
      else theDocument["drawerId"] = null;
    if (endDrawerId != null) theDocument["endDrawerId"] = endDrawerId;
      else theDocument["endDrawerId"] = null;
    if (homeMenuId != null) theDocument["homeMenuId"] = homeMenuId;
      else theDocument["homeMenuId"] = null;
    if (bodyComponents != null) theDocument["bodyComponents"] = bodyComponentsListMap;
      else theDocument["bodyComponents"] = null;
    if (backgroundOverride != null) theDocument["backgroundOverride"] = backgroundOverrideMap;
      else theDocument["backgroundOverride"] = null;
    if (layout != null) theDocument["layout"] = layout;
      else theDocument["layout"] = null;
    if (gridViewId != null) theDocument["gridViewId"] = gridViewId;
      else theDocument["gridViewId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static PageEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

