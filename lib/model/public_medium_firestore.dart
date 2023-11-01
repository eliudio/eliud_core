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

class PublicMediumFirestore implements PublicMediumRepository {
  @override
  PublicMediumEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return PublicMediumEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<PublicMediumEntity> addEntity(String documentID, PublicMediumEntity value) {
    return PublicMediumCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<PublicMediumEntity> updateEntity(String documentID, PublicMediumEntity value) {
    return PublicMediumCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<PublicMediumModel> add(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).set(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).delete();
  }

  Future<PublicMediumModel> update(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).update(value.toEntity().toDocument()).then((_) => value);
  }

  Future<PublicMediumModel?> _populateDoc(DocumentSnapshot value) async {
    return PublicMediumModel.fromEntity(value.id, PublicMediumEntity.fromMap(value.data()));
  }

  Future<PublicMediumModel?> _populateDocPlus(DocumentSnapshot value) async {
    return PublicMediumModel.fromEntityPlus(value.id, PublicMediumEntity.fromMap(value.data()), );  }

  Future<PublicMediumEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = PublicMediumCollection.doc(id);
      var doc = await collection.get();
      return PublicMediumEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving PublicMedium with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  Future<PublicMediumModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = PublicMediumCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving PublicMedium with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  StreamSubscription<List<PublicMediumModel?>> listen(PublicMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<PublicMediumModel?>> stream;
    stream = getQuery(FirebaseFirestore.instance.collection('publicmedium'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfPublicMediumModels) {
      trigger(listOfPublicMediumModels);
    });
  }

  StreamSubscription<List<PublicMediumModel?>> listenWithDetails(PublicMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<PublicMediumModel?>> stream;
    stream = getQuery(FirebaseFirestore.instance.collection('publicmedium'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPublicMediumModels) {
      trigger(listOfPublicMediumModels);
    });
  }

  @override
  StreamSubscription<PublicMediumModel?> listenTo(String documentId, PublicMediumChanged changed, {PublicMediumErrorHandler? errorHandler}) {
    var stream = PublicMediumCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
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

  Stream<List<PublicMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<PublicMediumModel?>> _values = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PublicMediumModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<PublicMediumModel?>> _values = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PublicMediumModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<PublicMediumModel?> _values = await getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PublicMediumModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<PublicMediumModel?> _values = await getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
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
    return PublicMediumCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return PublicMediumCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<PublicMediumModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return PublicMediumCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  PublicMediumFirestore();

  final CollectionReference PublicMediumCollection = FirebaseFirestore.instance.collection('publicmedium');

}

