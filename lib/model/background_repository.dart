/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'background_model.dart';

typedef BackgroundModelTrigger(List<BackgroundModel> list);

abstract class BackgroundRepository {
  Future<BackgroundModel> add(BackgroundModel value);
  Future<void> delete(BackgroundModel value);
  Future<BackgroundModel> get(String id);
  Future<BackgroundModel> update(BackgroundModel value);
  Stream<List<BackgroundModel>> values();
  Stream<List<BackgroundModel>> valuesWithDetails();
  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger);
StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger);
  void flush();
  Future<List<BackgroundModel>> valuesList();
  Future<List<BackgroundModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


