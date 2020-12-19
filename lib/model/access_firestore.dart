/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 access_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/access_repository.dart';

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

class AccessFirestore implements AccessRepository {
  Future<AccessModel> add(AccessModel value) {
    return AccessCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(AccessModel value) {
    return AccessCollection.document(value.documentID).delete();
  }

  Future<AccessModel> update(AccessModel value) {
    return AccessCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  AccessModel _populateDoc(DocumentSnapshot value) {
    return AccessModel.fromEntity(value.documentID, AccessEntity.fromMap(value.data));
  }

  Future<AccessModel> _populateDocPlus(DocumentSnapshot value) async {
    return AccessModel.fromEntityPlus(value.documentID, AccessEntity.fromMap(value.data), );  }

  Future<AccessModel> get(String id) {
    return AccessCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<AccessModel>> listen(AccessModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<AccessModel>> stream;
    if (orderBy == null) {
       stream = AccessCollection.snapshots().map((data) {
        Iterable<AccessModel> accesss  = data.documents.map((doc) {
          AccessModel value = _populateDoc(doc);
          return value;
        }).toList();
        return accesss;
      });
    } else {
      stream = AccessCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<AccessModel> accesss  = data.documents.map((doc) {
          AccessModel value = _populateDoc(doc);
          return value;
        }).toList();
        return accesss;
      });
  
    }
    return stream.listen((listOfAccessModels) {
      trigger(listOfAccessModels);
    });
  }

  StreamSubscription<List<AccessModel>> listenWithDetails(AccessModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<AccessModel>> stream;
    if (orderBy == null) {
      stream = AccessCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = AccessCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfAccessModels) {
      trigger(listOfAccessModels);
    });
  }


  Stream<List<AccessModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AccessModel>> _values = getQuery(AccessCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<AccessModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<AccessModel>> _values = getQuery(AccessCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AccessModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AccessModel> _values = await getQuery(AccessCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<AccessModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<AccessModel> _values = await getQuery(AccessCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
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
    return AccessCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  AccessFirestore(this.AccessCollection);

  final CollectionReference AccessCollection;
}

