/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/home_menu_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HomeMenuModel {
  String documentID;
  String appId;
  String name;
  MenuDefModel menu;
  RgbModel iconColor;
  BackgroundModel background;
  RgbModel popupMenuBackgroundColor;

  HomeMenuModel({this.documentID, this.appId, this.name, this.menu, this.iconColor, this.background, this.popupMenuBackgroundColor, })  {
    assert(documentID != null);
  }

  HomeMenuModel copyWith({String documentID, String appId, String name, MenuDefModel menu, RgbModel iconColor, BackgroundModel background, RgbModel popupMenuBackgroundColor, }) {
    return HomeMenuModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, menu: menu ?? this.menu, iconColor: iconColor ?? this.iconColor, background: background ?? this.background, popupMenuBackgroundColor: popupMenuBackgroundColor ?? this.popupMenuBackgroundColor, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ menu.hashCode ^ iconColor.hashCode ^ background.hashCode ^ popupMenuBackgroundColor.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HomeMenuModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          menu == other.menu &&
          iconColor == other.iconColor &&
          background == other.background &&
          popupMenuBackgroundColor == other.popupMenuBackgroundColor;

  @override
  String toString() {
    return 'HomeMenuModel{documentID: $documentID, appId: $appId, name: $name, menu: $menu, iconColor: $iconColor, background: $background, popupMenuBackgroundColor: $popupMenuBackgroundColor}';
  }

  HomeMenuEntity toEntity() {
    appId = GlobalData.app().documentID;
    return HomeMenuEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          menuId: (menu != null) ? menu.documentID : null, 
          iconColor: (iconColor != null) ? iconColor.toEntity() : null, 
          backgroundId: (background != null) ? background.documentID : null, 
          popupMenuBackgroundColor: (popupMenuBackgroundColor != null) ? popupMenuBackgroundColor.toEntity() : null, 
    );
  }

  static HomeMenuModel fromEntity(String documentID, HomeMenuEntity entity) {
    if (entity == null) return null;
    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          iconColor: 
            RgbModel.fromEntity(entity.iconColor), 
          popupMenuBackgroundColor: 
            RgbModel.fromEntity(entity.popupMenuBackgroundColor), 
    );
  }

  static Future<HomeMenuModel> fromEntityPlus(String documentID, HomeMenuEntity entity) async {
    if (entity == null) return null;

    MenuDefModel menuHolder;
    if (entity.menuId != null) {
      try {
        await menuDefRepository().get(entity.menuId).then((val) {
          menuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel backgroundHolder;
    if (entity.backgroundId != null) {
      try {
        await backgroundRepository().get(entity.backgroundId).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          menu: menuHolder, 
          iconColor: 
            await RgbModel.fromEntityPlus(entity.iconColor), 
          background: backgroundHolder, 
          popupMenuBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColor), 
    );
  }

}

