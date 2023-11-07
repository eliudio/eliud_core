/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_repository.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class AppFirestore implements AppRepository {
  @override
  AppEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return AppEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<AppEntity> addEntity(String documentID, AppEntity value) {
    return appCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<AppEntity> updateEntity(String documentID, AppEntity value) {
    return appCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<AppModel> add(AppModel value) {
    return appCollection
        .doc(value.documentID)
        .set(value.toEntity(appId: value.documentID).toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(AppModel value) {
    return appCollection.doc(value.documentID).delete();
  }

  @override
  Future<AppModel> update(AppModel value) {
    return appCollection
        .doc(value.documentID)
        .update(value.toEntity(appId: value.documentID).toDocument())
        .then((_) => value);
  }

  Future<AppModel?> _populateDoc(DocumentSnapshot value) async {
    return AppModel.fromEntity(value.id, AppEntity.fromMap(value.data()));
  }

  Future<AppModel?> _populateDocPlus(DocumentSnapshot value) async {
    return AppModel.fromEntityPlus(value.id, AppEntity.fromMap(value.data()),
        appId: value.id);
  }

  @override
  Future<AppEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = appCollection.doc(id);
      var doc = await collection.get();
      return AppEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving App with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  Future<AppModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = appCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving App with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  StreamSubscription<List<AppModel?>> listen(AppModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<AppModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('app'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(appCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }

  @override
  StreamSubscription<List<AppModel?>> listenWithDetails(AppModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<AppModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('app'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(appCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }

  @override
  StreamSubscription<AppModel?> listenTo(String documentId, AppChanged changed,
      {AppErrorHandler? errorHandler}) {
    var stream = appCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  @override
  Stream<List<AppModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<AppModel?>> values = getQuery(
      appCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Stream<List<AppModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<AppModel?>> values = getQuery(
      appCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<AppModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<AppModel?> values = await getQuery(
      appCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<AppModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<AppModel?> values = await getQuery(
      appCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return appCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return appCollection.doc(documentId).collection(name);
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  Future<AppModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return appCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  AppFirestore();

  final CollectionReference appCollection =
      FirebaseFirestore.instance.collection('app');
}
