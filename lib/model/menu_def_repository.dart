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
  Stream<List<MenuDefModel>> values({String orderBy, bool descending });
  Stream<List<MenuDefModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<MenuDefModel>> valuesList({String orderBy, bool descending });
  Future<List<MenuDefModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<MenuDefModel>> listen(MenuDefModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<MenuDefModel>> listenWithDetails(MenuDefModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


