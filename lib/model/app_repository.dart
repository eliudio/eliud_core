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
  Stream<List<AppModel>> values({String orderBy, bool descending });
  Stream<List<AppModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<AppModel>> valuesList({String orderBy, bool descending });
  Future<List<AppModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<AppModel>> listen(AppModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<AppModel>> listenWithDetails(AppModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


