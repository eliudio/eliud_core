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

class PublicMediumFirestore implements PublicMediumRepository {
  Future<PublicMediumModel> add(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).set(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).delete();
  }

  Future<PublicMediumModel> update(PublicMediumModel value) {
    return PublicMediumCollection.doc(value.documentID).update(value.toEntity().toDocument()).then((_) => value);
  }

  PublicMediumModel? _populateDoc(DocumentSnapshot value) {
    return PublicMediumModel.fromEntity(value.id, PublicMediumEntity.fromMap(value.data()));
  }

  Future<PublicMediumModel?> _populateDocPlus(DocumentSnapshot value) async {
    return PublicMediumModel.fromEntityPlus(value.id, PublicMediumEntity.fromMap(value.data()), );  }

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
  }

  StreamSubscription<List<PublicMediumModel?>> listen(PublicMediumModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<PublicMediumModel?>> stream;
      stream = getQuery(FirebaseFirestore.instance.collection('publicmedium'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
//    The above line should eventually become the below line
//    See https://github.com/felangel/bloc/issues/2073.
//    stream = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
      Iterable<PublicMediumModel?> publicMediums  = data.docs.map((doc) {
        PublicMediumModel? value = _populateDoc(doc);
        return value;
      }).toList();
      return publicMediums as List<PublicMediumModel?>;
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
  StreamSubscription<PublicMediumModel?> listenTo(String documentId, PublicMediumChanged changed) {
    var stream = PublicMediumCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<PublicMediumModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<PublicMediumModel?>> _values = getQuery(PublicMediumCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
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
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
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
