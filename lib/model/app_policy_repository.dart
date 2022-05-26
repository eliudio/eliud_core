/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:eliud_core/core/base/repository_base.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

typedef AppPolicyModelTrigger(List<AppPolicyModel?> list);
typedef AppPolicyChanged(AppPolicyModel? value);

abstract class AppPolicyRepository extends RepositoryBase<AppPolicyModel> {
  Future<AppPolicyModel> add(AppPolicyModel value);
  Future<void> delete(AppPolicyModel value);
  Future<AppPolicyModel?> get(String? id, { Function(Exception)? onError });
  Future<AppPolicyModel> update(AppPolicyModel value);

  Stream<List<AppPolicyModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<AppPolicyModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<AppPolicyModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<AppPolicyModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<AppPolicyModel?>> listen(AppPolicyModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<AppPolicyModel?>> listenWithDetails(AppPolicyModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<AppPolicyModel?> listenTo(String documentId, AppPolicyChanged changed);
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<AppPolicyModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


