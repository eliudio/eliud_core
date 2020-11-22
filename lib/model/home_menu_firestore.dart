/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/home_menu_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class HomeMenuFirestore implements HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).setData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  Future<void> delete(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).delete();
  }

  Future<HomeMenuModel> update(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).updateData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  HomeMenuModel _populateDoc(DocumentSnapshot doc) {
    return HomeMenuModel.fromEntity(doc.documentID, HomeMenuEntity.fromMap(doc.data));
  }

  Future<HomeMenuModel> _populateDocPlus(DocumentSnapshot doc) async {
    return HomeMenuModel.fromEntityPlus(doc.documentID, HomeMenuEntity.fromMap(doc.data));  }

  Future<HomeMenuModel> get(String id) {
    return HomeMenuCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger) {
    Stream<List<HomeMenuModel>> stream = HomeMenuCollection.snapshots()
        .map((data) {
      Iterable<HomeMenuModel> homeMenus  = data.documents.map((doc) {
        HomeMenuModel value = _populateDoc(doc);
        return value;
      }).toList();
      return homeMenus;
    });

    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }

  StreamSubscription<List<HomeMenuModel>> listenWithDetails(HomeMenuModelTrigger trigger) {
    Stream<List<HomeMenuModel>> stream = HomeMenuCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }


  Stream<List<HomeMenuModel>> values() {
    return HomeMenuCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<HomeMenuModel>> valuesWithDetails() {
    return HomeMenuCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<HomeMenuModel>> valuesList() async {
    return await HomeMenuCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<HomeMenuModel>> valuesListWithDetails() async {
    return await HomeMenuCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return HomeMenuCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference HomeMenuCollection;

  HomeMenuFirestore(this.appID) : HomeMenuCollection = Firestore.instance.collection('HomeMenu-${appID}');
}

