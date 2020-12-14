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
  Stream<List<BackgroundModel>> values({String orderBy, bool descending });
  Stream<List<BackgroundModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<BackgroundModel>> valuesList({String orderBy, bool descending });
  Future<List<BackgroundModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


