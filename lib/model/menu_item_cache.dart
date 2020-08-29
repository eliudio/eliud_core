/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'menu_item_model.dart';
import 'menu_item_repository.dart';
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

class MenuItemCache implements MenuItemRepository {

  final MenuItemRepository reference;
  final Map<String, MenuItemModel> fullCache = Map();

  MenuItemCache(this.reference);

  Future<MenuItemModel> add(MenuItemModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MenuItemModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MenuItemModel> get(String id){
    MenuItemModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<MenuItemModel> update(MenuItemModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MenuItemModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<MenuItemModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<MenuItemModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<MenuItemModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MenuItemModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<MenuItemModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<MenuItemModel> refreshRelations(MenuItemModel model) async {

    return model.copyWith(

    );
  }

}

