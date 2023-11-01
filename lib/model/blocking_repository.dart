/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef BlockingModelTrigger(List<BlockingModel?> list);
typedef BlockingChanged(BlockingModel? value);
typedef BlockingErrorHandler(o, e);

abstract class BlockingRepository extends RepositoryBase<BlockingModel, BlockingEntity> {
  Future<BlockingEntity> addEntity(String documentID, BlockingEntity value);
  Future<BlockingEntity> updateEntity(String documentID, BlockingEntity value);
  Future<BlockingModel> add(BlockingModel value);
  Future<void> delete(BlockingModel value);
  Future<BlockingModel?> get(String? id, { Function(Exception)? onError });
  Future<BlockingModel> update(BlockingModel value);

  Stream<List<BlockingModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<BlockingModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<BlockingModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<BlockingModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<BlockingModel?>> listen(BlockingModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<BlockingModel?>> listenWithDetails(BlockingModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<BlockingModel?> listenTo(String documentId, BlockingChanged changed, {BlockingErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<BlockingModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


