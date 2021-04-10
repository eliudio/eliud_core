/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_policy_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class AppPolicyFirestore implements AppPolicyRepository {
  Future<AppPolicyModel> add(AppPolicyModel value) {
    return AppPolicyCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(AppPolicyModel value) {
    return AppPolicyCollection.doc(value.documentID).delete();
  }

  Future<AppPolicyModel> update(AppPolicyModel value) {
    return AppPolicyCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  AppPolicyModel? _populateDoc(DocumentSnapshot value) {
    return AppPolicyModel.fromEntity(value.id, AppPolicyEntity.fromMap(value.data()));
  }

  Future<AppPolicyModel?> _populateDocPlus(DocumentSnapshot value) async {
    return AppPolicyModel.fromEntityPlus(value.id, AppPolicyEntity.fromMap(value.data()), appId: appId);  }

  Future<AppPolicyModel?> get(String? id, {Function(Exception)? onError}) {
    return AppPolicyCollection.doc(id).get().then((doc) async {
      if (doc.data() != null)
        return await _populateDocPlus(doc);
      else
        return null;
    }).catchError((Object e) {
      if (onError != null) {
        onError(e as Exception);
      }
    });
  }

  StreamSubscription<List<AppPolicyModel?>> listen(AppPolicyModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<AppPolicyModel?>> stream;
//    stream = getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((data) {
//    The above line is replaced by the below line. The reason is because the same collection can not be subscribed to twice
//    The reason we're subscribing twice to the same list, is because the close on bloc isn't called. This needs to be fixed.
//    See https://github.com/felangel/bloc/issues/2073.
//    In the meantime:
      stream = getQuery(appRepository()!.getSubCollection(appId, 'apppolicy'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((data) {
      Iterable<AppPolicyModel?> appPolicys  = data.docs.map((doc) {
        AppPolicyModel? value = _populateDoc(doc);
        return value;
      }).toList();
      return appPolicys as List<AppPolicyModel?>;
    });
    return stream.listen((listOfAppPolicyModels) {
      trigger(listOfAppPolicyModels);
    });
  }

  StreamSubscription<List<AppPolicyModel?>> listenWithDetails(AppPolicyModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<AppPolicyModel?>> stream;
//  stream = getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
//  see comment listen(...) above
    stream = getQuery(appRepository()!.getSubCollection(appId, 'apppolicy'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppPolicyModels) {
      trigger(listOfAppPolicyModels);
    });
  }

  @override
  StreamSubscription<AppPolicyModel?> listenTo(String documentId, AppPolicyChanged changed) {
    var stream = AppPolicyCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<AppPolicyModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<AppPolicyModel?>> _values = getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<AppPolicyModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<AppPolicyModel?>> _values = getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AppPolicyModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<AppPolicyModel?> _values = await getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AppPolicyModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<AppPolicyModel?> _values = await getQuery(AppPolicyCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return AppPolicyCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return AppPolicyCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<AppPolicyModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return AppPolicyCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  AppPolicyFirestore(this.AppPolicyCollection, this.appId);

  final CollectionReference AppPolicyCollection;
}

