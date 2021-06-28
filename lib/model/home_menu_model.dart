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

import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/home_menu_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HomeMenuModel {
  String? documentID;
  String? appId;
  String? name;
  MenuDefModel? menu;
  RgbModel? iconColorOverride;

  // Override the style background
  BackgroundModel? backgroundOverride;
  RgbModel? popupMenuBackgroundColorOverride;

  HomeMenuModel({this.documentID, this.appId, this.name, this.menu, this.iconColorOverride, this.backgroundOverride, this.popupMenuBackgroundColorOverride, })  {
    assert(documentID != null);
  }

  HomeMenuModel copyWith({String? documentID, String? appId, String? name, MenuDefModel? menu, RgbModel? iconColorOverride, BackgroundModel? backgroundOverride, RgbModel? popupMenuBackgroundColorOverride, }) {
    return HomeMenuModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, menu: menu ?? this.menu, iconColorOverride: iconColorOverride ?? this.iconColorOverride, backgroundOverride: backgroundOverride ?? this.backgroundOverride, popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride ?? this.popupMenuBackgroundColorOverride, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ menu.hashCode ^ iconColorOverride.hashCode ^ backgroundOverride.hashCode ^ popupMenuBackgroundColorOverride.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is HomeMenuModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          menu == other.menu &&
          iconColorOverride == other.iconColorOverride &&
          backgroundOverride == other.backgroundOverride &&
          popupMenuBackgroundColorOverride == other.popupMenuBackgroundColorOverride;

  @override
  String toString() {
    return 'HomeMenuModel{documentID: $documentID, appId: $appId, name: $name, menu: $menu, iconColorOverride: $iconColorOverride, backgroundOverride: $backgroundOverride, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride}';
  }

  HomeMenuEntity toEntity({String? appId}) {
    return HomeMenuEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          menuId: (menu != null) ? menu!.documentID : null, 
          iconColorOverride: (iconColorOverride != null) ? iconColorOverride!.toEntity(appId: appId) : null, 
          backgroundOverrideId: (backgroundOverride != null) ? backgroundOverride!.documentID : null, 
          popupMenuBackgroundColorOverride: (popupMenuBackgroundColorOverride != null) ? popupMenuBackgroundColorOverride!.toEntity(appId: appId) : null, 
    );
  }

  static HomeMenuModel? fromEntity(String documentID, HomeMenuEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          iconColorOverride: 
            RgbModel.fromEntity(entity.iconColorOverride), 
          popupMenuBackgroundColorOverride: 
            RgbModel.fromEntity(entity.popupMenuBackgroundColorOverride), 
    );
  }

  static Future<HomeMenuModel?> fromEntityPlus(String documentID, HomeMenuEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MenuDefModel? menuHolder;
    if (entity.menuId != null) {
      try {
          menuHolder = await menuDefRepository(appId: appId)!.get(entity.menuId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise menu');
        print('Error whilst retrieving menuDef with id ${entity.menuId}');
        print('Exception: $e');
      }
    }

    BackgroundModel? backgroundOverrideHolder;
    if (entity.backgroundOverrideId != null) {
      try {
          backgroundOverrideHolder = await backgroundRepository(appId: appId)!.get(entity.backgroundOverrideId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise backgroundOverride');
        print('Error whilst retrieving background with id ${entity.backgroundOverrideId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          menu: menuHolder, 
          iconColorOverride: 
            await RgbModel.fromEntityPlus(entity.iconColorOverride, appId: appId), 
          backgroundOverride: backgroundOverrideHolder, 
          popupMenuBackgroundColorOverride: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColorOverride, appId: appId), 
    );
  }

}

