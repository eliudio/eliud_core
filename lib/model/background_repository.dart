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
import 'package:eliud_core/model/background_model.dart';

typedef BackgroundModelTrigger(List<BackgroundModel> list);

abstract class BackgroundRepository {
  Future<BackgroundModel> add(BackgroundModel value);
  Future<void> delete(BackgroundModel value);
  Future<BackgroundModel> get(String id);
  Future<BackgroundModel> update(BackgroundModel value);
  Stream<List<BackgroundModel>> values();
  Stream<List<BackgroundModel>> valuesWithDetails();  Future<List<BackgroundModel>> valuesList();
  Future<List<BackgroundModel>> valuesListWithDetails();
  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


