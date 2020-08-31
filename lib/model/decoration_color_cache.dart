/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/decoration_color_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class DecorationColorCache implements DecorationColorRepository {

  final DecorationColorRepository reference;
  final Map<String, DecorationColorModel> fullCache = Map();

  DecorationColorCache(this.reference);

  Future<DecorationColorModel> add(DecorationColorModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(DecorationColorModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<DecorationColorModel> get(String id){
    DecorationColorModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<DecorationColorModel> update(DecorationColorModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<DecorationColorModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<DecorationColorModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<DecorationColorModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<DecorationColorModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<DecorationColorModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<DecorationColorModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<DecorationColorModel> refreshRelations(DecorationColorModel model) async {

    return model.copyWith(

    );
  }

}

