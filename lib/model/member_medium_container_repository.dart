/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_container_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberMediumContainerModelTrigger = Function(
    List<MemberMediumContainerModel?> list);
typedef MemberMediumContainerChanged = Function(
    MemberMediumContainerModel? value);
typedef MemberMediumContainerErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberMediumContainerRepository extends RepositoryBase<
    MemberMediumContainerModel, MemberMediumContainerEntity> {
  @override
  Future<MemberMediumContainerEntity> addEntity(
      String documentID, MemberMediumContainerEntity value);
  @override
  Future<MemberMediumContainerEntity> updateEntity(
      String documentID, MemberMediumContainerEntity value);
  @override
  Future<MemberMediumContainerModel> add(MemberMediumContainerModel value);
  @override
  Future<void> delete(MemberMediumContainerModel value);
  @override
  Future<MemberMediumContainerModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<MemberMediumContainerModel> update(MemberMediumContainerModel value);

  @override
  Stream<List<MemberMediumContainerModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberMediumContainerModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberMediumContainerModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberMediumContainerModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberMediumContainerModel?>> listen(
      MemberMediumContainerModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberMediumContainerModel?>> listenWithDetails(
      MemberMediumContainerModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberMediumContainerModel?> listenTo(
      String documentId, MemberMediumContainerChanged changed,
      {MemberMediumContainerErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberMediumContainerModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
