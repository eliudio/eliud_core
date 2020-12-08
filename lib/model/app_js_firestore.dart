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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/app_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class AppJsFirestore implements AppRepository {
  Future<AppModel> add(AppModel value) {
    return appCollection.doc(value.documentID)
        .set(value.toEntity(appId: value.documentID).toDocument())
        .then((_) => value);
  }

  Future<void> delete(AppModel value) {
    return appCollection.doc(value.documentID).delete();
  }

  Future<AppModel> update(AppModel value) {
    return appCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: value.documentID).toDocument())
        .then((_) => value);
  }

  AppModel _populateDoc(DocumentSnapshot value) {
    return AppModel.fromEntity(value.id, AppEntity.fromMap(value.data()));
  }

  Future<AppModel> _populateDocPlus(DocumentSnapshot value) async {
    return AppModel.fromEntityPlus(value.id, AppEntity.fromMap(value.data()), appId: value.id);
  }

  Future<AppModel> get(String id) {
    return appCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<AppModel>> listen(AppModelTrigger trigger, {String orderBy, bool descending }) {
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
        .map((data) {
      Iterable<AppModel> apps  = data.docs.map((doc) {
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
    // If we use appCollection here, then the second subscription fails
    Stream<List<AppModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppModels) {
      trigger(listOfAppModels);
    });
  }

  Stream<List<AppModel>> values() {
    return appCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<AppModel>> valuesWithDetails() {
    return appCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<AppModel>> valuesList() {
    return appCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<AppModel>> valuesListWithDetails() {
    return appCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return appCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => appCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('App');

  AppJsFirestore();

  final CollectionReference appCollection = firestore().collection('App');
}
