/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberPublicInfoModelTrigger = Function(
    List<MemberPublicInfoModel?> list);
typedef MemberPublicInfoChanged = Function(MemberPublicInfoModel? value);
typedef MemberPublicInfoErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberPublicInfoRepository
    extends RepositoryBase<MemberPublicInfoModel, MemberPublicInfoEntity> {
  @override
  Future<MemberPublicInfoEntity> addEntity(
      String documentID, MemberPublicInfoEntity value);
  @override
  Future<MemberPublicInfoEntity> updateEntity(
      String documentID, MemberPublicInfoEntity value);
  @override
  Future<MemberPublicInfoModel> add(MemberPublicInfoModel value);
  @override
  Future<void> delete(MemberPublicInfoModel value);
  @override
  Future<MemberPublicInfoModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<MemberPublicInfoModel> update(MemberPublicInfoModel value);

  @override
  Stream<List<MemberPublicInfoModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberPublicInfoModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberPublicInfoModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberPublicInfoModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberPublicInfoModel?>> listen(
      MemberPublicInfoModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberPublicInfoModel?>> listenWithDetails(
      MemberPublicInfoModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberPublicInfoModel?> listenTo(
      String documentId, MemberPublicInfoChanged changed,
      {MemberPublicInfoErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberPublicInfoModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
