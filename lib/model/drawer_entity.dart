/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class DrawerEntity {
  final String appId;
  final String name;
  final String backgroundId;
  final String headerText;
  final String secondHeaderText;
  final double headerHeight;
  final RgbEntity popupMenuBackgroundColor;
  final String headerBackgroundId;
  final String menuId;

  DrawerEntity({this.appId, this.name, this.backgroundId, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundId, this.menuId, });


  List<Object> get props => [appId, name, backgroundId, headerText, secondHeaderText, headerHeight, popupMenuBackgroundColor, headerBackgroundId, menuId, ];

  @override
  String toString() {
    return 'DrawerEntity{appId: $appId, name: $name, backgroundId: $backgroundId, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundId: $headerBackgroundId, menuId: $menuId}';
  }

  static DrawerEntity fromMap(Map map) {
    if (map == null) return null;

    var popupMenuBackgroundColorFromMap;
    popupMenuBackgroundColorFromMap = map['popupMenuBackgroundColor'];
    if (popupMenuBackgroundColorFromMap != null)
      popupMenuBackgroundColorFromMap = RgbEntity.fromMap(popupMenuBackgroundColorFromMap);

    return DrawerEntity(
      appId: map['appId'], 
      name: map['name'], 
      backgroundId: map['backgroundId'], 
      headerText: map['headerText'], 
      secondHeaderText: map['secondHeaderText'], 
      headerHeight: double.tryParse(map['headerHeight'].toString()), 
      popupMenuBackgroundColor: popupMenuBackgroundColorFromMap, 
      headerBackgroundId: map['headerBackgroundId'], 
      menuId: map['menuId'], 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> popupMenuBackgroundColorMap = popupMenuBackgroundColor != null 
        ? popupMenuBackgroundColor.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (backgroundId != null) theDocument["backgroundId"] = backgroundId;
      else theDocument["backgroundId"] = null;
    if (headerText != null) theDocument["headerText"] = headerText;
      else theDocument["headerText"] = null;
    if (secondHeaderText != null) theDocument["secondHeaderText"] = secondHeaderText;
      else theDocument["secondHeaderText"] = null;
    if (headerHeight != null) theDocument["headerHeight"] = headerHeight;
      else theDocument["headerHeight"] = null;
    if (popupMenuBackgroundColor != null) theDocument["popupMenuBackgroundColor"] = popupMenuBackgroundColorMap;
      else theDocument["popupMenuBackgroundColor"] = null;
    if (headerBackgroundId != null) theDocument["headerBackgroundId"] = headerBackgroundId;
      else theDocument["headerBackgroundId"] = null;
    if (menuId != null) theDocument["menuId"] = menuId;
      else theDocument["menuId"] = null;
    return theDocument;
  }

  static DrawerEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

