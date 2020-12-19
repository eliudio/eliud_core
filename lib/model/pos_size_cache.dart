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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

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
  Stream<List<PosSizeModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<PosSizeModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Future<List<PosSizeModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }
  
  @override
  Future<List<PosSizeModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PosSizeModel>> listen(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  StreamSubscription<List<PosSizeModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }


  static Future<PosSizeModel> refreshRelations(PosSizeModel model) async {

    return model.copyWith(

    );
  }

}

