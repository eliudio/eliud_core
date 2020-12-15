/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/dialog_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef DialogModelTrigger(List<DialogModel> list);

abstract class DialogRepository {
  Future<DialogModel> add(DialogModel value);
  Future<void> delete(DialogModel value);
  Future<DialogModel> get(String id);
  Future<DialogModel> update(DialogModel value);

  Stream<List<DialogModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<DialogModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<DialogModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<DialogModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<DialogModel>> listen(DialogModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<DialogModel>> listenWithDetails(DialogModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


