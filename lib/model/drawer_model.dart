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


import 'package:eliud_core/model/drawer_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DrawerModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'drawers';

  String documentID;
  String appId;
  String? name;
  BackgroundModel? backgroundOverride;
  String? headerText;
  String? secondHeaderText;

  // Header height, 0 for default
  double? headerHeight;
  RgbModel? popupMenuBackgroundColor;
  BackgroundModel? headerBackgroundOverride;
  RgbModel? popupMenuBackgroundColorOverride;
  MenuDefModel? menu;

  DrawerModel({required this.documentID, required this.appId, this.name, this.backgroundOverride, this.headerText, this.secondHeaderText, this.headerHeight, this.popupMenuBackgroundColor, this.headerBackgroundOverride, this.popupMenuBackgroundColorOverride, this.menu, })  {
    assert(documentID != null);
  }

  DrawerModel copyWith({String? documentID, String? appId, String? name, BackgroundModel? backgroundOverride, String? headerText, String? secondHeaderText, double? headerHeight, RgbModel? popupMenuBackgroundColor, BackgroundModel? headerBackgroundOverride, RgbModel? popupMenuBackgroundColorOverride, MenuDefModel? menu, }) {
    return DrawerModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, backgroundOverride: backgroundOverride ?? this.backgroundOverride, headerText: headerText ?? this.headerText, secondHeaderText: secondHeaderText ?? this.secondHeaderText, headerHeight: headerHeight ?? this.headerHeight, popupMenuBackgroundColor: popupMenuBackgroundColor ?? this.popupMenuBackgroundColor, headerBackgroundOverride: headerBackgroundOverride ?? this.headerBackgroundOverride, popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride ?? this.popupMenuBackgroundColorOverride, menu: menu ?? this.menu, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ backgroundOverride.hashCode ^ headerText.hashCode ^ secondHeaderText.hashCode ^ headerHeight.hashCode ^ popupMenuBackgroundColor.hashCode ^ headerBackgroundOverride.hashCode ^ popupMenuBackgroundColorOverride.hashCode ^ menu.hashCode;

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
          popupMenuBackgroundColorOverride == other.popupMenuBackgroundColorOverride &&
          menu == other.menu;

  @override
  String toString() {
    return 'DrawerModel{documentID: $documentID, appId: $appId, name: $name, backgroundOverride: $backgroundOverride, headerText: $headerText, secondHeaderText: $secondHeaderText, headerHeight: $headerHeight, popupMenuBackgroundColor: $popupMenuBackgroundColor, headerBackgroundOverride: $headerBackgroundOverride, popupMenuBackgroundColorOverride: $popupMenuBackgroundColorOverride, menu: $menu}';
  }

  DrawerEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (menu != null) referencesCollector.add(ModelReference(MenuDefModel.packageName, MenuDefModel.id, menu!));
    }
    return DrawerEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          backgroundOverride: (backgroundOverride != null) ? backgroundOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          headerText: (headerText != null) ? headerText : null, 
          secondHeaderText: (secondHeaderText != null) ? secondHeaderText : null, 
          headerHeight: (headerHeight != null) ? headerHeight : null, 
          popupMenuBackgroundColor: (popupMenuBackgroundColor != null) ? popupMenuBackgroundColor!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          headerBackgroundOverride: (headerBackgroundOverride != null) ? headerBackgroundOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          popupMenuBackgroundColorOverride: (popupMenuBackgroundColorOverride != null) ? popupMenuBackgroundColorOverride!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
          menuId: (menu != null) ? menu!.documentID : null, 
    );
  }

  static Future<DrawerModel?> fromEntity(String documentID, DrawerEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DrawerModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          backgroundOverride: 
            await BackgroundModel.fromEntity(entity.backgroundOverride), 
          headerText: entity.headerText, 
          secondHeaderText: entity.secondHeaderText, 
          headerHeight: entity.headerHeight, 
          popupMenuBackgroundColor: 
            await RgbModel.fromEntity(entity.popupMenuBackgroundColor), 
          headerBackgroundOverride: 
            await BackgroundModel.fromEntity(entity.headerBackgroundOverride), 
          popupMenuBackgroundColorOverride: 
            await RgbModel.fromEntity(entity.popupMenuBackgroundColorOverride), 
    );
  }

  static Future<DrawerModel?> fromEntityPlus(String documentID, DrawerEntity? entity, { String? appId}) async {
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
    return DrawerModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          backgroundOverride: 
            await BackgroundModel.fromEntityPlus(entity.backgroundOverride, appId: appId), 
          headerText: entity.headerText, 
          secondHeaderText: entity.secondHeaderText, 
          headerHeight: entity.headerHeight, 
          popupMenuBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColor, appId: appId), 
          headerBackgroundOverride: 
            await BackgroundModel.fromEntityPlus(entity.headerBackgroundOverride, appId: appId), 
          popupMenuBackgroundColorOverride: 
            await RgbModel.fromEntityPlus(entity.popupMenuBackgroundColorOverride, appId: appId), 
          menu: menuHolder, 
    );
  }

}

