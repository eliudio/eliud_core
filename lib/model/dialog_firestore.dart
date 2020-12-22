/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/dialog_repository.dart';


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

class DialogFirestore implements DialogRepository {
  Future<DialogModel> add(DialogModel value) {
    return DialogCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(DialogModel value) {
    return DialogCollection.document(value.documentID).delete();
  }

  Future<DialogModel> update(DialogModel value) {
    return DialogCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  DialogModel _populateDoc(DocumentSnapshot value) {
    return DialogModel.fromEntity(value.documentID, DialogEntity.fromMap(value.data));
  }

  Future<DialogModel> _populateDocPlus(DocumentSnapshot value) async {
    return DialogModel.fromEntityPlus(value.documentID, DialogEntity.fromMap(value.data), appId: appId);  }

  Future<DialogModel> get(String id) {
    return DialogCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<DialogModel>> listen(DialogModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<DialogModel>> stream;
    if (orderBy == null) {
       stream = DialogCollection.snapshots().map((data) {
        Iterable<DialogModel> dialogs  = data.documents.map((doc) {
          DialogModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dialogs;
      });
    } else {
      stream = DialogCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<DialogModel> dialogs  = data.documents.map((doc) {
          DialogModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dialogs;
      });
  
    }
    return stream.listen((listOfDialogModels) {
      trigger(listOfDialogModels);
    });
  }

  StreamSubscription<List<DialogModel>> listenWithDetails(DialogModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<DialogModel>> stream;
    if (orderBy == null) {
      stream = DialogCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = DialogCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfDialogModels) {
      trigger(listOfDialogModels);
    });
  }


  Stream<List<DialogModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DialogModel>> _values = getQuery(DialogCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<DialogModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DialogModel>> _values = getQuery(DialogCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DialogModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DialogModel> _values = await getQuery(DialogCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DialogModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DialogModel> _values = await getQuery(DialogCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
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
    return DialogCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return DialogCollection.document(documentId).collection(name);
  }


  final String appId;
  DialogFirestore(this.DialogCollection, this.appId);

  final CollectionReference DialogCollection;
}

