/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/menu_def_model.dart';

typedef MenuDefModelTrigger(List<MenuDefModel> list);

abstract class MenuDefRepository {
  Future<MenuDefModel> add(MenuDefModel value);
  Future<void> delete(MenuDefModel value);
  Future<MenuDefModel> get(String id);
  Future<MenuDefModel> update(MenuDefModel value);
  Stream<List<MenuDefModel>> values();
  Stream<List<MenuDefModel>> valuesWithDetails();
  StreamSubscription<List<MenuDefModel>> listen(MenuDefModelTrigger trigger);
StreamSubscription<List<MenuDefModel>> listenWithDetails(MenuDefModelTrigger trigger);
  void flush();
  Future<List<MenuDefModel>> valuesList();
  Future<List<MenuDefModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


