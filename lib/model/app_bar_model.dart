/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_model.dart
                       
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


import 'package:eliud_core/model/app_bar_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum HeaderSelection {
  Title, Image, Icon, None, Unknown
}


HeaderSelection toHeaderSelection(int? index) {
  switch (index) {
    case 0: return HeaderSelection.Title;
    case 1: return HeaderSelection.Image;
    case 2: return HeaderSelection.Icon;
    case 3: return HeaderSelection.None;
  }
  return HeaderSelection.Unknown;
}


class AppBarModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_core';
  static const String id = 'appBars';

  String documentID;
  String appId;
  String? title;

  // Enum indicating which header to use, and hence which field to use: title, icon or image
  HeaderSelection? header;
  IconModel? icon;
  MemberMediumModel? image;
  MenuDefModel? iconMenu;
  BackgroundModel? backgroundOverride;
  RgbModel? iconColorOverride;
  RgbModel? selectedIconColorOverride;
  RgbModel? menuBackgroundColorOverride;

  AppBarModel({required this.documentID, required this.appId, this.title, this.header, this.icon, this.image, this.iconMenu, this.backgroundOverride, this.iconColorOverride, this.selectedIconColorOverride, this.menuBackgroundColorOverride, })  {
    assert(documentID != null);
  }

  AppBarModel copyWith({String? documentID, String? appId, String? title, HeaderSelection? header, IconModel? icon, MemberMediumModel? image, MenuDefModel? iconMenu, BackgroundModel? backgroundOverride, RgbModel? iconColorOverride, RgbModel? selectedIconColorOverride, RgbModel? menuBackgroundColorOverride, }) {
    return AppBarModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, header: header ?? this.header, icon: icon ?? this.icon, image: image ?? this.image, iconMenu: iconMenu ?? this.iconMenu, backgroundOverride: backgroundOverride ?? this.backgroundOverride, iconColorOverride: iconColorOverride ?? this.iconColorOverride, selectedIconColorOverride: selectedIconColorOverride ?? this.selectedIconColorOverride, menuBackgroundColorOverride: menuBackgroundColorOverride ?? this.menuBackgroundColorOverride, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ header.hashCode ^ icon.hashCode ^ image.hashCode ^ iconMenu.hashCode ^ backgroundOverride.hashCode ^ iconColorOverride.hashCode ^ selectedIconColorOverride.hashCode ^ menuBackgroundColorOverride.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is AppBarModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          header == other.header &&
          icon == other.icon &&
          image == other.image &&
          iconMenu == other.iconMenu &&
          backgroundOverride == other.backgroundOverride &&
          iconColorOverride == other.iconColorOverride &&
          selectedIconColorOverride == other.selectedIconColorOverride &&
          menuBackgroundColorOverride == other.menuBackgroundColorOverride;

  @override
  String toString() {
    return 'AppBarModel{documentID: $documentID, appId: $appId, title: $title, header: $header, icon: $icon, image: $image, iconMenu: $iconMenu, backgroundOverride: $backgroundOverride, iconColorOverride: $iconColorOverride, selectedIconColorOverride: $selectedIconColorOverride, menuBackgroundColorOverride: $menuBackgroundColorOverride}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(MemberMediumModel.packageName, MemberMediumModel.id, image!));
    }
    if (iconMenu != null) {
      referencesCollector.add(ModelReference(MenuDefModel.packageName, MenuDefModel.id, iconMenu!));
    }
    if (icon != null) referencesCollector.addAll(await icon!.collectReferences(appId: appId));
    if (image != null) referencesCollector.addAll(await image!.collectReferences(appId: appId));
    if (iconMenu != null) referencesCollector.addAll(await iconMenu!.collectReferences(appId: appId));
    if (backgroundOverride != null) referencesCollector.addAll(await backgroundOverride!.collectReferences(appId: appId));
    if (iconColorOverride != null) referencesCollector.addAll(await iconColorOverride!.collectReferences(appId: appId));
    if (selectedIconColorOverride != null) referencesCollector.addAll(await selectedIconColorOverride!.collectReferences(appId: appId));
    if (menuBackgroundColorOverride != null) referencesCollector.addAll(await menuBackgroundColorOverride!.collectReferences(appId: appId));
    return referencesCollector;
  }

  AppBarEntity toEntity({String? appId}) {
    return AppBarEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          header: (header != null) ? header!.index : null, 
          icon: (icon != null) ? icon!.toEntity(appId: appId) : null, 
          imageId: (image != null) ? image!.documentID : null, 
          iconMenuId: (iconMenu != null) ? iconMenu!.documentID : null, 
          backgroundOverride: (backgroundOverride != null) ? backgroundOverride!.toEntity(appId: appId) : null, 
          iconColorOverride: (iconColorOverride != null) ? iconColorOverride!.toEntity(appId: appId) : null, 
          selectedIconColorOverride: (selectedIconColorOverride != null) ? selectedIconColorOverride!.toEntity(appId: appId) : null, 
          menuBackgroundColorOverride: (menuBackgroundColorOverride != null) ? menuBackgroundColorOverride!.toEntity(appId: appId) : null, 
    );
  }

  static Future<AppBarModel?> fromEntity(String documentID, AppBarEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            await IconModel.fromEntity(entity.icon), 
          backgroundOverride: 
            await BackgroundModel.fromEntity(entity.backgroundOverride), 
          iconColorOverride: 
            await RgbModel.fromEntity(entity.iconColorOverride), 
          selectedIconColorOverride: 
            await RgbModel.fromEntity(entity.selectedIconColorOverride), 
          menuBackgroundColorOverride: 
            await RgbModel.fromEntity(entity.menuBackgroundColorOverride), 
    );
  }

  static Future<AppBarModel?> fromEntityPlus(String documentID, AppBarEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await memberMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving memberMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    MenuDefModel? iconMenuHolder;
    if (entity.iconMenuId != null) {
      try {
          iconMenuHolder = await menuDefRepository(appId: appId)!.get(entity.iconMenuId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise iconMenu');
        print('Error whilst retrieving menuDef with id ${entity.iconMenuId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            await IconModel.fromEntityPlus(entity.icon, appId: appId), 
          image: imageHolder, 
          iconMenu: iconMenuHolder, 
          backgroundOverride: 
            await BackgroundModel.fromEntityPlus(entity.backgroundOverride, appId: appId), 
          iconColorOverride: 
            await RgbModel.fromEntityPlus(entity.iconColorOverride, appId: appId), 
          selectedIconColorOverride: 
            await RgbModel.fromEntityPlus(entity.selectedIconColorOverride, appId: appId), 
          menuBackgroundColorOverride: 
            await RgbModel.fromEntityPlus(entity.menuBackgroundColorOverride, appId: appId), 
    );
  }

}

