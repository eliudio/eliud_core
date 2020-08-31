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

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class AppFirestore implements AppRepository {
  Future<AppModel> add(AppModel value) {
    return AppCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(AppModel value) {
    return AppCollection.document(value.documentID).delete();
  }

  Future<AppModel> update(AppModel value) {
    return AppCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  AppModel _populateDoc(DocumentSnapshot doc) {
    return AppModel.fromEntity(doc.documentID, AppEntity.fromMap(doc.data));
  }

  Future<AppModel> _populateDocPlus(DocumentSnapshot doc) async {
    return AppModel.fromEntityPlus(doc.documentID, AppEntity.fromMap(doc.data));  }

  Future<AppModel> get(String id) {
    return AppCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<AppModel>> listen(AppModelTrigger trigger) {
    Stream<List<AppModel>> stream = AppCollection.snapshots()
        .map((data) {
      Iterable<AppModel> apps  = data.documents.map((doc) {
        AppModel value = _populateDoc(doc);
        return value;
      }).toList();
      return apps;
    });

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }

  StreamSubscription<List<AppModel>> listenWithDetails(AppModelTrigger trigger) {
    Stream<List<AppModel>> stream = AppCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }


  Stream<List<AppModel>> values() {
    return AppCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<AppModel>> valuesWithDetails() {
    return AppCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<AppModel>> valuesList() async {
    return await AppCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<AppModel>> valuesListWithDetails() async {
    return await AppCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return AppCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  AppFirestore();

  final CollectionReference AppCollection = Firestore.instance.collection('App');

}

