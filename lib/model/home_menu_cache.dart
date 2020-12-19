/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/model/home_menu_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class HomeMenuCache implements HomeMenuRepository {

  final HomeMenuRepository reference;
  final Map<String, HomeMenuModel> fullCache = Map();

  HomeMenuCache(this.reference);

  Future<HomeMenuModel> add(HomeMenuModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(HomeMenuModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<HomeMenuModel> get(String id){
    HomeMenuModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<HomeMenuModel> update(HomeMenuModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<HomeMenuModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<HomeMenuModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Future<List<HomeMenuModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }
  
  @override
  Future<List<HomeMenuModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<HomeMenuModel>> listen(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  StreamSubscription<List<HomeMenuModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }


  static Future<HomeMenuModel> refreshRelations(HomeMenuModel model) async {

    MenuDefModel menuHolder;
    if (model.menu != null) {
      try {
        await menuDefRepository(appId: model.menu.appId).get(model.menu.documentID).then((val) {
          menuHolder = val;
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

    return model.copyWith(
        menu: menuHolder,

        background: backgroundHolder,


    );
  }

}

