/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef BackendRequestModelTrigger = Function(List<BackendRequestModel?> list);
typedef BackendRequestChanged = Function(BackendRequestModel? value);
typedef BackendRequestErrorHandler = Function(dynamic o, dynamic e);

abstract class BackendRequestRepository
    extends RepositoryBase<BackendRequestModel, BackendRequestEntity> {
  @override
  Future<BackendRequestEntity> addEntity(
      String documentID, BackendRequestEntity value);
  @override
  Future<BackendRequestEntity> updateEntity(
      String documentID, BackendRequestEntity value);
  @override
  Future<BackendRequestModel> add(BackendRequestModel value);
  @override
  Future<void> delete(BackendRequestModel value);
  @override
  Future<BackendRequestModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<BackendRequestModel> update(BackendRequestModel value);

  @override
  Stream<List<BackendRequestModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<BackendRequestModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BackendRequestModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BackendRequestModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<BackendRequestModel?>> listen(
      BackendRequestModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<BackendRequestModel?>> listenWithDetails(
      BackendRequestModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<BackendRequestModel?> listenTo(
      String documentId, BackendRequestChanged changed,
      {BackendRequestErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<BackendRequestModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
