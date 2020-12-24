/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class HomeMenuEntity {
  final String appId;
  final String name;
  final String menuId;
  final RgbEntity iconColor;
  final String backgroundId;
  final RgbEntity popupMenuBackgroundColor;

  HomeMenuEntity({this.appId, this.name, this.menuId, this.iconColor, this.backgroundId, this.popupMenuBackgroundColor, });


  List<Object> get props => [appId, name, menuId, iconColor, backgroundId, popupMenuBackgroundColor, ];

  @override
  String toString() {
    return 'HomeMenuEntity{appId: $appId, name: $name, menuId: $menuId, iconColor: $iconColor, backgroundId: $backgroundId, popupMenuBackgroundColor: $popupMenuBackgroundColor}';
  }

  static HomeMenuEntity fromMap(Map map) {
    if (map == null) return null;

    var iconColorFromMap;
    iconColorFromMap = map['iconColor'];
    if (iconColorFromMap != null)
      iconColorFromMap = RgbEntity.fromMap(iconColorFromMap);
    var popupMenuBackgroundColorFromMap;
    popupMenuBackgroundColorFromMap = map['popupMenuBackgroundColor'];
    if (popupMenuBackgroundColorFromMap != null)
      popupMenuBackgroundColorFromMap = RgbEntity.fromMap(popupMenuBackgroundColorFromMap);

    return HomeMenuEntity(
      appId: map['appId'], 
      name: map['name'], 
      menuId: map['menuId'], 
      iconColor: iconColorFromMap, 
      backgroundId: map['backgroundId'], 
      popupMenuBackgroundColor: popupMenuBackgroundColorFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> iconColorMap = iconColor != null 
        ? iconColor.toDocument()
        : null;
    final Map<String, dynamic> popupMenuBackgroundColorMap = popupMenuBackgroundColor != null 
        ? popupMenuBackgroundColor.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (menuId != null) theDocument["menuId"] = menuId;
      else theDocument["menuId"] = null;
    if (iconColor != null) theDocument["iconColor"] = iconColorMap;
      else theDocument["iconColor"] = null;
    if (backgroundId != null) theDocument["backgroundId"] = backgroundId;
      else theDocument["backgroundId"] = null;
    if (popupMenuBackgroundColor != null) theDocument["popupMenuBackgroundColor"] = popupMenuBackgroundColorMap;
      else theDocument["popupMenuBackgroundColor"] = null;
    return theDocument;
  }

  static HomeMenuEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

