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


class AppBarModel {
  String? documentID;
  String? appId;
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

  AppBarModel({this.documentID, this.appId, this.title, this.header, this.icon, this.image, this.iconMenu, this.backgroundOverride, this.iconColorOverride, this.selectedIconColorOverride, this.menuBackgroundColorOverride, })  {
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

  AppBarEntity toEntity({String? appId}) {
    return AppBarEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          header: (header != null) ? header!.index : null, 
          icon: (icon != null) ? icon!.toEntity(appId: appId) : null, 
          imageId: (image != null) ? image!.documentID : null, 
          iconMenuId: (iconMenu != null) ? iconMenu!.documentID : null, 
          backgroundOverrideId: (backgroundOverride != null) ? backgroundOverride!.documentID : null, 
          iconColorOverride: (iconColorOverride != null) ? iconColorOverride!.toEntity(appId: appId) : null, 
          selectedIconColorOverride: (selectedIconColorOverride != null) ? selectedIconColorOverride!.toEntity(appId: appId) : null, 
          menuBackgroundColorOverride: (menuBackgroundColorOverride != null) ? menuBackgroundColorOverride!.toEntity(appId: appId) : null, 
    );
  }

  static AppBarModel? fromEntity(String documentID, AppBarEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            IconModel.fromEntity(entity.icon), 
          iconColorOverride: 
            RgbModel.fromEntity(entity.iconColorOverride), 
          selectedIconColorOverride: 
            RgbModel.fromEntity(entity.selectedIconColorOverride), 
          menuBackgroundColorOverride: 
            RgbModel.fromEntity(entity.menuBackgroundColorOverride), 
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
    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            await IconModel.fromEntityPlus(entity.icon, appId: appId), 
          image: imageHolder, 
          iconMenu: iconMenuHolder, 
          backgroundOverride: backgroundOverrideHolder, 
          iconColorOverride: 
            await RgbModel.fromEntityPlus(entity.iconColorOverride, appId: appId), 
          selectedIconColorOverride: 
            await RgbModel.fromEntityPlus(entity.selectedIconColorOverride, appId: appId), 
          menuBackgroundColorOverride: 
            await RgbModel.fromEntityPlus(entity.menuBackgroundColorOverride, appId: appId), 
    );
  }

}

