/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/home_menu_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef HomeMenuModelTrigger(List<HomeMenuModel> list);

abstract class HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value);
  Future<void> delete(HomeMenuModel value);
  Future<HomeMenuModel> get(String id);
  Future<HomeMenuModel> update(HomeMenuModel value);

  Stream<List<HomeMenuModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Stream<List<HomeMenuModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<HomeMenuModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<HomeMenuModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});

  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  StreamSubscription<List<HomeMenuModel>> listenWithDetails(HomeMenuModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


