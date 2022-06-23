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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/home_menu_entity.dart';

import 'package:eliud_core/tools/random.dart';



class HomeMenuModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? name;
  MenuDefModel? menu;
  RgbModel? iconColorOverride;

  // Override the style background
  BackgroundModel? backgroundOverride;
  RgbModel? popupMenuBackgroundColorOverride;

  HomeMenuModel({required this.documentID, required this.appId, this.name, this.menu, this.iconColorOverride, this.backgroundOverride, this.popupMenuBackgroundColorOverride, })  {
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

  HomeMenuEntity toEntity({String? appId, List<ModelBase>? referencesCollector}) {
    if (referencesCollector != null) {
      if (menu != null) referencesCollector.add(menu!);
    }
    return HomeMenuEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          menuId: (menu != null) ? menu!.documentID : null, 
          iconColorOverride: (iconColorOverride != null) ? iconColorOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          backgroundOverride: (backgroundOverride != null) ? backgroundOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          popupMenuBackgroundColorOverride: (popupMenuBackgroundColorOverride != null) ? popupMenuBackgroundColorOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
    );
  }

  static Future<HomeMenuModel?> fromEntity(String documentID, HomeMenuEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          iconColorOverride: 
            await RgbModel.fromEntity(entity.iconColorOverride), 
          backgroundOverride: 
            await BackgroundModel.fromEntity(entity.backgroundOverride), 
          popupMenuBackgroundColorOverride: 
            await RgbModel.fromEntity(entity.popupMenuBackgroundColorOverride), 
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

    var counter = 0;
    return HomeMenuModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          menu: menuHolder, 
          iconColorOverride: 
            await RgbModel.fromEntityPlus(entity.iconColorOverride, appId: appId), 
          backgroundOverride: 
            await BackgroundModel.fromEntityPlus(entity.backgroundOverride, appId: appId), 
          popupMenuBackgroundColorOverride: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColorOverride, appId: appId), 
    );
  }

}

