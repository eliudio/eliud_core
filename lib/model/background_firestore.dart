/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/background_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class BackgroundFirestore implements BackgroundRepository {
  Future<BackgroundModel> add(BackgroundModel value) {
    return BackgroundCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(BackgroundModel value) {
    return BackgroundCollection.document(value.documentID).delete();
  }

  Future<BackgroundModel> update(BackgroundModel value) {
    return BackgroundCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  BackgroundModel _populateDoc(DocumentSnapshot value) {
    return BackgroundModel.fromEntity(value.documentID, BackgroundEntity.fromMap(value.data));
  }

  Future<BackgroundModel> _populateDocPlus(DocumentSnapshot value) async {
    return BackgroundModel.fromEntityPlus(value.documentID, BackgroundEntity.fromMap(value.data), appId: appId);  }

  Future<BackgroundModel> get(String id) {
    return BackgroundCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<BackgroundModel>> stream;
    if (orderBy == null) {
       stream = BackgroundCollection.snapshots().map((data) {
        Iterable<BackgroundModel> backgrounds  = data.documents.map((doc) {
          BackgroundModel value = _populateDoc(doc);
          return value;
        }).toList();
        return backgrounds;
      });
    } else {
      stream = BackgroundCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<BackgroundModel> backgrounds  = data.documents.map((doc) {
          BackgroundModel value = _populateDoc(doc);
          return value;
        }).toList();
        return backgrounds;
      });
  
    }
    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }

  StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger) {
    Stream<List<BackgroundModel>> stream = BackgroundCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }


  Stream<List<BackgroundModel>> values() {
    return BackgroundCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<BackgroundModel>> valuesWithDetails() {
    return BackgroundCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<BackgroundModel>> valuesList() async {
    return await BackgroundCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<BackgroundModel>> valuesListWithDetails() async {
    return await BackgroundCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return BackgroundCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference BackgroundCollection;

  BackgroundFirestore(this.appId) : BackgroundCollection = Firestore.instance.collection('Background-${appId}');
}

