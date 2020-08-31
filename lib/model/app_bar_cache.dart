/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_bar_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class AppBarCache implements AppBarRepository {

  final AppBarRepository reference;
  final Map<String, AppBarModel> fullCache = Map();

  AppBarCache(this.reference);

  Future<AppBarModel> add(AppBarModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(AppBarModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<AppBarModel> get(String id){
    AppBarModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<AppBarModel> update(AppBarModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<AppBarModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<AppBarModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<AppBarModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<AppBarModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<AppBarModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<AppBarModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<AppBarModel> refreshRelations(AppBarModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    MenuDefModel iconMenuHolder;
    if (model.iconMenu != null) {
      try {
        await menuDefRepository().get(model.iconMenu.documentID).then((val) {
          iconMenuHolder = val;
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
        image: imageHolder,

        iconMenu: iconMenuHolder,

        background: backgroundHolder,


    );
  }

}

