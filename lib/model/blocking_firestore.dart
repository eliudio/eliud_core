/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/blocking_repository.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class BlockingFirestore implements BlockingRepository {
  @override
  BlockingEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return BlockingEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<BlockingEntity> addEntity(String documentID, BlockingEntity value) {
    return blockingCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<BlockingEntity> updateEntity(String documentID, BlockingEntity value) {
    return blockingCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<BlockingModel> add(BlockingModel value) {
    return blockingCollection
        .doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(BlockingModel value) {
    return blockingCollection.doc(value.documentID).delete();
  }

  @override
  Future<BlockingModel> update(BlockingModel value) {
    return blockingCollection
        .doc(value.documentID)
        .update(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<BlockingModel?> _populateDoc(DocumentSnapshot value) async {
    return BlockingModel.fromEntity(
        value.id, BlockingEntity.fromMap(value.data()));
  }

  Future<BlockingModel?> _populateDocPlus(DocumentSnapshot value) async {
    return BlockingModel.fromEntityPlus(
      value.id,
      BlockingEntity.fromMap(value.data()),
    );
  }

  @override
  Future<BlockingEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = blockingCollection.doc(id);
      var doc = await collection.get();
      return BlockingEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Blocking with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  Future<BlockingModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = blockingCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Blocking with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  StreamSubscription<List<BlockingModel?>> listen(BlockingModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<BlockingModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('blocking'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(blockingCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfBlockingModels) {
      trigger(listOfBlockingModels);
    });
  }

  @override
  StreamSubscription<List<BlockingModel?>> listenWithDetails(
      BlockingModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<BlockingModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('blocking'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(blockingCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfBlockingModels) {
      trigger(listOfBlockingModels);
    });
  }

  @override
  StreamSubscription<BlockingModel?> listenTo(
      String documentId, BlockingChanged changed,
      {BlockingErrorHandler? errorHandler}) {
    var stream =
        blockingCollection.doc(documentId).snapshots().asyncMap((data) {
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
  Stream<List<BlockingModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<BlockingModel?>> values = getQuery(
      blockingCollection,
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
  Stream<List<BlockingModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<BlockingModel?>> values = getQuery(
      blockingCollection,
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
  Future<List<BlockingModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<BlockingModel?> values = await getQuery(
      blockingCollection,
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
  Future<List<BlockingModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<BlockingModel?> values = await getQuery(
      blockingCollection,
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
    return blockingCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return blockingCollection.doc(documentId).collection(name);
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  Future<BlockingModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return blockingCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  BlockingFirestore();

  final CollectionReference blockingCollection =
      FirebaseFirestore.instance.collection('blocking');
}
