/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core/model/pos_size_model.dart';

typedef PosSizeModelTrigger(List<PosSizeModel> list);

abstract class PosSizeRepository {
  Future<PosSizeModel> add(PosSizeModel value);
  Future<void> delete(PosSizeModel value);
  Future<PosSizeModel> get(String id);
  Future<PosSizeModel> update(PosSizeModel value);
  Stream<List<PosSizeModel>> values({String orderBy, bool descending });
  Stream<List<PosSizeModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<PosSizeModel>> valuesList({String orderBy, bool descending });
  Future<List<PosSizeModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<PosSizeModel>> listen(PosSizeModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PosSizeModel>> listenWithDetails(PosSizeModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


