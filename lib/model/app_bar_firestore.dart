/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'app_bar_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class AppBarFirestore implements AppBarRepository {
  Future<AppBarModel> add(AppBarModel value) {
    return AppBarCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(AppBarModel value) {
    return AppBarCollection.document(value.documentID).delete();
  }

  Future<AppBarModel> update(AppBarModel value) {
    return AppBarCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  AppBarModel _populateDoc(DocumentSnapshot doc) {
    return AppBarModel.fromEntity(doc.documentID, AppBarEntity.fromMap(doc.data));
  }

  Future<AppBarModel> _populateDocPlus(DocumentSnapshot doc) async {
    return AppBarModel.fromEntityPlus(doc.documentID, AppBarEntity.fromMap(doc.data));  }

  Future<AppBarModel> get(String id) {
    return AppBarCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<AppBarModel>> listen(AppBarModelTrigger trigger) {
    Stream<List<AppBarModel>> stream = AppBarCollection.snapshots()
        .map((data) {
      Iterable<AppBarModel> appBars  = data.documents.map((doc) {
        AppBarModel value = _populateDoc(doc);
        return value;
      }).toList();
      return appBars;
    });

    return stream.listen((listOfAppBarModels) {
      trigger(listOfAppBarModels);
    });
  }

  StreamSubscription<List<AppBarModel>> listenWithDetails(AppBarModelTrigger trigger) {
    Stream<List<AppBarModel>> stream = AppBarCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppBarModels) {
      trigger(listOfAppBarModels);
    });
  }


  Stream<List<AppBarModel>> values() {
    return AppBarCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<AppBarModel>> valuesWithDetails() {
    return AppBarCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<AppBarModel>> valuesList() async {
    return await AppBarCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<AppBarModel>> valuesListWithDetails() async {
    return await AppBarCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return AppBarCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference AppBarCollection;

  AppBarFirestore(this.appID) : AppBarCollection = Firestore.instance.collection('AppBar-${appID}');
}

