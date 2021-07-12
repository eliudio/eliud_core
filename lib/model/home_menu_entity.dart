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
import 'abstract_repository_singleton.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class HomeMenuEntity {
  final String? appId;
  final String? name;
  final String? menuId;
  final RgbEntity? iconColorOverride;
  final String? backgroundOverrideId;
  final RgbEntity? popupMenuBackgroundColorOverride;

  HomeMenuEntity({this.appId, this.name, this.menuId, this.iconColorOverride, this.backgroundOverrideId, this.popupMenuBackgroundColorOverride, });


  List<Object?> get props => [appId, name, menuId, iconColorOverride, backgroundOverrideId, popupMenuBackgroundColorOverride, ];

  @override
  String toString() {
    return 'HomeMenuEntity{appId: $appId, name: $name, menuId: $menuId, iconColorOverride: $iconColorOverride, backgroundOverrideId: $backgroundOverrideId, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride}';
  }

  static HomeMenuEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var iconColorOverrideFromMap;
    iconColorOverrideFromMap = map['iconColorOverride'];
    if (iconColorOverrideFromMap != null)
      iconColorOverrideFromMap = RgbEntity.fromMap(iconColorOverrideFromMap);
    var popupMenuBackgroundColorOverrideFromMap;
    popupMenuBackgroundColorOverrideFromMap = map['popupMenuBackgroundColorOverride'];
    if (popupMenuBackgroundColorOverrideFromMap != null)
      popupMenuBackgroundColorOverrideFromMap = RgbEntity.fromMap(popupMenuBackgroundColorOverrideFromMap);

    return HomeMenuEntity(
      appId: map['appId'], 
      name: map['name'], 
      menuId: map['menuId'], 
      iconColorOverride: iconColorOverrideFromMap, 
      backgroundOverrideId: map['backgroundOverrideId'], 
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverrideFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? iconColorOverrideMap = iconColorOverride != null 
        ? iconColorOverride!.toDocument()
        : null;
    final Map<String, dynamic>? popupMenuBackgroundColorOverrideMap = popupMenuBackgroundColorOverride != null 
        ? popupMenuBackgroundColorOverride!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (menuId != null) theDocument["menuId"] = menuId;
      else theDocument["menuId"] = null;
    if (iconColorOverride != null) theDocument["iconColorOverride"] = iconColorOverrideMap;
      else theDocument["iconColorOverride"] = null;
    if (backgroundOverrideId != null) theDocument["backgroundOverrideId"] = backgroundOverrideId;
      else theDocument["backgroundOverrideId"] = null;
    if (popupMenuBackgroundColorOverride != null) theDocument["popupMenuBackgroundColorOverride"] = popupMenuBackgroundColorOverrideMap;
      else theDocument["popupMenuBackgroundColorOverride"] = null;
    return theDocument;
  }

  static HomeMenuEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

