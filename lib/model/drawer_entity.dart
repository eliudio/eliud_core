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
  final String? backgroundOverrideId;
  final String? headerText;
  final String? secondHeaderText;
  final double? headerHeight;
  final RgbEntity? popupMenuBackgroundColor;
  final String? headerBackgroundOverrideId;
  final RgbEntity? popupMenuBackgroundColorOverride;
  final String? menuId;

  DrawerEntity({this.appId, this.name, this.backgroundOverrideId, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundOverrideId, this.popupMenuBackgroundColorOverride, this.menuId, });


  List<Object?> get props => [appId, name, backgroundOverrideId, headerText, secondHeaderText, headerHeight, popupMenuBackgroundColor, headerBackgroundOverrideId, popupMenuBackgroundColorOverride, menuId, ];

  @override
  String toString() {
    return 'DrawerEntity{appId: $appId, name: $name, backgroundOverrideId: $backgroundOverrideId, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverrideId: $headerBackgroundOverrideId, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride, menuId: $menuId}';
  }

  static DrawerEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var popupMenuBackgroundColorFromMap;
    popupMenuBackgroundColorFromMap = map['popupMenuBackgroundColor'];
    if (popupMenuBackgroundColorFromMap != null)
      popupMenuBackgroundColorFromMap = RgbEntity.fromMap(popupMenuBackgroundColorFromMap);
    var popupMenuBackgroundColorOverrideFromMap;
    popupMenuBackgroundColorOverrideFromMap = map['popupMenuBackgroundColorOverride'];
    if (popupMenuBackgroundColorOverrideFromMap != null)
      popupMenuBackgroundColorOverrideFromMap = RgbEntity.fromMap(popupMenuBackgroundColorOverrideFromMap);

    return DrawerEntity(
      appId: map['appId'], 
      name: map['name'], 
      backgroundOverrideId: map['backgroundOverrideId'], 
      headerText: map['headerText'], 
      secondHeaderText: map['secondHeaderText'], 
      headerHeight: double.tryParse(map['headerHeight'].toString()), 
      popupMenuBackgroundColor: popupMenuBackgroundColorFromMap, 
      headerBackgroundOverrideId: map['headerBackgroundOverrideId'], 
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverrideFromMap, 
      menuId: map['menuId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? popupMenuBackgroundColorMap = popupMenuBackgroundColor != null 
        ? popupMenuBackgroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? popupMenuBackgroundColorOverrideMap = popupMenuBackgroundColorOverride != null 
        ? popupMenuBackgroundColorOverride!.toDocument()
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

