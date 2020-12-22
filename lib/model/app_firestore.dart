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


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class AppFirestore implements AppRepository {
  Future<AppModel> add(AppModel value) {
    return AppCollection.document(value.documentID).setData(value.toEntity(appId: value.documentID).toDocument()).then((_) => value);
  }

  Future<void> delete(AppModel value) {
    return AppCollection.document(value.documentID).delete();
  }

  Future<AppModel> update(AppModel value) {
    return AppCollection.document(value.documentID).updateData(value.toEntity(appId: value.documentID).toDocument()).then((_) => value);
  }

  AppModel _populateDoc(DocumentSnapshot value) {
    return AppModel.fromEntity(value.documentID, AppEntity.fromMap(value.data));
  }

  Future<AppModel> _populateDocPlus(DocumentSnapshot value) async {
    return AppModel.fromEntityPlus(value.documentID, AppEntity.fromMap(value.data), appId: value.documentID);  }

  Future<AppModel> get(String id) {
    return AppCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<AppModel>> listen(AppModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<AppModel>> stream;
    if (orderBy == null) {
       stream = AppCollection.snapshots().map((data) {
        Iterable<AppModel> apps  = data.documents.map((doc) {
          AppModel value = _populateDoc(doc);
          return value;
        }).toList();
        return apps;
      });
    } else {
      stream = AppCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<AppModel> apps  = data.documents.map((doc) {
          AppModel value = _populateDoc(doc);
          return value;
        }).toList();
        return apps;
      });
  
    }
    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }

  StreamSubscription<List<AppModel>> listenWithDetails(AppModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<AppModel>> stream;
    if (orderBy == null) {
      stream = AppCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = AppCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }


  Stream<List<AppModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AppModel>> _values = getQuery(AppCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, ).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<AppModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AppModel>> _values = getQuery(AppCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, ).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AppModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AppModel> _values = await getQuery(AppCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AppModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AppModel> _values = await getQuery(AppCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, ).getDocuments().then((value) {
      var list = value.documents;
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
    return AppCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return AppCollection.document(documentId).collection(name);
  }


  AppFirestore();

  final CollectionReference AppCollection = Firestore.instance.collection('app');

}

