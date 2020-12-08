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
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class PageEntity {
  final String appId;
  final String title;
  final String appBarId;
  final String drawerId;
  final String endDrawerId;
  final String homeMenuId;
  final List<BodyComponentEntity> bodyComponents;
  final String backgroundId;
  final int layout;
  final String gridViewId;
  final int conditional;
  final String packageCondition;

  PageEntity({this.appId, this.title, this.appBarId, this.drawerId, this.endDrawerId, this.homeMenuId, this.bodyComponents, this.backgroundId, this.layout, this.gridViewId, this.conditional, this.packageCondition, });


  List<Object> get props => [appId, title, appBarId, drawerId, endDrawerId, homeMenuId, bodyComponents, backgroundId, layout, gridViewId, conditional, packageCondition, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'PageEntity{appId: $appId, title: $title, appBarId: $appBarId, drawerId: $drawerId, endDrawerId: $endDrawerId, homeMenuId: $homeMenuId, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundId: $backgroundId, layout: $layout, gridViewId: $gridViewId, conditional: $conditional, packageCondition: $packageCondition}';
  }

  static PageEntity fromMap(Map map) {
    if (map == null) return null;

    final bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map))
        .toList();

    return PageEntity(
      appId: map['appId'], 
      title: map['title'], 
      appBarId: map['appBarId'], 
      drawerId: map['drawerId'], 
      endDrawerId: map['endDrawerId'], 
      homeMenuId: map['homeMenuId'], 
      bodyComponents: bodyComponentsList, 
      backgroundId: map['backgroundId'], 
      layout: map['layout'], 
      gridViewId: map['gridViewId'], 
      conditional: map['conditional'], 
      packageCondition: map['packageCondition'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
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
    if (backgroundId != null) theDocument["backgroundId"] = backgroundId;
      else theDocument["backgroundId"] = null;
    if (layout != null) theDocument["layout"] = layout;
      else theDocument["layout"] = null;
    if (gridViewId != null) theDocument["gridViewId"] = gridViewId;
      else theDocument["gridViewId"] = null;
    if (conditional != null) theDocument["conditional"] = conditional;
      else theDocument["conditional"] = null;
    if (packageCondition != null) theDocument["packageCondition"] = packageCondition;
      else theDocument["packageCondition"] = null;
    return theDocument;
  }

  static PageEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

