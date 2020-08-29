/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'shadow_model.dart';

typedef ShadowModelTrigger(List<ShadowModel> list);

abstract class ShadowRepository {
  Future<ShadowModel> add(ShadowModel value);
  Future<void> delete(ShadowModel value);
  Future<ShadowModel> get(String id);
  Future<ShadowModel> update(ShadowModel value);
  Stream<List<ShadowModel>> values();
  Stream<List<ShadowModel>> valuesWithDetails();
  StreamSubscription<List<ShadowModel>> listen(ShadowModelTrigger trigger);
StreamSubscription<List<ShadowModel>> listenWithDetails(ShadowModelTrigger trigger);
  void flush();
  Future<List<ShadowModel>> valuesList();
  Future<List<ShadowModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


