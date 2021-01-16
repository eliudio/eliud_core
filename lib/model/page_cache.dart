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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
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

  Future<PageModel> get(String id, {Function(Exception) onError}) {
    PageModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id, onError: onError).then((value) {
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
  Stream<List<PageModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<PageModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<PageModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<PageModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await reference.valuesListWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }


  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PageModel>> listen(trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<PageModel>> listenWithDetails(trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<PageModel> listenTo(String documentId, changed) {
    reference.listenTo(documentId, changed);
  }

  static Future<PageModel> refreshRelations(PageModel model) async {

    AppBarModel appBarHolder;
    if (model.appBar != null) {
      try {
        await appBarRepository(appId: model.appBar.appId).get(model.appBar.documentID).then((val) {
          appBarHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel drawerHolder;
    if (model.drawer != null) {
      try {
        await drawerRepository(appId: model.drawer.appId).get(model.drawer.documentID).then((val) {
          drawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    DrawerModel endDrawerHolder;
    if (model.endDrawer != null) {
      try {
        await drawerRepository(appId: model.endDrawer.appId).get(model.endDrawer.documentID).then((val) {
          endDrawerHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    HomeMenuModel homeMenuHolder;
    if (model.homeMenu != null) {
      try {
        await homeMenuRepository(appId: model.homeMenu.appId).get(model.homeMenu.documentID).then((val) {
          homeMenuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel backgroundHolder;
    if (model.background != null) {
      try {
        await backgroundRepository(appId: model.background.appId).get(model.background.documentID).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    GridViewModel gridViewHolder;
    if (model.gridView != null) {
      try {
        await gridViewRepository(appId: model.gridView.appId).get(model.gridView.documentID).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel> bodyComponentsHolder;
    if (model.bodyComponents != null) {
      bodyComponentsHolder = List<BodyComponentModel>.from(await Future.wait(await model.bodyComponents.map((element) async {
        return await BodyComponentCache.refreshRelations(element);
      }))).toList();
    }

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

