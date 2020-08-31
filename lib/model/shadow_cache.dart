/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'shadow_model.dart';
import 'shadow_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class ShadowCache implements ShadowRepository {

  final ShadowRepository reference;
  final Map<String, ShadowModel> fullCache = Map();

  ShadowCache(this.reference);

  Future<ShadowModel> add(ShadowModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ShadowModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ShadowModel> get(String id){
    ShadowModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ShadowModel> update(ShadowModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ShadowModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<ShadowModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<ShadowModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<ShadowModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ShadowModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<ShadowModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<ShadowModel> refreshRelations(ShadowModel model) async {

    return model.copyWith(

    );
  }

}

