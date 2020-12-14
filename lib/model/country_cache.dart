/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/country_model.dart';
import 'package:eliud_core/model/country_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class CountryCache implements CountryRepository {

  final CountryRepository reference;
  final Map<String, CountryModel> fullCache = Map();

  CountryCache(this.reference);

  Future<CountryModel> add(CountryModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(CountryModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<CountryModel> get(String id){
    CountryModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<CountryModel> update(CountryModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<CountryModel>> values({String orderBy, bool descending }) {
    return reference.values();
  }

  @override
  Stream<List<CountryModel>> valuesWithDetails({String orderBy, bool descending }) {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<CountryModel>> valuesList({String orderBy, bool descending }) async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<CountryModel>> valuesListWithDetails({String orderBy, bool descending }) async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<CountryModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<CountryModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
    return reference.listenWithDetails(trigger);
  }


  static Future<CountryModel> refreshRelations(CountryModel model) async {

    return model.copyWith(

    );
  }

}

