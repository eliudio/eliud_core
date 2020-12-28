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
  final String appId;
  final String title;
  final List<BodyComponentEntity> bodyComponents;
  final RgbEntity background;
  final int layout;
  final String gridViewId;
  final ReadCondition readCondition;
  final int privilegeLevelRequired;
  final String packageCondition;

  DialogEntity({this.appId, this.title, this.bodyComponents, this.background, this.layout, this.gridViewId, this.readCondition, this.privilegeLevelRequired, this.packageCondition, });


  List<Object> get props => [appId, title, bodyComponents, background, layout, gridViewId, readCondition, privilegeLevelRequired, packageCondition, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'DialogEntity{appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, background: $background, layout: $layout, gridViewId: $gridViewId, readCondition: $readCondition, privilegeLevelRequired: $privilegeLevelRequired, packageCondition: $packageCondition}';
  }

  static DialogEntity fromMap(Map map) {
    if (map == null) return null;

    var bodyComponentsFromMap;
    bodyComponentsFromMap = map['bodyComponents'];
    var bodyComponentsList;
    if (bodyComponentsFromMap != null)
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map))
        .toList();
    var backgroundFromMap;
    backgroundFromMap = map['background'];
    if (backgroundFromMap != null)
      backgroundFromMap = RgbEntity.fromMap(backgroundFromMap);
    var readConditionFromMap;
    readConditionFromMap = map['readCondition'];
    if (readConditionFromMap != null)
      readConditionFromMap = toReadCondition(map['readCondition']);

    return DialogEntity(
      appId: map['appId'], 
      title: map['title'], 
      bodyComponents: bodyComponentsList, 
      background: backgroundFromMap, 
      layout: map['layout'], 
      gridViewId: map['gridViewId'], 
      readCondition: readConditionFromMap, 
      privilegeLevelRequired: int.tryParse(map['privilegeLevelRequired'].toString()), 
      packageCondition: map['packageCondition'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic> backgroundMap = background != null 
        ? background.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (bodyComponents != null) theDocument["bodyComponents"] = bodyComponentsListMap;
      else theDocument["bodyComponents"] = null;
    if (background != null) theDocument["background"] = backgroundMap;
      else theDocument["background"] = null;
    if (layout != null) theDocument["layout"] = layout;
      else theDocument["layout"] = null;
    if (gridViewId != null) theDocument["gridViewId"] = gridViewId;
      else theDocument["gridViewId"] = null;
    if (readCondition != null) theDocument['readCondition'] = readCondition.index; else theDocument['readCondition'] = null;
    if (privilegeLevelRequired != null) theDocument["privilegeLevelRequired"] = privilegeLevelRequired;
      else theDocument["privilegeLevelRequired"] = null;
    if (packageCondition != null) theDocument["packageCondition"] = packageCondition;
      else theDocument["packageCondition"] = null;
    return theDocument;
  }

  static DialogEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

