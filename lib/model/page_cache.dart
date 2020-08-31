/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class PageCache implements PageRepository {

  final PageRepository reference;
  final Map<String, PageModel> fullCache = Map();

  PageCache(this.reference);

  Future<PageModel> add(PageModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PageModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PageModel> get(String id){
    PageModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PageModel> update(PageModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PageModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<PageModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<PageModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<PageModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PageModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<PageModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<PageModel> refreshRelations(PageModel model) async {

    AppBarModel appBarHolder;
    if (model.appBar != null) {
      try {
        await appBarRepository().get(model.appBar.documentID).then((val) {
          appBarHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel drawerHolder;
    if (model.drawer != null) {
      try {
        await drawerRepository().get(model.drawer.documentID).then((val) {
          drawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel endDrawerHolder;
    if (model.endDrawer != null) {
      try {
        await drawerRepository().get(model.endDrawer.documentID).then((val) {
          endDrawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    HomeMenuModel homeMenuHolder;
    if (model.homeMenu != null) {
      try {
        await homeMenuRepository().get(model.homeMenu.documentID).then((val) {
          homeMenuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel backgroundHolder;
    if (model.background != null) {
      try {
        await backgroundRepository().get(model.background.documentID).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    GridViewModel gridViewHolder;
    if (model.gridView != null) {
      try {
        await gridViewRepository().get(model.gridView.documentID).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel> bodyComponentsHolder = List<BodyComponentModel>.from(await Future.wait(await model.bodyComponents.map((element) async {
      return await BodyComponentCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        appBar: appBarHolder,

        drawer: drawerHolder,

        endDrawer: endDrawerHolder,

        homeMenu: homeMenuHolder,

        background: backgroundHolder,

        gridView: gridViewHolder,

        bodyComponents: bodyComponentsHolder,


    );
  }

}

