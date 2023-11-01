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

typedef PlatformMediumModelTrigger(List<PlatformMediumModel?> list);
typedef PlatformMediumChanged(PlatformMediumModel? value);
typedef PlatformMediumErrorHandler(o, e);

abstract class PlatformMediumRepository extends RepositoryBase<PlatformMediumModel, PlatformMediumEntity> {
  Future<PlatformMediumEntity> addEntity(String documentID, PlatformMediumEntity value);
  Future<PlatformMediumEntity> updateEntity(String documentID, PlatformMediumEntity value);
  Future<PlatformMediumModel> add(PlatformMediumModel value);
  Future<void> delete(PlatformMediumModel value);
  Future<PlatformMediumModel?> get(String? id, { Function(Exception)? onError });
  Future<PlatformMediumModel> update(PlatformMediumModel value);

  Stream<List<PlatformMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<PlatformMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<PlatformMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<PlatformMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<PlatformMediumModel?>> listen(PlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<PlatformMediumModel?>> listenWithDetails(PlatformMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<PlatformMediumModel?> listenTo(String documentId, PlatformMediumChanged changed, {PlatformMediumErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<PlatformMediumModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


