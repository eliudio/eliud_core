/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberSubscriptionModelTrigger = Function(
    List<MemberSubscriptionModel?> list);
typedef MemberSubscriptionChanged = Function(MemberSubscriptionModel? value);
typedef MemberSubscriptionErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberSubscriptionRepository
    extends RepositoryBase<MemberSubscriptionModel, MemberSubscriptionEntity> {
  @override
  Future<MemberSubscriptionEntity> addEntity(
      String documentID, MemberSubscriptionEntity value);
  @override
  Future<MemberSubscriptionEntity> updateEntity(
      String documentID, MemberSubscriptionEntity value);
  @override
  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value);
  @override
  Future<void> delete(MemberSubscriptionModel value);
  @override
  Future<MemberSubscriptionModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value);

  @override
  Stream<List<MemberSubscriptionModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberSubscriptionModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberSubscriptionModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberSubscriptionModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberSubscriptionModel?>> listen(
      MemberSubscriptionModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberSubscriptionModel?>> listenWithDetails(
      MemberSubscriptionModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberSubscriptionModel?> listenTo(
      String documentId, MemberSubscriptionChanged changed,
      {MemberSubscriptionErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberSubscriptionModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
