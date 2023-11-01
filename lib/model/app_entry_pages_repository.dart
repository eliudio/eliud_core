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

typedef AppEntryPagesModelTrigger(List<AppEntryPagesModel?> list);
typedef AppEntryPagesChanged(AppEntryPagesModel? value);
typedef AppEntryPagesErrorHandler(o, e);

abstract class AppEntryPagesRepository extends RepositoryBase<AppEntryPagesModel, AppEntryPagesEntity> {
  Future<AppEntryPagesEntity> addEntity(String documentID, AppEntryPagesEntity value);
  Future<AppEntryPagesEntity> updateEntity(String documentID, AppEntryPagesEntity value);
  Future<AppEntryPagesModel> add(AppEntryPagesModel value);
  Future<void> delete(AppEntryPagesModel value);
  Future<AppEntryPagesModel?> get(String? id, { Function(Exception)? onError });
  Future<AppEntryPagesModel> update(AppEntryPagesModel value);

  Stream<List<AppEntryPagesModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<AppEntryPagesModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<AppEntryPagesModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<AppEntryPagesModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<AppEntryPagesModel?>> listen(AppEntryPagesModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<AppEntryPagesModel?>> listenWithDetails(AppEntryPagesModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<AppEntryPagesModel?> listenTo(String documentId, AppEntryPagesChanged changed, {AppEntryPagesErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<AppEntryPagesModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


