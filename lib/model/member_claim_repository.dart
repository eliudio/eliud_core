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

typedef MemberClaimModelTrigger(List<MemberClaimModel?> list);
typedef MemberClaimChanged(MemberClaimModel? value);
typedef MemberClaimErrorHandler(o, e);

abstract class MemberClaimRepository extends RepositoryBase<MemberClaimModel, MemberClaimEntity> {
  Future<MemberClaimEntity> addEntity(String documentID, MemberClaimEntity value);
  Future<MemberClaimEntity> updateEntity(String documentID, MemberClaimEntity value);
  Future<MemberClaimModel> add(MemberClaimModel value);
  Future<void> delete(MemberClaimModel value);
  Future<MemberClaimModel?> get(String? id, { Function(Exception)? onError });
  Future<MemberClaimModel> update(MemberClaimModel value);

  Stream<List<MemberClaimModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<MemberClaimModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberClaimModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberClaimModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<MemberClaimModel?>> listen(MemberClaimModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<MemberClaimModel?>> listenWithDetails(MemberClaimModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<MemberClaimModel?> listenTo(String documentId, MemberClaimChanged changed, {MemberClaimErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<MemberClaimModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


