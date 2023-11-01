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

typedef MemberMediumContainerModelTrigger(List<MemberMediumContainerModel?> list);
typedef MemberMediumContainerChanged(MemberMediumContainerModel? value);
typedef MemberMediumContainerErrorHandler(o, e);

abstract class MemberMediumContainerRepository extends RepositoryBase<MemberMediumContainerModel, MemberMediumContainerEntity> {
  Future<MemberMediumContainerEntity> addEntity(String documentID, MemberMediumContainerEntity value);
  Future<MemberMediumContainerEntity> updateEntity(String documentID, MemberMediumContainerEntity value);
  Future<MemberMediumContainerModel> add(MemberMediumContainerModel value);
  Future<void> delete(MemberMediumContainerModel value);
  Future<MemberMediumContainerModel?> get(String? id, { Function(Exception)? onError });
  Future<MemberMediumContainerModel> update(MemberMediumContainerModel value);

  Stream<List<MemberMediumContainerModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<MemberMediumContainerModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberMediumContainerModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberMediumContainerModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<MemberMediumContainerModel?>> listen(MemberMediumContainerModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<MemberMediumContainerModel?>> listenWithDetails(MemberMediumContainerModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<MemberMediumContainerModel?> listenTo(String documentId, MemberMediumContainerChanged changed, {MemberMediumContainerErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<MemberMediumContainerModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


