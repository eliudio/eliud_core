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

import 'package:eliud_core/model/pos_size_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PosSizeModelTrigger(List<PosSizeModel> list);

abstract class PosSizeRepository {
  Future<PosSizeModel> add(PosSizeModel value);
  Future<void> delete(PosSizeModel value);
  Future<PosSizeModel> get(String id);
  Future<PosSizeModel> update(PosSizeModel value);

  Stream<List<PosSizeModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<PosSizeModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<PosSizeModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<PosSizeModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<PosSizeModel>> listen(PosSizeModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<PosSizeModel>> listenWithDetails(PosSizeModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


