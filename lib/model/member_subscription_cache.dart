/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/member_subscription_model.dart';
import 'package:eliud_core/model/member_subscription_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

class MemberSubscriptionCache implements MemberSubscriptionRepository {

  final MemberSubscriptionRepository reference;
  final Map<String, MemberSubscriptionModel> fullCache = Map();

  MemberSubscriptionCache(this.reference);

  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MemberSubscriptionModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MemberSubscriptionModel> get(String id){
    MemberSubscriptionModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MemberSubscriptionModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<MemberSubscriptionModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<MemberSubscriptionModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<MemberSubscriptionModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberSubscriptionModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<MemberSubscriptionModel> refreshRelations(MemberSubscriptionModel model) async {

    AppModel appHolder;
    if (model.app != null) {
      try {
        await appRepository().get(model.app.documentID).then((val) {
          appHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        app: appHolder,


    );
  }

}

