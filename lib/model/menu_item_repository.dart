/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/menu_item_model.dart';

typedef MenuItemModelTrigger(List<MenuItemModel> list);

abstract class MenuItemRepository {
  Future<MenuItemModel> add(MenuItemModel value);
  Future<void> delete(MenuItemModel value);
  Future<MenuItemModel> get(String id);
  Future<MenuItemModel> update(MenuItemModel value);
  Stream<List<MenuItemModel>> values({String orderBy, bool descending });
  Stream<List<MenuItemModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<MenuItemModel>> valuesList({String orderBy, bool descending });
  Future<List<MenuItemModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<MenuItemModel>> listen(MenuItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<MenuItemModel>> listenWithDetails(MenuItemModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


