/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef MemberDashboardModelTrigger(List<MemberDashboardModel?> list);
typedef MemberDashboardChanged(MemberDashboardModel? value);
typedef MemberDashboardErrorHandler(o, e);

abstract class MemberDashboardRepository extends RepositoryBase<MemberDashboardModel, MemberDashboardEntity> {
  Future<MemberDashboardEntity> addEntity(String documentID, MemberDashboardEntity value);
  Future<MemberDashboardEntity> updateEntity(String documentID, MemberDashboardEntity value);
  Future<MemberDashboardModel> add(MemberDashboardModel value);
  Future<void> delete(MemberDashboardModel value);
  Future<MemberDashboardModel?> get(String? id, { Function(Exception)? onError });
  Future<MemberDashboardModel> update(MemberDashboardModel value);

  Stream<List<MemberDashboardModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<MemberDashboardModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberDashboardModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberDashboardModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<MemberDashboardModel?>> listen(MemberDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<MemberDashboardModel?>> listenWithDetails(MemberDashboardModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<MemberDashboardModel?> listenTo(String documentId, MemberDashboardChanged changed, {MemberDashboardErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<MemberDashboardModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


