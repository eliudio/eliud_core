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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class DialogEntity {
  final String? appId;
  final String? title;
  final List<BodyComponentEntity>? bodyComponents;
  final String? backgroundOverrideId;
  final int? layout;
  final String? gridViewId;
  final String? widgetWrapper;
  final ConditionsEntity? conditions;

  DialogEntity({this.appId, this.title, this.bodyComponents, this.backgroundOverrideId, this.layout, this.gridViewId, this.widgetWrapper, this.conditions, });


  List<Object?> get props => [appId, title, bodyComponents, backgroundOverrideId, layout, gridViewId, widgetWrapper, conditions, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'DialogEntity{appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverrideId: $backgroundOverrideId, layout: $layout, gridViewId: $gridViewId, widgetWrapper: $widgetWrapper, conditions: $conditions}';
  }

  static DialogEntity? fromMap(Map? map) {
    if (map == null) return null;

    var bodyComponentsFromMap;
    bodyComponentsFromMap = map['bodyComponents'];
    var bodyComponentsList;
    if (bodyComponentsFromMap != null)
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsEntity.fromMap(conditionsFromMap);

    return DialogEntity(
      appId: map['appId'], 
      title: map['title'], 
      bodyComponents: bodyComponentsList, 
      backgroundOverrideId: map['backgroundOverrideId'], 
      layout: map['layout'], 
      gridViewId: map['gridViewId'], 
      widgetWrapper: map['widgetWrapper'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (bodyComponents != null) theDocument["bodyComponents"] = bodyComponentsListMap;
      else theDocument["bodyComponents"] = null;
    if (backgroundOverrideId != null) theDocument["backgroundOverrideId"] = backgroundOverrideId;
      else theDocument["backgroundOverrideId"] = null;
    if (layout != null) theDocument["layout"] = layout;
      else theDocument["layout"] = null;
    if (gridViewId != null) theDocument["gridViewId"] = gridViewId;
      else theDocument["gridViewId"] = null;
    if (widgetWrapper != null) theDocument["widgetWrapper"] = widgetWrapper;
      else theDocument["widgetWrapper"] = null;
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

