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
  String? documentID;
  String? appId;
  String? name;
  BackgroundModel? backgroundOverride;
  String? headerText;
  String? secondHeaderText;

  // Header height, 0 for default
  double? headerHeight;
  RgbModel? popupMenuBackgroundColor;
  BackgroundModel? headerBackgroundOverride;
  MenuDefModel? menu;

  DrawerModel({this.documentID, this.appId, this.name, this.backgroundOverride, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundOverride, this.menu, })  {
    assert(documentID != null);
  }

  DrawerModel copyWith({String? documentID, String? appId, String? name, BackgroundModel? backgroundOverride, String? headerText, String? secondHeaderText, double? headerHeight, RgbModel? popupMenuBackgroundColor, BackgroundModel? headerBackgroundOverride, MenuDefModel? menu, }) {
    return DrawerModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, backgroundOverride: backgroundOverride ?? this.backgroundOverride, headerText: headerText ?? this.headerText, secondHeaderText: secondHeaderText ?? this.secondHeaderText, headerHeight: headerHeight ?? this.headerHeight, popupMenuBackgroundColor: popupMenuBackgroundColor ?? this.popupMenuBackgroundColor, headerBackgroundOverride: headerBackgroundOverride ?? this.headerBackgroundOverride, menu: menu ?? this.menu, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ backgroundOverride.hashCode ^ headerText.hashCode ^ secondHeaderText.hashCode ^ headerHeight.hashCode ^ popupMenuBackgroundColor.hashCode ^ headerBackgroundOverride.hashCode ^ menu.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DrawerModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          backgroundOverride == other.backgroundOverride &&
          headerText == other.headerText &&
          secondHeaderText == other.secondHeaderText &&
          headerHeight == other.headerHeight &&
          popupMenuBackgroundColor == other.popupMenuBackgroundColor &&
          headerBackgroundOverride == other.headerBackgroundOverride &&
          menu == other.menu;

  @override
  String toString() {
    return 'DrawerModel{documentID: $documentID, appId: $appId, name: $name, backgroundOverride: $backgroundOverride, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverride: $headerBackgroundOverride, menu: $menu}';
  }

  DrawerEntity toEntity({String? appId}) {
    return DrawerEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          backgroundOverrideId: (backgroundOverride != null) ? backgroundOverride!.documentID : null, 
          headerText: (headerText != null) ? headerText : null, 
          secondHeaderText: (secondHeaderText != null) ? secondHeaderText : null, 
          headerHeight: (headerHeight != null) ? headerHeight : null, 
          popupMenuBackgroundColor: (popupMenuBackgroundColor != null) ? popupMenuBackgroundColor!.toEntity(appId: appId) : null, 
          headerBackgroundOverrideId: (headerBackgroundOverride != null) ? headerBackgroundOverride!.documentID : null, 
          menuId: (menu != null) ? menu!.documentID : null, 
    );
  }

  static DrawerModel? fromEntity(String documentID, DrawerEntity? entity) {
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

  static Future<DrawerModel?> fromEntityPlus(String documentID, DrawerEntity? entity, { String? appId}) async {
    if (entity == null) return null;

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

    BackgroundModel? headerBackgroundOverrideHolder;
    if (entity.headerBackgroundOverrideId != null) {
      var id = entity.headerBackgroundOverrideId;
      try {
        var repo = AbstractRepositorySingleton.singleton.backgroundRepository();
        if (repo != null) {
          headerBackgroundOverrideHolder = await repo.get(id);
        }
      } on Exception catch(e) {
        print('Error whilst trying to initialise headerBackgroundOverride');
        print('Error whilst retrieving background with id ${entity.headerBackgroundOverrideId}');
        print('Exception: $e');
      }
    }

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

    return DrawerModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          backgroundOverride: backgroundOverrideHolder, 
          headerText: entity.headerText, 
          secondHeaderText: entity.secondHeaderText, 
          headerHeight: entity.headerHeight, 
          popupMenuBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColor, appId: appId), 
          headerBackgroundOverride: headerBackgroundOverrideHolder, 
          menu: menuHolder, 
    );
  }

}

