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



import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef DialogModelTrigger(List<DialogModel?> list);
typedef DialogChanged(DialogModel? value);
typedef DialogErrorHandler(o, e);

abstract class DialogRepository extends RepositoryBase<DialogModel, DialogEntity> {
  Future<DialogEntity> addEntity(String documentID, DialogEntity value);
  Future<DialogEntity> updateEntity(String documentID, DialogEntity value);
  Future<DialogModel> add(DialogModel value);
  Future<void> delete(DialogModel value);
  Future<DialogModel?> get(String? id, { Function(Exception)? onError });
  Future<DialogModel> update(DialogModel value);

  Stream<List<DialogModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<DialogModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DialogModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DialogModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<DialogModel?>> listen(DialogModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<DialogModel?>> listenWithDetails(DialogModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<DialogModel?> listenTo(String documentId, DialogChanged changed, {DialogErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<DialogModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


