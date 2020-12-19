/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppBarEntity {
  final String appId;
  final String title;
  final int header;
  final IconEntity icon;
  final String imageId;
  final String iconMenuId;
  final String backgroundId;
  final RgbEntity iconColor;
  final RgbEntity selectedIconColor;
  final RgbEntity menuBackgroundColor;

  AppBarEntity({this.appId, this.title, this.header, this.icon, this.imageId, this.iconMenuId, this.backgroundId, this.iconColor, this.selectedIconColor, this.menuBackgroundColor, });


  List<Object> get props => [appId, title, header, icon, imageId, iconMenuId, backgroundId, iconColor, selectedIconColor, menuBackgroundColor, ];

  @override
  String toString() {
    return 'AppBarEntity{appId: $appId, title: $title, header: $header, icon: $icon, imageId: $imageId, iconMenuId: $iconMenuId, backgroundId: $backgroundId, iconColor: $iconColor, selectedIconColor: $selectedIconColor, menuBackgroundColor: $menuBackgroundColor}';
  }

  static AppBarEntity fromMap(Map map) {
    if (map == null) return null;

    var iconFromMap;
    iconFromMap = map['icon'];
    if (iconFromMap != null)
      iconFromMap = IconEntity.fromMap(iconFromMap);
    var iconColorFromMap;
    iconColorFromMap = map['iconColor'];
    if (iconColorFromMap != null)
      iconColorFromMap = RgbEntity.fromMap(iconColorFromMap);
    var selectedIconColorFromMap;
    selectedIconColorFromMap = map['selectedIconColor'];
    if (selectedIconColorFromMap != null)
      selectedIconColorFromMap = RgbEntity.fromMap(selectedIconColorFromMap);
    var menuBackgroundColorFromMap;
    menuBackgroundColorFromMap = map['menuBackgroundColor'];
    if (menuBackgroundColorFromMap != null)
      menuBackgroundColorFromMap = RgbEntity.fromMap(menuBackgroundColorFromMap);

    return AppBarEntity(
      appId: map['appId'], 
      title: map['title'], 
      header: map['header'], 
      icon: iconFromMap, 
      imageId: map['imageId'], 
      iconMenuId: map['iconMenuId'], 
      backgroundId: map['backgroundId'], 
      iconColor: iconColorFromMap, 
      selectedIconColor: selectedIconColorFromMap, 
      menuBackgroundColor: menuBackgroundColorFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> iconMap = icon != null 
        ? icon.toDocument()
        : null;
    final Map<String, dynamic> iconColorMap = iconColor != null 
        ? iconColor.toDocument()
        : null;
    final Map<String, dynamic> selectedIconColorMap = selectedIconColor != null 
        ? selectedIconColor.toDocument()
        : null;
    final Map<String, dynamic> menuBackgroundColorMap = menuBackgroundColor != null 
        ? menuBackgroundColor.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (header != null) theDocument["header"] = header;
      else theDocument["header"] = null;
    if (icon != null) theDocument["icon"] = iconMap;
      else theDocument["icon"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (iconMenuId != null) theDocument["iconMenuId"] = iconMenuId;
      else theDocument["iconMenuId"] = null;
    if (backgroundId != null) theDocument["backgroundId"] = backgroundId;
      else theDocument["backgroundId"] = null;
    if (iconColor != null) theDocument["iconColor"] = iconColorMap;
      else theDocument["iconColor"] = null;
    if (selectedIconColor != null) theDocument["selectedIconColor"] = selectedIconColorMap;
      else theDocument["selectedIconColor"] = null;
    if (menuBackgroundColor != null) theDocument["menuBackgroundColor"] = menuBackgroundColorMap;
      else theDocument["menuBackgroundColor"] = null;
    return theDocument;
  }

  static AppBarEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

