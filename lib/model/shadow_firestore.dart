/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/shadow_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class ShadowFirestore implements ShadowRepository {
  Future<ShadowModel> add(ShadowModel value) {
    return ShadowCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(ShadowModel value) {
    return ShadowCollection.document(value.documentID).delete();
  }

  Future<ShadowModel> update(ShadowModel value) {
    return ShadowCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  ShadowModel _populateDoc(DocumentSnapshot value) {
    return ShadowModel.fromEntity(value.documentID, ShadowEntity.fromMap(value.data));
  }

  Future<ShadowModel> _populateDocPlus(DocumentSnapshot value) async {
    return ShadowModel.fromEntityPlus(value.documentID, ShadowEntity.fromMap(value.data), appId: appId);  }

  Future<ShadowModel> get(String id) {
    return ShadowCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<ShadowModel>> listen(ShadowModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<ShadowModel>> stream;
    if (orderBy == null) {
       stream = ShadowCollection.snapshots().map((data) {
        Iterable<ShadowModel> shadows  = data.documents.map((doc) {
          ShadowModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shadows;
      });
    } else {
      stream = ShadowCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<ShadowModel> shadows  = data.documents.map((doc) {
          ShadowModel value = _populateDoc(doc);
          return value;
        }).toList();
        return shadows;
      });
  
    }
    return stream.listen((listOfShadowModels) {
      trigger(listOfShadowModels);
    });
  }

  StreamSubscription<List<ShadowModel>> listenWithDetails(ShadowModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<ShadowModel>> stream;
    if (orderBy == null) {
      stream = ShadowCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = ShadowCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfShadowModels) {
      trigger(listOfShadowModels);
    });
  }


  Stream<List<ShadowModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ShadowCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return ShadowCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<ShadowModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return ShadowCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return ShadowCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<ShadowModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ShadowCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await ShadowCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<ShadowModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await ShadowCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await ShadowCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return ShadowCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference ShadowCollection;

  ShadowFirestore(this.appId) : ShadowCollection = Firestore.instance.collection('Shadow-${appId}');
}

