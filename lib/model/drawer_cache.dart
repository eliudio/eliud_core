/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/drawer_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class DrawerCache implements DrawerRepository {

  final DrawerRepository reference;
  final Map<String, DrawerModel> fullCache = Map();

  DrawerCache(this.reference);

  Future<DrawerModel> add(DrawerModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(DrawerModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<DrawerModel> get(String id){
    DrawerModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<DrawerModel> update(DrawerModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<DrawerModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<DrawerModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<DrawerModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<DrawerModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<DrawerModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<DrawerModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<DrawerModel> refreshRelations(DrawerModel model) async {

    BackgroundModel backgroundHolder;
    if (model.background != null) {
      try {
        await backgroundRepository().get(model.background.documentID).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    BackgroundModel headerBackgroundHolder;
    if (model.headerBackground != null) {
      try {
        await backgroundRepository().get(model.headerBackground.documentID).then((val) {
          headerBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MenuDefModel menuHolder;
    if (model.menu != null) {
      try {
        await menuDefRepository().get(model.menu.documentID).then((val) {
          menuHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        background: backgroundHolder,

        headerBackground: headerBackgroundHolder,

        menu: menuHolder,


    );
  }

}

