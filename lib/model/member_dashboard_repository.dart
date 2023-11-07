/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberDashboardModelTrigger = Function(
    List<MemberDashboardModel?> list);
typedef MemberDashboardChanged = Function(MemberDashboardModel? value);
typedef MemberDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberDashboardRepository
    extends RepositoryBase<MemberDashboardModel, MemberDashboardEntity> {
  @override
  Future<MemberDashboardEntity> addEntity(
      String documentID, MemberDashboardEntity value);
  @override
  Future<MemberDashboardEntity> updateEntity(
      String documentID, MemberDashboardEntity value);
  @override
  Future<MemberDashboardModel> add(MemberDashboardModel value);
  @override
  Future<void> delete(MemberDashboardModel value);
  @override
  Future<MemberDashboardModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<MemberDashboardModel> update(MemberDashboardModel value);

  @override
  Stream<List<MemberDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberDashboardModel?>> listen(
      MemberDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberDashboardModel?>> listenWithDetails(
      MemberDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberDashboardModel?> listenTo(
      String documentId, MemberDashboardChanged changed,
      {MemberDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
