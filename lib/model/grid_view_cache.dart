/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'grid_view_model.dart';
import 'grid_view_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class GridViewCache implements GridViewRepository {

  final GridViewRepository reference;
  final Map<String, GridViewModel> fullCache = Map();

  GridViewCache(this.reference);

  Future<GridViewModel> add(GridViewModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(GridViewModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<GridViewModel> get(String id){
    GridViewModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<GridViewModel> update(GridViewModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<GridViewModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<GridViewModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<GridViewModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<GridViewModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<GridViewModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<GridViewModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<GridViewModel> refreshRelations(GridViewModel model) async {

    return model.copyWith(

    );
  }

}

