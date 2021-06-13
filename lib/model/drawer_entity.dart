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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class DrawerEntity {
  final String? appId;
  final String? name;
  final String? backgroundOverrideId;
  final String? headerText;
  final String? secondHeaderText;
  final double? headerHeight;
  final RgbEntity? popupMenuBackgroundColor;
  final String? headerBackgroundOverrideId;
  final String? menuId;

  DrawerEntity({this.appId, this.name, this.backgroundOverrideId, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundOverrideId, this.menuId, });


  List<Object?> get props => [appId, name, backgroundOverrideId, headerText, secondHeaderText, headerHeight, popupMenuBackgroundColor, headerBackgroundOverrideId, menuId, ];

  @override
  String toString() {
    return 'DrawerEntity{appId: $appId, name: $name, backgroundOverrideId: $backgroundOverrideId, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverrideId: $headerBackgroundOverrideId, menuId: $menuId}';
  }

  static DrawerEntity? fromMap(Map? map) {
    if (map == null) return null;

    var popupMenuBackgroundColorFromMap;
    popupMenuBackgroundColorFromMap = map['popupMenuBackgroundColor'];
    if (popupMenuBackgroundColorFromMap != null)
      popupMenuBackgroundColorFromMap = RgbEntity.fromMap(popupMenuBackgroundColorFromMap);

    return DrawerEntity(
      appId: map['appId'], 
      name: map['name'], 
      backgroundOverrideId: map['backgroundOverrideId'], 
      headerText: map['headerText'], 
      secondHeaderText: map['secondHeaderText'], 
      headerHeight: double.tryParse(map['headerHeight'].toString()), 
      popupMenuBackgroundColor: popupMenuBackgroundColorFromMap, 
      headerBackgroundOverrideId: map['headerBackgroundOverrideId'], 
      menuId: map['menuId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? popupMenuBackgroundColorMap = popupMenuBackgroundColor != null 
        ? popupMenuBackgroundColor!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (backgroundOverrideId != null) theDocument["backgroundOverrideId"] = backgroundOverrideId;
      else theDocument["backgroundOverrideId"] = null;
    if (headerText != null) theDocument["headerText"] = headerText;
      else theDocument["headerText"] = null;
    if (secondHeaderText != null) theDocument["secondHeaderText"] = secondHeaderText;
      else theDocument["secondHeaderText"] = null;
    if (headerHeight != null) theDocument["headerHeight"] = headerHeight;
      else theDocument["headerHeight"] = null;
    if (popupMenuBackgroundColor != null) theDocument["popupMenuBackgroundColor"] = popupMenuBackgroundColorMap;
      else theDocument["popupMenuBackgroundColor"] = null;
    if (headerBackgroundOverrideId != null) theDocument["headerBackgroundOverrideId"] = headerBackgroundOverrideId;
      else theDocument["headerBackgroundOverrideId"] = null;
    if (menuId != null) theDocument["menuId"] = menuId;
      else theDocument["menuId"] = null;
    return theDocument;
  }

  static DrawerEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

