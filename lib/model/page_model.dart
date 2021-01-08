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
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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


PageLayout toPageLayout(int index) {
  switch (index) {
    case 0: return PageLayout.GridView;
    case 1: return PageLayout.ListView;
    case 2: return PageLayout.OnlyTheFirstComponent;
  }
  return PageLayout.Unknown;
}


class PageModel {
  String documentID;
  String appId;
  String title;
  AppBarModel appBar;
  DrawerModel drawer;
  DrawerModel endDrawer;
  HomeMenuModel homeMenu;
  List<BodyComponentModel> bodyComponents;
  BackgroundModel background;
  PageLayout layout;

  // Specific gridview
  GridViewModel gridView;
  ConditionsModel conditions;

  PageModel({this.documentID, this.appId, this.title, this.appBar, this.drawer, this.endDrawer, this.homeMenu, this.bodyComponents, this.background, this.layout, this.gridView, this.conditions, })  {
    assert(documentID != null);
  }

  PageModel copyWith({String documentID, String appId, String title, AppBarModel appBar, DrawerModel drawer, DrawerModel endDrawer, HomeMenuModel homeMenu, List<BodyComponentModel> bodyComponents, BackgroundModel background, PageLayout layout, GridViewModel gridView, ConditionsModel conditions, }) {
    return PageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, appBar: appBar ?? this.appBar, drawer: drawer ?? this.drawer, endDrawer: endDrawer ?? this.endDrawer, homeMenu: homeMenu ?? this.homeMenu, bodyComponents: bodyComponents ?? this.bodyComponents, background: background ?? this.background, layout: layout ?? this.layout, gridView: gridView ?? this.gridView, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ appBar.hashCode ^ drawer.hashCode ^ endDrawer.hashCode ^ homeMenu.hashCode ^ bodyComponents.hashCode ^ background.hashCode ^ layout.hashCode ^ gridView.hashCode ^ conditions.hashCode;

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
          background == other.background &&
          layout == other.layout &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'PageModel{documentID: $documentID, appId: $appId, title: $title, appBar: $appBar, drawer: $drawer, endDrawer: $endDrawer, homeMenu: $homeMenu, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, background: $background, layout: $layout, gridView: $gridView, conditions: $conditions}';
  }

  PageEntity toEntity({String appId}) {
    return PageEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          appBarId: (appBar != null) ? appBar.documentID : null, 
          drawerId: (drawer != null) ? drawer.documentID : null, 
          endDrawerId: (endDrawer != null) ? endDrawer.documentID : null, 
          homeMenuId: (homeMenu != null) ? homeMenu.documentID : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          backgroundId: (background != null) ? background.documentID : null, 
          layout: (layout != null) ? layout.index : null, 
          gridViewId: (gridView != null) ? gridView.documentID : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
    );
  }

  static PageModel fromEntity(String documentID, PageEntity entity) {
    if (entity == null) return null;
    return PageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null :
            entity.bodyComponents
            .map((item) => BodyComponentModel.fromEntity(newRandomKey(), item))
            .toList(), 
          layout: toPageLayout(entity.layout), 
          conditions: 
            ConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PageModel> fromEntityPlus(String documentID, PageEntity entity, { String appId}) async {
    if (entity == null) return null;

    AppBarModel appBarHolder;
    if (entity.appBarId != null) {
      try {
        await appBarRepository(appId: appId).get(entity.appBarId).then((val) {
          appBarHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel drawerHolder;
    if (entity.drawerId != null) {
      try {
        await drawerRepository(appId: appId).get(entity.drawerId).then((val) {
          drawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel endDrawerHolder;
    if (entity.endDrawerId != null) {
      try {
        await drawerRepository(appId: appId).get(entity.endDrawerId).then((val) {
          endDrawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    HomeMenuModel homeMenuHolder;
    if (entity.homeMenuId != null) {
      try {
        await homeMenuRepository(appId: appId).get(entity.homeMenuId).then((val) {
          homeMenuHolder = val;
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

    GridViewModel gridViewHolder;
    if (entity.gridViewId != null) {
      try {
        await gridViewRepository(appId: appId).get(entity.gridViewId).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          appBar: appBarHolder, 
          drawer: drawerHolder, 
          endDrawer: endDrawerHolder, 
          homeMenu: homeMenuHolder, 
          bodyComponents: 
            entity. bodyComponents == null ? null : new List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            .map((item) => BodyComponentModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          background: backgroundHolder, 
          layout: toPageLayout(entity.layout), 
          gridView: gridViewHolder, 
          conditions: 
            await ConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

