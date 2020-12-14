/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/app_bar_model.dart';

typedef AppBarModelTrigger(List<AppBarModel> list);

abstract class AppBarRepository {
  Future<AppBarModel> add(AppBarModel value);
  Future<void> delete(AppBarModel value);
  Future<AppBarModel> get(String id);
  Future<AppBarModel> update(AppBarModel value);
  Stream<List<AppBarModel>> values({String orderBy, bool descending });
  Stream<List<AppBarModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<AppBarModel>> valuesList({String orderBy, bool descending });
  Future<List<AppBarModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<AppBarModel>> listen(AppBarModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<AppBarModel>> listenWithDetails(AppBarModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


