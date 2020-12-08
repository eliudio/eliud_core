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

import 'dart:async';
import 'package:eliud_core/model/home_menu_model.dart';

typedef HomeMenuModelTrigger(List<HomeMenuModel> list);

abstract class HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value);
  Future<void> delete(HomeMenuModel value);
  Future<HomeMenuModel> get(String id);
  Future<HomeMenuModel> update(HomeMenuModel value);
  Stream<List<HomeMenuModel>> values();
  Stream<List<HomeMenuModel>> valuesWithDetails();
  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<HomeMenuModel>> listenWithDetails(HomeMenuModelTrigger trigger);
  void flush();
  Future<List<HomeMenuModel>> valuesList();
  Future<List<HomeMenuModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


