/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef AppEntryPagesModelTrigger = Function(List<AppEntryPagesModel?> list);
typedef AppEntryPagesChanged = Function(AppEntryPagesModel? value);
typedef AppEntryPagesErrorHandler = Function(dynamic o, dynamic e);

abstract class AppEntryPagesRepository
    extends RepositoryBase<AppEntryPagesModel, AppEntryPagesEntity> {
  @override
  Future<AppEntryPagesEntity> addEntity(
      String documentID, AppEntryPagesEntity value);
  @override
  Future<AppEntryPagesEntity> updateEntity(
      String documentID, AppEntryPagesEntity value);
  @override
  Future<AppEntryPagesModel> add(AppEntryPagesModel value);
  @override
  Future<void> delete(AppEntryPagesModel value);
  @override
  Future<AppEntryPagesModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<AppEntryPagesModel> update(AppEntryPagesModel value);

  @override
  Stream<List<AppEntryPagesModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<AppEntryPagesModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AppEntryPagesModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<AppEntryPagesModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<AppEntryPagesModel?>> listen(
      AppEntryPagesModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<AppEntryPagesModel?>> listenWithDetails(
      AppEntryPagesModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<AppEntryPagesModel?> listenTo(
      String documentId, AppEntryPagesChanged changed,
      {AppEntryPagesErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<AppEntryPagesModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
