/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef AppPolicyModelTrigger = Function(List<AppPolicyModel?> list);
typedef AppPolicyChanged = Function(AppPolicyModel? value);
typedef AppPolicyErrorHandler = Function(dynamic o, dynamic e);

abstract class AppPolicyRepository
    extends RepositoryBase<AppPolicyModel, AppPolicyEntity> {
  @override
  Future<AppPolicyEntity> addEntity(String documentID, AppPolicyEntity value);
  @override
  Future<AppPolicyEntity> updateEntity(
      String documentID, AppPolicyEntity value);
  @override
  Future<AppPolicyModel> add(AppPolicyModel value);
  @override
  Future<void> delete(AppPolicyModel value);
  @override
  Future<AppPolicyModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<AppPolicyModel> update(AppPolicyModel value);

  @override
  Stream<List<AppPolicyModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<AppPolicyModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AppPolicyModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AppPolicyModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<AppPolicyModel?>> listen(
      AppPolicyModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<AppPolicyModel?>> listenWithDetails(
      AppPolicyModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<AppPolicyModel?> listenTo(
      String documentId, AppPolicyChanged changed,
      {AppPolicyErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<AppPolicyModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
