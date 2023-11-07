/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef BodyComponentModelTrigger = Function(List<BodyComponentModel?> list);
typedef BodyComponentChanged = Function(BodyComponentModel? value);
typedef BodyComponentErrorHandler = Function(dynamic o, dynamic e);

abstract class BodyComponentRepository
    extends RepositoryBase<BodyComponentModel, BodyComponentEntity> {
  @override
  Future<BodyComponentEntity> addEntity(
      String documentID, BodyComponentEntity value);
  @override
  Future<BodyComponentEntity> updateEntity(
      String documentID, BodyComponentEntity value);
  @override
  Future<BodyComponentModel> add(BodyComponentModel value);
  @override
  Future<void> delete(BodyComponentModel value);
  @override
  Future<BodyComponentModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<BodyComponentModel> update(BodyComponentModel value);

  @override
  Stream<List<BodyComponentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<BodyComponentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BodyComponentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<BodyComponentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<BodyComponentModel?>> listen(
      BodyComponentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<BodyComponentModel?>> listenWithDetails(
      BodyComponentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<BodyComponentModel?> listenTo(
      String documentId, BodyComponentChanged changed,
      {BodyComponentErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<BodyComponentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
