/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/menu_def_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class MenuDefJsFirestore implements MenuDefRepository {
  Future<MenuDefModel> add(MenuDefModel value) {
    return menuDefCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(MenuDefModel value) {
    return menuDefCollection.doc(value.documentID).delete();
  }

  Future<MenuDefModel> update(MenuDefModel value) {
    return menuDefCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  MenuDefModel _populateDoc(DocumentSnapshot value) {
    return MenuDefModel.fromEntity(value.id, MenuDefEntity.fromMap(value.data()));
  }

  Future<MenuDefModel> _populateDocPlus(DocumentSnapshot value) async {
    return MenuDefModel.fromEntityPlus(value.id, MenuDefEntity.fromMap(value.data()), appId: appId);
  }

  Future<MenuDefModel> get(String id) {
    return menuDefCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<MenuDefModel>> listen(MenuDefModelTrigger trigger, {String orderBy, bool descending }) {
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
        .map((data) {
      Iterable<MenuDefModel> menuDefs  = data.docs.map((doc) {
        MenuDefModel value = _populateDoc(doc);
        return value;
      }).toList();
      return menuDefs;
    });

    return stream.listen((listOfMenuDefModels) {
      trigger(listOfMenuDefModels);
    });
  }

  StreamSubscription<List<MenuDefModel>> listenWithDetails(MenuDefModelTrigger trigger) {
    // If we use menuDefCollection here, then the second subscription fails
    Stream<List<MenuDefModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMenuDefModels) {
      trigger(listOfMenuDefModels);
    });
  }

  Stream<List<MenuDefModel>> values() {
    return menuDefCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<MenuDefModel>> valuesWithDetails() {
    return menuDefCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<MenuDefModel>> valuesList() {
    return menuDefCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<MenuDefModel>> valuesListWithDetails() {
    return menuDefCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return menuDefCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => menuDefCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('MenuDef-$appId');

  final String appId;
  
  MenuDefJsFirestore(this.appId) : menuDefCollection = firestore().collection('MenuDef-$appId');

  final CollectionReference menuDefCollection;
}
