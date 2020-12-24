/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/drawer_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DrawerModel {
  String documentID;
  String appId;
  String name;
  BackgroundModel background;
  String headerText;
  String secondHeaderText;

  // Header height, 0 for default
  double headerHeight;
  RgbModel popupMenuBackgroundColor;
  BackgroundModel headerBackground;
  MenuDefModel menu;

  DrawerModel({this.documentID, this.appId, this.name, this.background, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackground, this.menu, })  {
    assert(documentID != null);
  }

  DrawerModel copyWith({String documentID, String appId, String name, BackgroundModel background, String headerText, String secondHeaderText, double headerHeight, RgbModel popupMenuBackgroundColor, BackgroundModel headerBackground, MenuDefModel menu, }) {
    return DrawerModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, background: background ?? this.background, headerText: headerText ?? this.headerText, secondHeaderText: secondHeaderText ?? this.secondHeaderText, headerHeight: headerHeight ?? this.headerHeight, popupMenuBackgroundColor: popupMenuBackgroundColor ?? this.popupMenuBackgroundColor, headerBackground: headerBackground ?? this.headerBackground, menu: menu ?? this.menu, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ background.hashCode ^ headerText.hashCode ^ secondHeaderText.hashCode ^ headerHeight.hashCode ^ popupMenuBackgroundColor.hashCode ^ headerBackground.hashCode ^ menu.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DrawerModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          background == other.background &&
          headerText == other.headerText &&
          secondHeaderText == other.secondHeaderText &&
          headerHeight == other.headerHeight &&
          popupMenuBackgroundColor == other.popupMenuBackgroundColor &&
          headerBackground == other.headerBackground &&
          menu == other.menu;

  @override
  String toString() {
    return 'DrawerModel{documentID: $documentID, appId: $appId, name: $name, background: $background, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackground: $headerBackground, menu: $menu}';
  }

  DrawerEntity toEntity({String appId}) {
    return DrawerEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          backgroundId: (background != null) ? background.documentID : null, 
          headerText: (headerText != null) ? headerText : null, 
          secondHeaderText: (secondHeaderText != null) ? secondHeaderText : null, 
          headerHeight: (headerHeight != null) ? headerHeight : null, 
          popupMenuBackgroundColor: (popupMenuBackgroundColor != null) ? popupMenuBackgroundColor.toEntity(appId: appId) : null, 
          headerBackgroundId: (headerBackground != null) ? headerBackground.documentID : null, 
          menuId: (menu != null) ? menu.documentID : null, 
    );
  }

  static DrawerModel fromEntity(String documentID, DrawerEntity entity) {
    if (entity == null) return null;
    return DrawerModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          headerText: entity.headerText, 
          secondHeaderText: entity.secondHeaderText, 
          headerHeight: entity.headerHeight, 
          popupMenuBackgroundColor: 
            RgbModel.fromEntity(entity.popupMenuBackgroundColor), 
    );
  }

  static Future<DrawerModel> fromEntityPlus(String documentID, DrawerEntity entity, { String appId}) async {
    if (entity == null) return null;

    BackgroundModel backgroundHolder;
    if (entity.backgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.backgroundId).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel headerBackgroundHolder;
    if (entity.headerBackgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.headerBackgroundId).then((val) {
          headerBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MenuDefModel menuHolder;
    if (entity.menuId != null) {
      try {
        await menuDefRepository(appId: appId).get(entity.menuId).then((val) {
          menuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return DrawerModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          background: backgroundHolder, 
          headerText: entity.headerText, 
          secondHeaderText: entity.secondHeaderText, 
          headerHeight: entity.headerHeight, 
          popupMenuBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColor, appId: appId), 
          headerBackground: headerBackgroundHolder, 
          menu: menuHolder, 
    );
  }

}

