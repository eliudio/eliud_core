/*
Bespoke MemberCache
*/

import 'dart:async';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_repository_bespoke.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

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
  Stream<List<MemberModel>> values(String currentMember) {
    return reference.values(currentMember);
  }

  @override
  Stream<List<MemberModel>> valuesWithDetails(String currentMember) {
    return reference.valuesWithDetails(currentMember);
  }

  @override
  Future<List<MemberModel>> valuesList(String currentMember) async {
    return await reference.valuesList(currentMember);
  }
  
  @override
  Future<List<MemberModel>> valuesListWithDetails(String currentMember) async {
    return await reference.valuesListWithDetails(currentMember);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberModel>> listen(String currentMember, trigger) {
    return reference.listen(currentMember, trigger);
  }

  @override
  StreamSubscription<List<MemberModel>> listenWithDetails(String currentMember, trigger) {
    return reference.listenWithDetails(currentMember, trigger);
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

