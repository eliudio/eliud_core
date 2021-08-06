/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class EliudStyleAttributesEntity {
  final String? description;
  final RgbEntity? formSubmitButtonColor;
  final String? formBackgroundId;
  final String? appBackgroundId;
  final RgbEntity? formSubmitButtonTextColor;
  final RgbEntity? formGroupTitleColor;
  final RgbEntity? formFieldTextColor;
  final RgbEntity? formFieldHeaderColor;
  final RgbEntity? formFieldFocusColor;
  final String? listBackgroundId;
  final RgbEntity? listTextItemColor;
  final RgbEntity? floatingButtonForegroundColor;
  final RgbEntity? floatingButtonBackgroundColor;
  final RgbEntity? dividerColor;
  final String? appBarBGId;
  final RgbEntity? appBarIconColor;
  final RgbEntity? appBarSelectedIconColor;
  final RgbEntity? appBarMenuBackgroundColor;
  final String? bottomNavigationBarBGId;
  final String? drawerBGId;
  final String? drawerHeaderBGId;
  final String? profileDrawerBGId;
  final String? profileDrawerHeaderBGId;
  final String? backgroundHomeMenuId;
  final RgbEntity? backgroundColorHomeMenu;
  final RgbEntity? iconColorHomeMenu;
  final String? h1Id;
  final String? h2Id;
  final String? h3Id;
  final String? h4Id;
  final String? h5Id;
  final String? fontTextId;
  final String? fontSmallTextId;
  final String? fontHighlight1Id;
  final String? fontHighlight2Id;
  final String? fontLinkId;

  EliudStyleAttributesEntity({this.description, this.formSubmitButtonColor, this.formBackgroundId, this.appBackgroundId, this.formSubmitButtonTextColor, this.formGroupTitleColor, this.formFieldTextColor, this.formFieldHeaderColor, this.formFieldFocusColor, this.listBackgroundId, this.listTextItemColor, this.floatingButtonForegroundColor, this.floatingButtonBackgroundColor, this.dividerColor, this.appBarBGId, this.appBarIconColor, this.appBarSelectedIconColor, this.appBarMenuBackgroundColor, this.bottomNavigationBarBGId, this.drawerBGId, this.drawerHeaderBGId, this.profileDrawerBGId, this.profileDrawerHeaderBGId, this.backgroundHomeMenuId, this.backgroundColorHomeMenu, this.iconColorHomeMenu, this.h1Id, this.h2Id, this.h3Id, this.h4Id, this.h5Id, this.fontTextId, this.fontSmallTextId, this.fontHighlight1Id, this.fontHighlight2Id, this.fontLinkId, });


  List<Object?> get props => [description, formSubmitButtonColor, formBackgroundId, appBackgroundId, formSubmitButtonTextColor, formGroupTitleColor, formFieldTextColor, formFieldHeaderColor, formFieldFocusColor, listBackgroundId, listTextItemColor, floatingButtonForegroundColor, floatingButtonBackgroundColor, dividerColor, appBarBGId, appBarIconColor, appBarSelectedIconColor, appBarMenuBackgroundColor, bottomNavigationBarBGId, drawerBGId, drawerHeaderBGId, profileDrawerBGId, profileDrawerHeaderBGId, backgroundHomeMenuId, backgroundColorHomeMenu, iconColorHomeMenu, h1Id, h2Id, h3Id, h4Id, h5Id, fontTextId, fontSmallTextId, fontHighlight1Id, fontHighlight2Id, fontLinkId, ];

  @override
  String toString() {
    return 'EliudStyleAttributesEntity{description: $description, formSubmitButtonColor: $formSubmitButtonColor, formBackgroundId: $formBackgroundId, appBackgroundId: $appBackgroundId, formSubmitButtonTextColor: $formSubmitButtonTextColor, formGroupTitleColor: $formGroupTitleColor, formFieldTextColor: $formFieldTextColor, formFieldHeaderColor: $formFieldHeaderColor, formFieldFocusColor: $formFieldFocusColor, listBackgroundId: $listBackgroundId, listTextItemColor: $listTextItemColor, floatingButtonForegroundColor: $floatingButtonForegroundColor, floatingButtonBackgroundColor: $floatingButtonBackgroundColor, dividerColor: $dividerColor, appBarBGId: $appBarBGId, appBarIconColor: $appBarIconColor, appBarSelectedIconColor: $appBarSelectedIconColor, appBarMenuBackgroundColor: $appBarMenuBackgroundColor, bottomNavigationBarBGId: $bottomNavigationBarBGId, drawerBGId: $drawerBGId, drawerHeaderBGId: $drawerHeaderBGId, profileDrawerBGId: $profileDrawerBGId, profileDrawerHeaderBGId: $profileDrawerHeaderBGId, backgroundHomeMenuId: $backgroundHomeMenuId, backgroundColorHomeMenu: $backgroundColorHomeMenu, iconColorHomeMenu: $iconColorHomeMenu, h1Id: $h1Id, h2Id: $h2Id, h3Id: $h3Id, h4Id: $h4Id, h5Id: $h5Id, fontTextId: $fontTextId, fontSmallTextId: $fontSmallTextId, fontHighlight1Id: $fontHighlight1Id, fontHighlight2Id: $fontHighlight2Id, fontLinkId: $fontLinkId}';
  }

  static EliudStyleAttributesEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var formSubmitButtonColorFromMap;
    formSubmitButtonColorFromMap = map['formSubmitButtonColor'];
    if (formSubmitButtonColorFromMap != null)
      formSubmitButtonColorFromMap = RgbEntity.fromMap(formSubmitButtonColorFromMap);
    var formSubmitButtonTextColorFromMap;
    formSubmitButtonTextColorFromMap = map['formSubmitButtonTextColor'];
    if (formSubmitButtonTextColorFromMap != null)
      formSubmitButtonTextColorFromMap = RgbEntity.fromMap(formSubmitButtonTextColorFromMap);
    var formGroupTitleColorFromMap;
    formGroupTitleColorFromMap = map['formGroupTitleColor'];
    if (formGroupTitleColorFromMap != null)
      formGroupTitleColorFromMap = RgbEntity.fromMap(formGroupTitleColorFromMap);
    var formFieldTextColorFromMap;
    formFieldTextColorFromMap = map['formFieldTextColor'];
    if (formFieldTextColorFromMap != null)
      formFieldTextColorFromMap = RgbEntity.fromMap(formFieldTextColorFromMap);
    var formFieldHeaderColorFromMap;
    formFieldHeaderColorFromMap = map['formFieldHeaderColor'];
    if (formFieldHeaderColorFromMap != null)
      formFieldHeaderColorFromMap = RgbEntity.fromMap(formFieldHeaderColorFromMap);
    var formFieldFocusColorFromMap;
    formFieldFocusColorFromMap = map['formFieldFocusColor'];
    if (formFieldFocusColorFromMap != null)
      formFieldFocusColorFromMap = RgbEntity.fromMap(formFieldFocusColorFromMap);
    var listTextItemColorFromMap;
    listTextItemColorFromMap = map['listTextItemColor'];
    if (listTextItemColorFromMap != null)
      listTextItemColorFromMap = RgbEntity.fromMap(listTextItemColorFromMap);
    var floatingButtonForegroundColorFromMap;
    floatingButtonForegroundColorFromMap = map['floatingButtonForegroundColor'];
    if (floatingButtonForegroundColorFromMap != null)
      floatingButtonForegroundColorFromMap = RgbEntity.fromMap(floatingButtonForegroundColorFromMap);
    var floatingButtonBackgroundColorFromMap;
    floatingButtonBackgroundColorFromMap = map['floatingButtonBackgroundColor'];
    if (floatingButtonBackgroundColorFromMap != null)
      floatingButtonBackgroundColorFromMap = RgbEntity.fromMap(floatingButtonBackgroundColorFromMap);
    var dividerColorFromMap;
    dividerColorFromMap = map['dividerColor'];
    if (dividerColorFromMap != null)
      dividerColorFromMap = RgbEntity.fromMap(dividerColorFromMap);
    var appBarIconColorFromMap;
    appBarIconColorFromMap = map['appBarIconColor'];
    if (appBarIconColorFromMap != null)
      appBarIconColorFromMap = RgbEntity.fromMap(appBarIconColorFromMap);
    var appBarSelectedIconColorFromMap;
    appBarSelectedIconColorFromMap = map['appBarSelectedIconColor'];
    if (appBarSelectedIconColorFromMap != null)
      appBarSelectedIconColorFromMap = RgbEntity.fromMap(appBarSelectedIconColorFromMap);
    var appBarMenuBackgroundColorFromMap;
    appBarMenuBackgroundColorFromMap = map['appBarMenuBackgroundColor'];
    if (appBarMenuBackgroundColorFromMap != null)
      appBarMenuBackgroundColorFromMap = RgbEntity.fromMap(appBarMenuBackgroundColorFromMap);
    var backgroundColorHomeMenuFromMap;
    backgroundColorHomeMenuFromMap = map['backgroundColorHomeMenu'];
    if (backgroundColorHomeMenuFromMap != null)
      backgroundColorHomeMenuFromMap = RgbEntity.fromMap(backgroundColorHomeMenuFromMap);
    var iconColorHomeMenuFromMap;
    iconColorHomeMenuFromMap = map['iconColorHomeMenu'];
    if (iconColorHomeMenuFromMap != null)
      iconColorHomeMenuFromMap = RgbEntity.fromMap(iconColorHomeMenuFromMap);

    return EliudStyleAttributesEntity(
      description: map['description'], 
      formSubmitButtonColor: formSubmitButtonColorFromMap, 
      formBackgroundId: map['formBackgroundId'], 
      appBackgroundId: map['appBackgroundId'], 
      formSubmitButtonTextColor: formSubmitButtonTextColorFromMap, 
      formGroupTitleColor: formGroupTitleColorFromMap, 
      formFieldTextColor: formFieldTextColorFromMap, 
      formFieldHeaderColor: formFieldHeaderColorFromMap, 
      formFieldFocusColor: formFieldFocusColorFromMap, 
      listBackgroundId: map['listBackgroundId'], 
      listTextItemColor: listTextItemColorFromMap, 
      floatingButtonForegroundColor: floatingButtonForegroundColorFromMap, 
      floatingButtonBackgroundColor: floatingButtonBackgroundColorFromMap, 
      dividerColor: dividerColorFromMap, 
      appBarBGId: map['appBarBGId'], 
      appBarIconColor: appBarIconColorFromMap, 
      appBarSelectedIconColor: appBarSelectedIconColorFromMap, 
      appBarMenuBackgroundColor: appBarMenuBackgroundColorFromMap, 
      bottomNavigationBarBGId: map['bottomNavigationBarBGId'], 
      drawerBGId: map['drawerBGId'], 
      drawerHeaderBGId: map['drawerHeaderBGId'], 
      profileDrawerBGId: map['profileDrawerBGId'], 
      profileDrawerHeaderBGId: map['profileDrawerHeaderBGId'], 
      backgroundHomeMenuId: map['backgroundHomeMenuId'], 
      backgroundColorHomeMenu: backgroundColorHomeMenuFromMap, 
      iconColorHomeMenu: iconColorHomeMenuFromMap, 
      h1Id: map['h1Id'], 
      h2Id: map['h2Id'], 
      h3Id: map['h3Id'], 
      h4Id: map['h4Id'], 
      h5Id: map['h5Id'], 
      fontTextId: map['fontTextId'], 
      fontSmallTextId: map['fontSmallTextId'], 
      fontHighlight1Id: map['fontHighlight1Id'], 
      fontHighlight2Id: map['fontHighlight2Id'], 
      fontLinkId: map['fontLinkId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? formSubmitButtonColorMap = formSubmitButtonColor != null 
        ? formSubmitButtonColor!.toDocument()
        : null;
    final Map<String, dynamic>? formSubmitButtonTextColorMap = formSubmitButtonTextColor != null 
        ? formSubmitButtonTextColor!.toDocument()
        : null;
    final Map<String, dynamic>? formGroupTitleColorMap = formGroupTitleColor != null 
        ? formGroupTitleColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldTextColorMap = formFieldTextColor != null 
        ? formFieldTextColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldHeaderColorMap = formFieldHeaderColor != null 
        ? formFieldHeaderColor!.toDocument()
        : null;
    final Map<String, dynamic>? formFieldFocusColorMap = formFieldFocusColor != null 
        ? formFieldFocusColor!.toDocument()
        : null;
    final Map<String, dynamic>? listTextItemColorMap = listTextItemColor != null 
        ? listTextItemColor!.toDocument()
        : null;
    final Map<String, dynamic>? floatingButtonForegroundColorMap = floatingButtonForegroundColor != null 
        ? floatingButtonForegroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? floatingButtonBackgroundColorMap = floatingButtonBackgroundColor != null 
        ? floatingButtonBackgroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? dividerColorMap = dividerColor != null 
        ? dividerColor!.toDocument()
        : null;
    final Map<String, dynamic>? appBarIconColorMap = appBarIconColor != null 
        ? appBarIconColor!.toDocument()
        : null;
    final Map<String, dynamic>? appBarSelectedIconColorMap = appBarSelectedIconColor != null 
        ? appBarSelectedIconColor!.toDocument()
        : null;
    final Map<String, dynamic>? appBarMenuBackgroundColorMap = appBarMenuBackgroundColor != null 
        ? appBarMenuBackgroundColor!.toDocument()
        : null;
    final Map<String, dynamic>? backgroundColorHomeMenuMap = backgroundColorHomeMenu != null 
        ? backgroundColorHomeMenu!.toDocument()
        : null;
    final Map<String, dynamic>? iconColorHomeMenuMap = iconColorHomeMenu != null 
        ? iconColorHomeMenu!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (formSubmitButtonColor != null) theDocument["formSubmitButtonColor"] = formSubmitButtonColorMap;
      else theDocument["formSubmitButtonColor"] = null;
    if (formBackgroundId != null) theDocument["formBackgroundId"] = formBackgroundId;
      else theDocument["formBackgroundId"] = null;
    if (appBackgroundId != null) theDocument["appBackgroundId"] = appBackgroundId;
      else theDocument["appBackgroundId"] = null;
    if (formSubmitButtonTextColor != null) theDocument["formSubmitButtonTextColor"] = formSubmitButtonTextColorMap;
      else theDocument["formSubmitButtonTextColor"] = null;
    if (formGroupTitleColor != null) theDocument["formGroupTitleColor"] = formGroupTitleColorMap;
      else theDocument["formGroupTitleColor"] = null;
    if (formFieldTextColor != null) theDocument["formFieldTextColor"] = formFieldTextColorMap;
      else theDocument["formFieldTextColor"] = null;
    if (formFieldHeaderColor != null) theDocument["formFieldHeaderColor"] = formFieldHeaderColorMap;
      else theDocument["formFieldHeaderColor"] = null;
    if (formFieldFocusColor != null) theDocument["formFieldFocusColor"] = formFieldFocusColorMap;
      else theDocument["formFieldFocusColor"] = null;
    if (listBackgroundId != null) theDocument["listBackgroundId"] = listBackgroundId;
      else theDocument["listBackgroundId"] = null;
    if (listTextItemColor != null) theDocument["listTextItemColor"] = listTextItemColorMap;
      else theDocument["listTextItemColor"] = null;
    if (floatingButtonForegroundColor != null) theDocument["floatingButtonForegroundColor"] = floatingButtonForegroundColorMap;
      else theDocument["floatingButtonForegroundColor"] = null;
    if (floatingButtonBackgroundColor != null) theDocument["floatingButtonBackgroundColor"] = floatingButtonBackgroundColorMap;
      else theDocument["floatingButtonBackgroundColor"] = null;
    if (dividerColor != null) theDocument["dividerColor"] = dividerColorMap;
      else theDocument["dividerColor"] = null;
    if (appBarBGId != null) theDocument["appBarBGId"] = appBarBGId;
      else theDocument["appBarBGId"] = null;
    if (appBarIconColor != null) theDocument["appBarIconColor"] = appBarIconColorMap;
      else theDocument["appBarIconColor"] = null;
    if (appBarSelectedIconColor != null) theDocument["appBarSelectedIconColor"] = appBarSelectedIconColorMap;
      else theDocument["appBarSelectedIconColor"] = null;
    if (appBarMenuBackgroundColor != null) theDocument["appBarMenuBackgroundColor"] = appBarMenuBackgroundColorMap;
      else theDocument["appBarMenuBackgroundColor"] = null;
    if (bottomNavigationBarBGId != null) theDocument["bottomNavigationBarBGId"] = bottomNavigationBarBGId;
      else theDocument["bottomNavigationBarBGId"] = null;
    if (drawerBGId != null) theDocument["drawerBGId"] = drawerBGId;
      else theDocument["drawerBGId"] = null;
    if (drawerHeaderBGId != null) theDocument["drawerHeaderBGId"] = drawerHeaderBGId;
      else theDocument["drawerHeaderBGId"] = null;
    if (profileDrawerBGId != null) theDocument["profileDrawerBGId"] = profileDrawerBGId;
      else theDocument["profileDrawerBGId"] = null;
    if (profileDrawerHeaderBGId != null) theDocument["profileDrawerHeaderBGId"] = profileDrawerHeaderBGId;
      else theDocument["profileDrawerHeaderBGId"] = null;
    if (backgroundHomeMenuId != null) theDocument["backgroundHomeMenuId"] = backgroundHomeMenuId;
      else theDocument["backgroundHomeMenuId"] = null;
    if (backgroundColorHomeMenu != null) theDocument["backgroundColorHomeMenu"] = backgroundColorHomeMenuMap;
      else theDocument["backgroundColorHomeMenu"] = null;
    if (iconColorHomeMenu != null) theDocument["iconColorHomeMenu"] = iconColorHomeMenuMap;
      else theDocument["iconColorHomeMenu"] = null;
    if (h1Id != null) theDocument["h1Id"] = h1Id;
      else theDocument["h1Id"] = null;
    if (h2Id != null) theDocument["h2Id"] = h2Id;
      else theDocument["h2Id"] = null;
    if (h3Id != null) theDocument["h3Id"] = h3Id;
      else theDocument["h3Id"] = null;
    if (h4Id != null) theDocument["h4Id"] = h4Id;
      else theDocument["h4Id"] = null;
    if (h5Id != null) theDocument["h5Id"] = h5Id;
      else theDocument["h5Id"] = null;
    if (fontTextId != null) theDocument["fontTextId"] = fontTextId;
      else theDocument["fontTextId"] = null;
    if (fontSmallTextId != null) theDocument["fontSmallTextId"] = fontSmallTextId;
      else theDocument["fontSmallTextId"] = null;
    if (fontHighlight1Id != null) theDocument["fontHighlight1Id"] = fontHighlight1Id;
      else theDocument["fontHighlight1Id"] = null;
    if (fontHighlight2Id != null) theDocument["fontHighlight2Id"] = fontHighlight2Id;
      else theDocument["fontHighlight2Id"] = null;
    if (fontLinkId != null) theDocument["fontLinkId"] = fontLinkId;
      else theDocument["fontLinkId"] = null;
    return theDocument;
  }

  static EliudStyleAttributesEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

