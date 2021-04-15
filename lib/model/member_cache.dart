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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

class MemberCache implements MemberRepository {

  final MemberRepository reference;
  final Map<String?, MemberModel?> fullCache = Map();

  MemberCache(this.reference);

  Future<MemberModel> add(MemberModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value!.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MemberModel value){
    fullCache.remove(value!.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MemberModel> get(String? id, {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return Future.value(value);
  }

  Future<MemberModel> update(MemberModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value!.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MemberModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<MemberModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<MemberModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<MemberModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesListWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  void flush() {
    fullCache.clear();
  }
  
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  } 

  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  Future<MemberModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    return reference.changeValue(documentId, fieldName, changeByThisValue).then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberModel?>> listen(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<MemberModel?>> listenWithDetails(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<MemberModel?> listenTo(String documentId, MemberChanged changed) {
    return reference.listenTo(documentId, changed);
  }

  static Future<MemberModel> refreshRelations(MemberModel model) async {

    CountryModel? countryHolder;
    if (model.country != null) {
      try {
        await countryRepository()!.get(model.country!.documentID).then((val) {
          countryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    CountryModel? invoiceCountryHolder;
    if (model.invoiceCountry != null) {
      try {
        await countryRepository()!.get(model.invoiceCountry!.documentID).then((val) {
          invoiceCountryHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<MemberSubscriptionModel>? subscriptionsHolder;
    if (model.subscriptions != null) {
      subscriptionsHolder = List<MemberSubscriptionModel>.from(await Future.wait(await model.subscriptions!.map((element) async {
        return await MemberSubscriptionCache.refreshRelations(element);
      }))).toList();
    }

    return model.copyWith(
        country: countryHolder,

        invoiceCountry: invoiceCountryHolder,

        subscriptions: subscriptionsHolder,


    );
  }

}

