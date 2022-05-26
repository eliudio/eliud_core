/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_medium_repository.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

class MemberMediumCache implements MemberMediumRepository {

  final MemberMediumRepository reference;
  final Map<String?, MemberMediumModel?> fullCache = Map();

  MemberMediumCache(this.reference);

  Future<MemberMediumModel> add(MemberMediumModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(MemberMediumModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<MemberMediumModel?> get(String? id, {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  Future<MemberMediumModel> update(MemberMediumModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<MemberMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.values(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Stream<List<MemberMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    return reference.valuesWithDetails(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  Future<List<MemberMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    return await reference.valuesList(orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }
  
  @override
  Future<List<MemberMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
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

  Future<MemberMediumModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    return reference.changeValue(documentId, fieldName, changeByThisValue).then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<MemberMediumModel?>> listen(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<MemberMediumModel?>> listenWithDetails(trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<MemberMediumModel?> listenTo(String documentId, MemberMediumChanged changed) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }));
  }

  static Future<MemberMediumModel> refreshRelations(MemberMediumModel model) async {

    return model.copyWith(

    );
  }

}

