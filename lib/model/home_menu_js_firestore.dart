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
import 'package:eliud_core/model/home_menu_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class HomeMenuJsFirestore implements HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID).delete();
  }

  Future<HomeMenuModel> update(HomeMenuModel value) {
    return homeMenuCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  HomeMenuModel _populateDoc(DocumentSnapshot value) {
    return HomeMenuModel.fromEntity(value.id, HomeMenuEntity.fromMap(value.data()));
  }

  Future<HomeMenuModel> _populateDocPlus(DocumentSnapshot value) async {
    return HomeMenuModel.fromEntityPlus(value.id, HomeMenuEntity.fromMap(value.data()), appId: appId);
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

  @override
  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<HomeMenuModel> homeMenus  = data.docs.map((doc) {
          HomeMenuModel value = _populateDoc(doc);
          return value;
        }).toList();
        return homeMenus;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<HomeMenuModel> homeMenus  = data.docs.map((doc) {
          HomeMenuModel value = _populateDoc(doc);
          return value;
        }).toList();
        return homeMenus;
      });
    }
    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }

  StreamSubscription<List<HomeMenuModel>> listenWithDetails(HomeMenuModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use homeMenuCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use homeMenuCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }

  Stream<List<HomeMenuModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return homeMenuCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return homeMenuCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<HomeMenuModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return homeMenuCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return homeMenuCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<HomeMenuModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return homeMenuCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return homeMenuCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<HomeMenuModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return homeMenuCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return homeMenuCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return homeMenuCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => homeMenuCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('HomeMenu-$appId');

  final String appId;
  
  HomeMenuJsFirestore(this.appId) : homeMenuCollection = firestore().collection('HomeMenu-$appId');

  final CollectionReference homeMenuCollection;
}
