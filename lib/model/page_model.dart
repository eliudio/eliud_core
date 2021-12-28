/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'package:eliud_core/model/page_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PageLayout {
  GridView, ListView, OnlyTheFirstComponent, Unknown
}


PageLayout toPageLayout(int? index) {
  switch (index) {
    case 0: return PageLayout.GridView;
    case 1: return PageLayout.ListView;
    case 2: return PageLayout.OnlyTheFirstComponent;
  }
  return PageLayout.Unknown;
}


class PageModel {
  String? documentID;
  String? appId;
  String? title;
  AppBarModel? appBar;
  DrawerModel? drawer;
  DrawerModel? endDrawer;
  HomeMenuModel? homeMenu;
  List<BodyComponentModel>? bodyComponents;

  // Override the style background
  BackgroundModel? backgroundOverride;
  PageLayout? layout;

  // Specific gridview
  GridViewModel? gridView;
  StorageConditionsModel? conditions;

  PageModel({this.documentID, this.appId, this.title, this.appBar, this.drawer, this.endDrawer, this.homeMenu, this.bodyComponents, this.backgroundOverride, this.layout, this.gridView, this.conditions, })  {
    assert(documentID != null);
  }

  PageModel copyWith({String? documentID, String? appId, String? title, AppBarModel? appBar, DrawerModel? drawer, DrawerModel? endDrawer, HomeMenuModel? homeMenu, List<BodyComponentModel>? bodyComponents, BackgroundModel? backgroundOverride, PageLayout? layout, GridViewModel? gridView, StorageConditionsModel? conditions, }) {
    return PageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, appBar: appBar ?? this.appBar, drawer: drawer ?? this.drawer, endDrawer: endDrawer ?? this.endDrawer, homeMenu: homeMenu ?? this.homeMenu, bodyComponents: bodyComponents ?? this.bodyComponents, backgroundOverride: backgroundOverride ?? this.backgroundOverride, layout: layout ?? this.layout, gridView: gridView ?? this.gridView, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ appBar.hashCode ^ drawer.hashCode ^ endDrawer.hashCode ^ homeMenu.hashCode ^ bodyComponents.hashCode ^ backgroundOverride.hashCode ^ layout.hashCode ^ gridView.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          appBar == other.appBar &&
          drawer == other.drawer &&
          endDrawer == other.endDrawer &&
          homeMenu == other.homeMenu &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          backgroundOverride == other.backgroundOverride &&
          layout == other.layout &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'PageModel{documentID: $documentID, appId: $appId, title: $title, appBar: $appBar, drawer: $drawer, endDrawer: $endDrawer, homeMenu: $homeMenu, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, backgroundOverride: $backgroundOverride, layout: $layout, gridView: $gridView, conditions: $conditions}';
  }

  PageEntity toEntity({String? appId}) {
    return PageEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          appBarId: (appBar != null) ? appBar!.documentID : null, 
          drawerId: (drawer != null) ? drawer!.documentID : null, 
          endDrawerId: (endDrawer != null) ? endDrawer!.documentID : null, 
          homeMenuId: (homeMenu != null) ? homeMenu!.documentID : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          backgroundOverrideId: (backgroundOverride != null) ? backgroundOverride!.documentID : null, 
          layout: (layout != null) ? layout!.index : null, 
          gridViewId: (gridView != null) ? gridView!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<PageModel?> fromEntity(String documentID, PageEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null : List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) {
            counter++;
              return BodyComponentModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          layout: toPageLayout(entity.layout), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PageModel?> fromEntityPlus(String documentID, PageEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    AppBarModel? appBarHolder;
    if (entity.appBarId != null) {
      try {
          appBarHolder = await appBarRepository(appId: appId)!.get(entity.appBarId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise appBar');
        print('Error whilst retrieving appBar with id ${entity.appBarId}');
        print('Exception: $e');
      }
    }

    DrawerModel? drawerHolder;
    if (entity.drawerId != null) {
      try {
          drawerHolder = await drawerRepository(appId: appId)!.get(entity.drawerId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise drawer');
        print('Error whilst retrieving drawer with id ${entity.drawerId}');
        print('Exception: $e');
      }
    }

    DrawerModel? endDrawerHolder;
    if (entity.endDrawerId != null) {
      try {
          endDrawerHolder = await drawerRepository(appId: appId)!.get(entity.endDrawerId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise endDrawer');
        print('Error whilst retrieving drawer with id ${entity.endDrawerId}');
        print('Exception: $e');
      }
    }

    HomeMenuModel? homeMenuHolder;
    if (entity.homeMenuId != null) {
      try {
          homeMenuHolder = await homeMenuRepository(appId: appId)!.get(entity.homeMenuId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise homeMenu');
        print('Error whilst retrieving homeMenu with id ${entity.homeMenuId}');
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

    GridViewModel? gridViewHolder;
    if (entity.gridViewId != null) {
      try {
          gridViewHolder = await gridViewRepository(appId: appId)!.get(entity.gridViewId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise gridView');
        print('Error whilst retrieving gridView with id ${entity.gridViewId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return PageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          appBar: appBarHolder, 
          drawer: drawerHolder, 
          endDrawer: endDrawerHolder, 
          homeMenu: homeMenuHolder, 
          bodyComponents: 
            entity. bodyComponents == null ? null : List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) {
            counter++;
            return BodyComponentModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          backgroundOverride: backgroundOverrideHolder, 
          layout: toPageLayout(entity.layout), 
          gridView: gridViewHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

