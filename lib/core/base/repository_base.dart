import 'dart:async';

import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

typedef XModelTrigger<T>(List<T?> list);
typedef XChanged<T>(T? value);

abstract class RepositoryBase<T, U> {
  Future<U> addEntity(String documentID, U value);
  Future<U> updateEntity(String documentID, U value);
  Future<U?> getEntity(String? id, {Function(Exception)? onError});
  U? fromMap(Object? o);

  Future<T> add(T value);
  Future<void> delete(T value);
  Future<T?> get(String? id, { Function(Exception)? onError });
  Future<T> update(T value);

  Stream<List<T?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<T?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<T?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<T?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<T?>> listen(XModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<T?>> listenWithDetails(XModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<T?> listenTo(String documentId, XChanged changed);
  void flush();

  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<T?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}
