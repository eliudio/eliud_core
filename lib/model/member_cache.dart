/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'member_model.dart';
import 'member_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class MemberCache implements MemberRepository {

  final MemberRepository reference;
  final Map<String, MemberModel> fullCache = Map();

  MemberCache(this.reference);

  Future<MemberModel> add(MemberModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MemberModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MemberModel> get(String id){
    MemberModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<MemberModel> update(MemberModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MemberModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<MemberModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<MemberModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<MemberModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<MemberModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<MemberModel> refreshRelations(MemberModel model) async {

    CountryModel countryHolder;
    if (model.country != null) {
      try {
        await countryRepository().get(model.country.documentID).then((val) {
          countryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    CountryModel invoiceCountryHolder;
    if (model.invoiceCountry != null) {
      try {
        await countryRepository().get(model.invoiceCountry.documentID).then((val) {
          invoiceCountryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<MemberSubscriptionModel> subscriptionsHolder = List<MemberSubscriptionModel>.from(await Future.wait(await model.subscriptions.map((element) async {
      return await MemberSubscriptionCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        country: countryHolder,

        invoiceCountry: invoiceCountryHolder,

        subscriptions: subscriptionsHolder,


    );
  }

}

