/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/eliud_style_attributes_repository.dart';


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

class EliudStyleAttributesFirestore implements EliudStyleAttributesRepository {
  Future<EliudStyleAttributesModel> add(EliudStyleAttributesModel value) {
    return EliudStyleAttributesCollection.doc(value.documentID).set(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(EliudStyleAttributesModel value) {
    return EliudStyleAttributesCollection.doc(value.documentID).delete();
  }

  Future<EliudStyleAttributesModel> update(EliudStyleAttributesModel value) {
    return EliudStyleAttributesCollection.doc(value.documentID).update(value.toEntity().toDocument()).then((_) => value);
  }

  EliudStyleAttributesModel? _populateDoc(DocumentSnapshot value) {
    return EliudStyleAttributesModel.fromEntity(value.id, EliudStyleAttributesEntity.fromMap(value.data()));
  }

  Future<EliudStyleAttributesModel?> _populateDocPlus(DocumentSnapshot value) async {
    return EliudStyleAttributesModel.fromEntityPlus(value.id, EliudStyleAttributesEntity.fromMap(value.data()), );  }

  Future<EliudStyleAttributesModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = EliudStyleAttributesCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      print("Error whilst retrieving EliudStyleAttributes with id $id");
      print("Exceptoin: $e");
      if (onError != null) {
        onError(e);
      }
    };
  }

  StreamSubscription<List<EliudStyleAttributesModel?>> listen(EliudStyleAttributesModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<EliudStyleAttributesModel?>> stream;
//    stream = getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
//    The above line is replaced by the below line. The reason is because the same collection can not be subscribed to twice
//    The reason we're subscribing twice to the same list, is because the close on bloc isn't called. This needs to be fixed.
//    See https://github.com/felangel/bloc/issues/2073.
//    In the meantime:
      stream = getQuery(FirebaseFirestore.instance.collection('eliudstyleattributes'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
      Iterable<EliudStyleAttributesModel?> eliudStyleAttributess  = data.docs.map((doc) {
        EliudStyleAttributesModel? value = _populateDoc(doc);
        return value;
      }).toList();
      return eliudStyleAttributess as List<EliudStyleAttributesModel?>;
    });
    return stream.listen((listOfEliudStyleAttributesModels) {
      trigger(listOfEliudStyleAttributesModels);
    });
  }

  StreamSubscription<List<EliudStyleAttributesModel?>> listenWithDetails(EliudStyleAttributesModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<EliudStyleAttributesModel?>> stream;
//  stream = getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, ).snapshots()
//  see comment listen(...) above
    stream = getQuery(FirebaseFirestore.instance.collection('eliudstyleattributes'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfEliudStyleAttributesModels) {
      trigger(listOfEliudStyleAttributesModels);
    });
  }

  @override
  StreamSubscription<EliudStyleAttributesModel?> listenTo(String documentId, EliudStyleAttributesChanged changed) {
    var stream = EliudStyleAttributesCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<EliudStyleAttributesModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<EliudStyleAttributesModel?>> _values = getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<EliudStyleAttributesModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<EliudStyleAttributesModel?>> _values = getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<EliudStyleAttributesModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<EliudStyleAttributesModel?> _values = await getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<EliudStyleAttributesModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<EliudStyleAttributesModel?> _values = await getQuery(EliudStyleAttributesCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
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
    return EliudStyleAttributesCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return EliudStyleAttributesCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<EliudStyleAttributesModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return EliudStyleAttributesCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  EliudStyleAttributesFirestore();

  final CollectionReference EliudStyleAttributesCollection = FirebaseFirestore.instance.collection('eliudstyleattributes');

}

