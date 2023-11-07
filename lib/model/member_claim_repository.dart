/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_claim_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberClaimModelTrigger = Function(List<MemberClaimModel?> list);
typedef MemberClaimChanged = Function(MemberClaimModel? value);
typedef MemberClaimErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberClaimRepository
    extends RepositoryBase<MemberClaimModel, MemberClaimEntity> {
  @override
  Future<MemberClaimEntity> addEntity(
      String documentID, MemberClaimEntity value);
  @override
  Future<MemberClaimEntity> updateEntity(
      String documentID, MemberClaimEntity value);
  @override
  Future<MemberClaimModel> add(MemberClaimModel value);
  @override
  Future<void> delete(MemberClaimModel value);
  @override
  Future<MemberClaimModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<MemberClaimModel> update(MemberClaimModel value);

  @override
  Stream<List<MemberClaimModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberClaimModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberClaimModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberClaimModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberClaimModel?>> listen(
      MemberClaimModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberClaimModel?>> listenWithDetails(
      MemberClaimModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberClaimModel?> listenTo(
      String documentId, MemberClaimChanged changed,
      {MemberClaimErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberClaimModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
