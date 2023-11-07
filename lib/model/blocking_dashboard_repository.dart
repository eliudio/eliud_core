/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef BlockingDashboardModelTrigger = Function(
    List<BlockingDashboardModel?> list);
typedef BlockingDashboardChanged = Function(BlockingDashboardModel? value);
typedef BlockingDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class BlockingDashboardRepository
    extends RepositoryBase<BlockingDashboardModel, BlockingDashboardEntity> {
  @override
  Future<BlockingDashboardEntity> addEntity(
      String documentID, BlockingDashboardEntity value);
  @override
  Future<BlockingDashboardEntity> updateEntity(
      String documentID, BlockingDashboardEntity value);
  @override
  Future<BlockingDashboardModel> add(BlockingDashboardModel value);
  @override
  Future<void> delete(BlockingDashboardModel value);
  @override
  Future<BlockingDashboardModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<BlockingDashboardModel> update(BlockingDashboardModel value);

  @override
  Stream<List<BlockingDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<BlockingDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BlockingDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BlockingDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<BlockingDashboardModel?>> listen(
      BlockingDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<BlockingDashboardModel?>> listenWithDetails(
      BlockingDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<BlockingDashboardModel?> listenTo(
      String documentId, BlockingDashboardChanged changed,
      {BlockingDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<BlockingDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
