/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 access_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/access_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef AccessModelTrigger(List<AccessModel> list);

abstract class AccessRepository {
  Future<AccessModel> add(AccessModel value);
  Future<void> delete(AccessModel value);
  Future<AccessModel> get(String id);
  Future<AccessModel> update(AccessModel value);

  Stream<List<AccessModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Stream<List<AccessModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<AccessModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<AccessModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});

  StreamSubscription<List<AccessModel>> listen(AccessModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  StreamSubscription<List<AccessModel>> listenWithDetails(AccessModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


