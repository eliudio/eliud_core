/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef DecorationColorModelTrigger = Function(
    List<DecorationColorModel?> list);
typedef DecorationColorChanged = Function(DecorationColorModel? value);
typedef DecorationColorErrorHandler = Function(dynamic o, dynamic e);

abstract class DecorationColorRepository
    extends RepositoryBase<DecorationColorModel, DecorationColorEntity> {
  @override
  Future<DecorationColorEntity> addEntity(
      String documentID, DecorationColorEntity value);
  @override
  Future<DecorationColorEntity> updateEntity(
      String documentID, DecorationColorEntity value);
  @override
  Future<DecorationColorModel> add(DecorationColorModel value);
  @override
  Future<void> delete(DecorationColorModel value);
  @override
  Future<DecorationColorModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<DecorationColorModel> update(DecorationColorModel value);

  @override
  Stream<List<DecorationColorModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<DecorationColorModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DecorationColorModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DecorationColorModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<DecorationColorModel?>> listen(
      DecorationColorModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<DecorationColorModel?>> listenWithDetails(
      DecorationColorModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<DecorationColorModel?> listenTo(
      String documentId, DecorationColorChanged changed,
      {DecorationColorErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<DecorationColorModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
