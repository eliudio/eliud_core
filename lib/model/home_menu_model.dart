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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/home_menu_entity.dart';




class HomeMenuModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'homeMenus';

  String documentID;
  String appId;
  String? name;
  MenuDefModel? menu;
  RgbModel? iconColorOverride;

  // Override the style background
  BackgroundModel? backgroundOverride;
  RgbModel? popupMenuBackgroundColorOverride;

  HomeMenuModel({required this.documentID, required this.appId, this.name, this.menu, this.iconColorOverride, this.backgroundOverride, this.popupMenuBackgroundColorOverride, })  {
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

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (menu != null) {
      referencesCollector.add(ModelReference(MenuDefModel.packageName, MenuDefModel.id, menu!));
    }
    if (menu != null) referencesCollector.addAll(await menu!.collectReferences(appId: appId));
    if (iconColorOverride != null) referencesCollector.addAll(await iconColorOverride!.collectReferences(appId: appId));
    if (backgroundOverride != null) referencesCollector.addAll(await backgroundOverride!.collectReferences(appId: appId));
    if (popupMenuBackgroundColorOverride != null) referencesCollector.addAll(await popupMenuBackgroundColorOverride!.collectReferences(appId: appId));
    return referencesCollector;
  }

  HomeMenuEntity toEntity({String? appId}) {
    return HomeMenuEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          menuId: (menu != null) ? menu!.documentID : null, 
          iconColorOverride: (iconColorOverride != null) ? iconColorOverride!.toEntity(appId: appId) : null, 
          backgroundOverride: (backgroundOverride != null) ? backgroundOverride!.toEntity(appId: appId) : null, 
          popupMenuBackgroundColorOverride: (popupMenuBackgroundColorOverride != null) ? popupMenuBackgroundColorOverride!.toEntity(appId: appId) : null, 
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

