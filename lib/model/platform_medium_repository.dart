/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef PlatformMediumModelTrigger = Function(List<PlatformMediumModel?> list);
typedef PlatformMediumChanged = Function(PlatformMediumModel? value);
typedef PlatformMediumErrorHandler = Function(dynamic o, dynamic e);

abstract class PlatformMediumRepository
    extends RepositoryBase<PlatformMediumModel, PlatformMediumEntity> {
  @override
  Future<PlatformMediumEntity> addEntity(
      String documentID, PlatformMediumEntity value);
  @override
  Future<PlatformMediumEntity> updateEntity(
      String documentID, PlatformMediumEntity value);
  @override
  Future<PlatformMediumModel> add(PlatformMediumModel value);
  @override
  Future<void> delete(PlatformMediumModel value);
  @override
  Future<PlatformMediumModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PlatformMediumModel> update(PlatformMediumModel value);

  @override
  Stream<List<PlatformMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PlatformMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PlatformMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PlatformMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PlatformMediumModel?>> listen(
      PlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PlatformMediumModel?>> listenWithDetails(
      PlatformMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PlatformMediumModel?> listenTo(
      String documentId, PlatformMediumChanged changed,
      {PlatformMediumErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PlatformMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
