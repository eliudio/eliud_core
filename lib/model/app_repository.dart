/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/app_model.dart';

typedef AppModelTrigger(List<AppModel> list);

abstract class AppRepository {
  Future<AppModel> add(AppModel value);
  Future<void> delete(AppModel value);
  Future<AppModel> get(String id);
  Future<AppModel> update(AppModel value);
  Stream<List<AppModel>> values();
  Stream<List<AppModel>> valuesWithDetails();  Future<List<AppModel>> valuesList();
  Future<List<AppModel>> valuesListWithDetails();
  StreamSubscription<List<AppModel>> listen(AppModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<AppModel>> listenWithDetails(AppModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


