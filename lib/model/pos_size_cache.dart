/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'pos_size_model.dart';
import 'pos_size_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class PosSizeCache implements PosSizeRepository {

  final PosSizeRepository reference;
  final Map<String, PosSizeModel> fullCache = Map();

  PosSizeCache(this.reference);

  Future<PosSizeModel> add(PosSizeModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PosSizeModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PosSizeModel> get(String id){
    PosSizeModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PosSizeModel> update(PosSizeModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PosSizeModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<PosSizeModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<PosSizeModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<PosSizeModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PosSizeModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<PosSizeModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<PosSizeModel> refreshRelations(PosSizeModel model) async {

    return model.copyWith(

    );
  }

}

