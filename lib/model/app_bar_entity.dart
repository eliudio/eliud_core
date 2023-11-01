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
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppBarEntity implements EntityBase {
  final String? appId;
  final String? title;
  final int? header;
  final IconEntity? icon;
  final String? imageId;
  final String? iconMenuId;
  final BackgroundEntity? backgroundOverride;
  final RgbEntity? iconColorOverride;
  final RgbEntity? selectedIconColorOverride;
  final RgbEntity? menuBackgroundColorOverride;

  AppBarEntity({required this.appId, this.title, this.header, this.icon, this.imageId, this.iconMenuId, this.backgroundOverride, this.iconColorOverride, this.selectedIconColorOverride, this.menuBackgroundColorOverride, });

  AppBarEntity copyWith({String? documentID, String? appId, String? title, int? header, IconEntity? icon, String? imageId, String? iconMenuId, BackgroundEntity? backgroundOverride, RgbEntity? iconColorOverride, RgbEntity? selectedIconColorOverride, RgbEntity? menuBackgroundColorOverride, }) {
    return AppBarEntity(appId : appId ?? this.appId, title : title ?? this.title, header : header ?? this.header, icon : icon ?? this.icon, imageId : imageId ?? this.imageId, iconMenuId : iconMenuId ?? this.iconMenuId, backgroundOverride : backgroundOverride ?? this.backgroundOverride, iconColorOverride : iconColorOverride ?? this.iconColorOverride, selectedIconColorOverride : selectedIconColorOverride ?? this.selectedIconColorOverride, menuBackgroundColorOverride : menuBackgroundColorOverride ?? this.menuBackgroundColorOverride, );
  }
  List<Object?> get props => [appId, title, header, icon, imageId, iconMenuId, backgroundOverride, iconColorOverride, selectedIconColorOverride, menuBackgroundColorOverride, ];

  @override
  String toString() {
    return 'AppBarEntity{appId: $appId, title: $title, header: $header, icon: $icon, imageId: $imageId, iconMenuId: $iconMenuId, backgroundOverride: $backgroundOverride, iconColorOverride: $iconColorOverride, selectedIconColorOverride: $selectedIconColorOverride, menuBackgroundColorOverride: $menuBackgroundColorOverride}';
  }

  static AppBarEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var iconFromMap;
    iconFromMap = map['icon'];
    if (iconFromMap != null)
      iconFromMap = IconEntity.fromMap(iconFromMap, newDocumentIds: newDocumentIds);
    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    var backgroundOverrideFromMap;
    backgroundOverrideFromMap = map['backgroundOverride'];
    if (backgroundOverrideFromMap != null)
      backgroundOverrideFromMap = BackgroundEntity.fromMap(backgroundOverrideFromMap, newDocumentIds: newDocumentIds);
    var iconColorOverrideFromMap;
    iconColorOverrideFromMap = map['iconColorOverride'];
    if (iconColorOverrideFromMap != null)
      iconColorOverrideFromMap = RgbEntity.fromMap(iconColorOverrideFromMap, newDocumentIds: newDocumentIds);
    var selectedIconColorOverrideFromMap;
    selectedIconColorOverrideFromMap = map['selectedIconColorOverride'];
    if (selectedIconColorOverrideFromMap != null)
      selectedIconColorOverrideFromMap = RgbEntity.fromMap(selectedIconColorOverrideFromMap, newDocumentIds: newDocumentIds);
    var menuBackgroundColorOverrideFromMap;
    menuBackgroundColorOverrideFromMap = map['menuBackgroundColorOverride'];
    if (menuBackgroundColorOverrideFromMap != null)
      menuBackgroundColorOverrideFromMap = RgbEntity.fromMap(menuBackgroundColorOverrideFromMap, newDocumentIds: newDocumentIds);

    return AppBarEntity(
      appId: map['appId'], 
      title: map['title'], 
      header: map['header'], 
      icon: iconFromMap, 
      imageId: imageIdNewDocmentId, 
      iconMenuId: map['iconMenuId'], 
      backgroundOverride: backgroundOverrideFromMap, 
      iconColorOverride: iconColorOverrideFromMap, 
      selectedIconColorOverride: selectedIconColorOverrideFromMap, 
      menuBackgroundColorOverride: menuBackgroundColorOverrideFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? iconMap = icon != null 
        ? icon!.toDocument()
        : null;
    final Map<String, dynamic>? backgroundOverrideMap = backgroundOverride != null 
        ? backgroundOverride!.toDocument()
        : null;
    final Map<String, dynamic>? iconColorOverrideMap = iconColorOverride != null 
        ? iconColorOverride!.toDocument()
        : null;
    final Map<String, dynamic>? selectedIconColorOverrideMap = selectedIconColorOverride != null 
        ? selectedIconColorOverride!.toDocument()
        : null;
    final Map<String, dynamic>? menuBackgroundColorOverrideMap = menuBackgroundColorOverride != null 
        ? menuBackgroundColorOverride!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
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
    if (backgroundOverride != null) theDocument["backgroundOverride"] = backgroundOverrideMap;
      else theDocument["backgroundOverride"] = null;
    if (iconColorOverride != null) theDocument["iconColorOverride"] = iconColorOverrideMap;
      else theDocument["iconColorOverride"] = null;
    if (selectedIconColorOverride != null) theDocument["selectedIconColorOverride"] = selectedIconColorOverrideMap;
      else theDocument["selectedIconColorOverride"] = null;
    if (menuBackgroundColorOverride != null) theDocument["menuBackgroundColorOverride"] = menuBackgroundColorOverrideMap;
      else theDocument["menuBackgroundColorOverride"] = null;
    return theDocument;
  }

  @override
  AppBarEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AppBarEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

