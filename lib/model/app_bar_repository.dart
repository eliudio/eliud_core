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
import 'app_bar_model.dart';

typedef AppBarModelTrigger(List<AppBarModel> list);

abstract class AppBarRepository {
  Future<AppBarModel> add(AppBarModel value);
  Future<void> delete(AppBarModel value);
  Future<AppBarModel> get(String id);
  Future<AppBarModel> update(AppBarModel value);
  Stream<List<AppBarModel>> values();
  Stream<List<AppBarModel>> valuesWithDetails();
  StreamSubscription<List<AppBarModel>> listen(AppBarModelTrigger trigger);
StreamSubscription<List<AppBarModel>> listenWithDetails(AppBarModelTrigger trigger);
  void flush();
  Future<List<AppBarModel>> valuesList();
  Future<List<AppBarModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


