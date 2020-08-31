/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_def_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class MenuDefCache implements MenuDefRepository {

  final MenuDefRepository reference;
  final Map<String, MenuDefModel> fullCache = Map();

  MenuDefCache(this.reference);

  Future<MenuDefModel> add(MenuDefModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MenuDefModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MenuDefModel> get(String id){
    MenuDefModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<MenuDefModel> update(MenuDefModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MenuDefModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<MenuDefModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<MenuDefModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<MenuDefModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MenuDefModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<MenuDefModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<MenuDefModel> refreshRelations(MenuDefModel model) async {

    List<MenuItemModel> menuItemsHolder = List<MenuItemModel>.from(await Future.wait(await model.menuItems.map((element) async {
      return await MenuItemCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        menuItems: menuItemsHolder,


    );
  }

}

