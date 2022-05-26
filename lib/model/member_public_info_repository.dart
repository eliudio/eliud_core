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

import 'dart:async';

import 'package:eliud_core/core/base/repository_base.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

typedef MemberPublicInfoModelTrigger(List<MemberPublicInfoModel?> list);
typedef MemberPublicInfoChanged(MemberPublicInfoModel? value);

abstract class MemberPublicInfoRepository extends RepositoryBase<MemberPublicInfoModel> {
  Future<MemberPublicInfoModel> add(MemberPublicInfoModel value);
  Future<void> delete(MemberPublicInfoModel value);
  Future<MemberPublicInfoModel?> get(String? id, { Function(Exception)? onError });
  Future<MemberPublicInfoModel> update(MemberPublicInfoModel value);

  Stream<List<MemberPublicInfoModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<MemberPublicInfoModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberPublicInfoModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<MemberPublicInfoModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<MemberPublicInfoModel?>> listen(MemberPublicInfoModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<MemberPublicInfoModel?>> listenWithDetails(MemberPublicInfoModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<MemberPublicInfoModel?> listenTo(String documentId, MemberPublicInfoChanged changed);
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<MemberPublicInfoModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


