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
import 'package:eliud_core/model/shadow_model.dart';

typedef ShadowModelTrigger(List<ShadowModel> list);

abstract class ShadowRepository {
  Future<ShadowModel> add(ShadowModel value);
  Future<void> delete(ShadowModel value);
  Future<ShadowModel> get(String id);
  Future<ShadowModel> update(ShadowModel value);
  Stream<List<ShadowModel>> values({String orderBy, bool descending });
  Stream<List<ShadowModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ShadowModel>> valuesList({String orderBy, bool descending });
  Future<List<ShadowModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ShadowModel>> listen(ShadowModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ShadowModel>> listenWithDetails(ShadowModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


