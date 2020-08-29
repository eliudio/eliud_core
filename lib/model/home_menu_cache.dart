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
import 'home_menu_model.dart';
import 'home_menu_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
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
  Stream<List<HomeMenuModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<HomeMenuModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<HomeMenuModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<HomeMenuModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<HomeMenuModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<HomeMenuModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<HomeMenuModel> refreshRelations(HomeMenuModel model) async {

    MenuDefModel menuHolder;
    if (model.menu != null) {
      try {
        await menuDefRepository().get(model.menu.documentID).then((val) {
          menuHolder = val;
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

    return model.copyWith(
        menu: menuHolder,

        background: backgroundHolder,


    );
  }

}

