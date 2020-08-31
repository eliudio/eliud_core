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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'home_menu_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class HomeMenuJsFirestore implements HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID).delete();
  }

  Future<HomeMenuModel> update(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  HomeMenuModel _populateDoc(DocumentSnapshot doc) {
    return HomeMenuModel.fromEntity(doc.id, HomeMenuEntity.fromMap(doc.data()));
  }

  Future<HomeMenuModel> _populateDocPlus(DocumentSnapshot doc) async {
    return HomeMenuModel.fromEntityPlus(doc.id, HomeMenuEntity.fromMap(doc.data()));
  }

  Future<HomeMenuModel> get(String id) {
    return homeMenuCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger) {
    // If we use homeMenuCollection here, then the second subscription fails
    Stream<List<HomeMenuModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<HomeMenuModel> homeMenus  = data.docs.map((doc) {
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
    // If we use homeMenuCollection here, then the second subscription fails
    Stream<List<HomeMenuModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }

  Stream<List<HomeMenuModel>> values() {
    return homeMenuCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<HomeMenuModel>> valuesWithDetails() {
    return homeMenuCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<HomeMenuModel>> valuesList() {
    return homeMenuCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<HomeMenuModel>> valuesListWithDetails() {
    return homeMenuCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return homeMenuCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => homeMenuCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('HomeMenu-$appID');

  final String appID;
  
  HomeMenuJsFirestore(this.appID) : homeMenuCollection = firestore().collection('HomeMenu-$appID');

  final CollectionReference homeMenuCollection;
}
