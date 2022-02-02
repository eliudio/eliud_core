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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DrawerEntity {
  final String? appId;
  final String? name;
  final BackgroundEntity? backgroundOverride;
  final String? headerText;
  final String? secondHeaderText;
  final double? headerHeight;
  final RgbEntity? popupMenuBackgroundColor;
  final BackgroundEntity? headerBackgroundOverride;
  final RgbEntity? popupMenuBackgroundColorOverride;
  final String? menuId;

  DrawerEntity({this.appId, this.name, this.backgroundOverride, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundOverride, this.popupMenuBackgroundColorOverride, this.menuId, });


  List<Object?> get props => [appId, name, backgroundOverride, headerText, secondHeaderText, headerHeight, popupMenuBackgroundColor, headerBackgroundOverride, popupMenuBackgroundColorOverride, menuId, ];

  @override
  String toString() {
    return 'DrawerEntity{appId: $appId, name: $name, backgroundOverride: $backgroundOverride, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverride: $headerBackgroundOverride, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride, menuId: $menuId}';
  }

  static DrawerEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backgroundOverrideFromMap;
    backgroundOverrideFromMap = map['backgroundOverride'];
    if (backgroundOverrideFromMap != null)
      backgroundOverrideFromMap = BackgroundEntity.fromMap(backgroundOverrideFromMap);
    var popupMenuBackgroundColorFromMap;
    popupMenuBackgroundColorFromMap = map['popupMenuBackgroundColor'];
    if (popupMenuBackgroundColorFromMap != null)
      popupMenuBackgroundColorFromMap = RgbEntity.fromMap(popupMenuBackgroundColorFromMap);
    var headerBackgroundOverrideFromMap;
    headerBackgroundOverrideFromMap = map['headerBackgroundOverride'];
    if (headerBackgroundOverrideFromMap != null)
      headerBackgroundOverrideFromMap = BackgroundEntity.fromMap(headerBackgroundOverrideFromMap);
    var popupMenuBackgroundColorOverrideFromMap;
    popupMenuBackgroundColorOverrideFromMap = map['popupMenuBackgroundColorOverride'];
    if (popupMenuBackgroundColorOverrideFromMap != null)
      popupMenuBackgroundColorOverrideFromMap = RgbEntity.fromMap(popupMenuBackgroundColorOverrideFromMap);

    return DrawerEntity(
      appId: map['appId'], 
      name: map['name'], 
      backgroundOverride: backgroundOverrideFromMap, 
      headerText: map['headerText'], 
      secondHeaderText: map['secondHeaderText'], 
      headerHeight: double.tryParse(map['headerHeight'].toString()), 
      popupMenuBackgroundColor: popupMenuBackgroundColorFromMap, 
      headerBackgroundOverride: headerBackgroundOverrideFromMap, 
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverrideFromMap, 
      menuId: map['menuId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backgroundOverrideMap = backgroundOverride != null 
        ? backgroundOverride!.toDocument()
        : null;
    final Map<String, dynamic>? popupMenuBackgroundColorMap = popupMenuBackgroundColor != null 
        ? popupMenuBackgroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? headerBackgroundOverrideMap = headerBackgroundOverride != null 
        ? headerBackgroundOverride!.toDocument()
        : null;
    final Map<String, dynamic>? popupMenuBackgroundColorOverrideMap = popupMenuBackgroundColorOverride != null 
        ? popupMenuBackgroundColorOverride!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (backgroundOverride != null) theDocument["backgroundOverride"] = backgroundOverrideMap;
      else theDocument["backgroundOverride"] = null;
    if (headerText != null) theDocument["headerText"] = headerText;
      else theDocument["headerText"] = null;
    if (secondHeaderText != null) theDocument["secondHeaderText"] = secondHeaderText;
      else theDocument["secondHeaderText"] = null;
    if (headerHeight != null) theDocument["headerHeight"] = headerHeight;
      else theDocument["headerHeight"] = null;
    if (popupMenuBackgroundColor != null) theDocument["popupMenuBackgroundColor"] = popupMenuBackgroundColorMap;
      else theDocument["popupMenuBackgroundColor"] = null;
    if (headerBackgroundOverride != null) theDocument["headerBackgroundOverride"] = headerBackgroundOverrideMap;
      else theDocument["headerBackgroundOverride"] = null;
    if (popupMenuBackgroundColorOverride != null) theDocument["popupMenuBackgroundColorOverride"] = popupMenuBackgroundColorOverrideMap;
      else theDocument["popupMenuBackgroundColorOverride"] = null;
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

