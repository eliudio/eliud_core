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

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/app_bar_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum HeaderSelection {
  Title, Image, Icon, None, Unknown
}


HeaderSelection toHeaderSelection(int index) {
  switch (index) {
    case 0: return HeaderSelection.Title;
    case 1: return HeaderSelection.Image;
    case 2: return HeaderSelection.Icon;
    case 3: return HeaderSelection.None;
  }
  return HeaderSelection.Unknown;
}


class AppBarModel {
  String documentID;
  String appId;
  String title;

  // Enum indicating which header to use, and hence which field to use: title, icon or image
  HeaderSelection header;
  IconModel icon;
  ImageModel image;
  MenuDefModel iconMenu;
  BackgroundModel background;
  RgbModel iconColor;
  RgbModel selectedIconColor;
  RgbModel menuBackgroundColor;

  AppBarModel({this.documentID, this.appId, this.title, this.header, this.icon, this.image, this.iconMenu, this.background, this.iconColor, this.selectedIconColor, this.menuBackgroundColor, })  {
    assert(documentID != null);
  }

  AppBarModel copyWith({String documentID, String appId, String title, HeaderSelection header, IconModel icon, ImageModel image, MenuDefModel iconMenu, BackgroundModel background, RgbModel iconColor, RgbModel selectedIconColor, RgbModel menuBackgroundColor, }) {
    return AppBarModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, header: header ?? this.header, icon: icon ?? this.icon, image: image ?? this.image, iconMenu: iconMenu ?? this.iconMenu, background: background ?? this.background, iconColor: iconColor ?? this.iconColor, selectedIconColor: selectedIconColor ?? this.selectedIconColor, menuBackgroundColor: menuBackgroundColor ?? this.menuBackgroundColor, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ header.hashCode ^ icon.hashCode ^ image.hashCode ^ iconMenu.hashCode ^ background.hashCode ^ iconColor.hashCode ^ selectedIconColor.hashCode ^ menuBackgroundColor.hashCode;

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
          background == other.background &&
          iconColor == other.iconColor &&
          selectedIconColor == other.selectedIconColor &&
          menuBackgroundColor == other.menuBackgroundColor;

  @override
  String toString() {
    return 'AppBarModel{documentID: $documentID, appId: $appId, title: $title, header: $header, icon: $icon, image: $image, iconMenu: $iconMenu, background: $background, iconColor: $iconColor, selectedIconColor: $selectedIconColor, menuBackgroundColor: $menuBackgroundColor}';
  }

  AppBarEntity toEntity({String appId}) {
    return AppBarEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          header: (header != null) ? header.index : null, 
          icon: (icon != null) ? icon.toEntity(appId: appId) : null, 
          imageId: (image != null) ? image.documentID : null, 
          iconMenuId: (iconMenu != null) ? iconMenu.documentID : null, 
          backgroundId: (background != null) ? background.documentID : null, 
          iconColor: (iconColor != null) ? iconColor.toEntity(appId: appId) : null, 
          selectedIconColor: (selectedIconColor != null) ? selectedIconColor.toEntity(appId: appId) : null, 
          menuBackgroundColor: (menuBackgroundColor != null) ? menuBackgroundColor.toEntity(appId: appId) : null, 
    );
  }

  static AppBarModel fromEntity(String documentID, AppBarEntity entity) {
    if (entity == null) return null;
    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            IconModel.fromEntity(entity.icon), 
          iconColor: 
            RgbModel.fromEntity(entity.iconColor), 
          selectedIconColor: 
            RgbModel.fromEntity(entity.selectedIconColor), 
          menuBackgroundColor: 
            RgbModel.fromEntity(entity.menuBackgroundColor), 
    );
  }

  static Future<AppBarModel> fromEntityPlus(String documentID, AppBarEntity entity, { String appId}) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository(appId: appId).get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MenuDefModel iconMenuHolder;
    if (entity.iconMenuId != null) {
      try {
        await menuDefRepository(appId: appId).get(entity.iconMenuId).then((val) {
          iconMenuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel backgroundHolder;
    if (entity.backgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.backgroundId).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return AppBarModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          header: toHeaderSelection(entity.header), 
          icon: 
            await IconModel.fromEntityPlus(entity.icon, appId: appId), 
          image: imageHolder, 
          iconMenu: iconMenuHolder, 
          background: backgroundHolder, 
          iconColor: 
            await RgbModel.fromEntityPlus(entity.iconColor, appId: appId), 
          selectedIconColor: 
            await RgbModel.fromEntityPlus(entity.selectedIconColor, appId: appId), 
          menuBackgroundColor: 
            await RgbModel.fromEntityPlus(entity.menuBackgroundColor, appId: appId), 
    );
  }

}

