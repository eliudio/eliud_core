/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/public_medium_repository.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

/* 
 * PublicMediumFirestore is the firestore implementation of PublicMediumRepository
 */
class PublicMediumFirestore implements PublicMediumRepository {
  /* 
   * transform a map into an entity
   */
  @override
  PublicMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return PublicMediumEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<PublicMediumEntity> addEntity(
      String documentID, PublicMediumEntity value) {
    return publicMediumCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Update an entity
   */
  @override
  Future<PublicMediumEntity> updateEntity(
      String documentID, PublicMediumEntity value) {
    return publicMediumCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<PublicMediumModel> add(PublicMediumModel value) {
    return publicMediumCollection
        .doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(PublicMediumModel value) {
    return publicMediumCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<PublicMediumModel> update(PublicMediumModel value) {
    return publicMediumCollection
        .doc(value.documentID)
        .update(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<PublicMediumModel?> _populateDoc(DocumentSnapshot value) async {
    return PublicMediumModel.fromEntity(
        value.id, PublicMediumEntity.fromMap(value.data()));
  }

  Future<PublicMediumModel?> _populateDocPlus(DocumentSnapshot value) async {
    return PublicMediumModel.fromEntityPlus(
      value.id,
      PublicMediumEntity.fromMap(value.data()),
    );
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<PublicMediumEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = publicMediumCollection.doc(id);
      var doc = await collection.get();
      return PublicMediumEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving PublicMedium with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<PublicMediumModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = publicMediumCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving PublicMedium with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<PublicMediumModel?>> listen(
      PublicMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<PublicMediumModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('publicmedium'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(publicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfPublicMediumModels) {
      trigger(listOfPublicMediumModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<PublicMediumModel?>> listenWithDetails(
      PublicMediumModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<PublicMediumModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('publicmedium'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(publicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPublicMediumModels) {
      trigger(listOfPublicMediumModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<PublicMediumModel?> listenTo(
      String documentId, PublicMediumChanged changed,
      {PublicMediumErrorHandler? errorHandler}) {
    var stream =
        publicMediumCollection.doc(documentId).snapshots().asyncMap((data) {
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

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Stream<List<PublicMediumModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<PublicMediumModel?>> values = getQuery(
      publicMediumCollection,
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

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Stream<List<PublicMediumModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<PublicMediumModel?>> values = getQuery(
      publicMediumCollection,
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

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Future<List<PublicMediumModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<PublicMediumModel?> values = await getQuery(
      publicMediumCollection,
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

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Future<List<PublicMediumModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<PublicMediumModel?> values = await getQuery(
      publicMediumCollection,
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

  /* 
   * Flush the repository
   */
  @override
  void flush() {}

  /* 
   * Delete all entries in the repository
   */
  @override
  Future<void> deleteAll() {
    return publicMediumCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  /* 
   * Retrieve the subcollection of this repository
   */
  @override
  dynamic getSubCollection(String documentId, String name) {
    return publicMediumCollection.doc(documentId).collection(name);
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  /* 
   * change 1 a fieldvalue for 1 document  
   */
  @override
  Future<PublicMediumModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return publicMediumCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  PublicMediumFirestore();

  final CollectionReference publicMediumCollection =
      FirebaseFirestore.instance.collection('publicmedium');
}
