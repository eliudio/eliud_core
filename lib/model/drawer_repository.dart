/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/drawer_model.dart';

typedef DrawerModelTrigger(List<DrawerModel> list);

abstract class DrawerRepository {
  Future<DrawerModel> add(DrawerModel value);
  Future<void> delete(DrawerModel value);
  Future<DrawerModel> get(String id);
  Future<DrawerModel> update(DrawerModel value);
  Stream<List<DrawerModel>> values({String orderBy, bool descending });
  Stream<List<DrawerModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<DrawerModel>> valuesList({String orderBy, bool descending });
  Future<List<DrawerModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<DrawerModel>> listen(DrawerModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<DrawerModel>> listenWithDetails(DrawerModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


