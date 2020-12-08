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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/menu_def_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class MenuDefFirestore implements MenuDefRepository {
  Future<MenuDefModel> add(MenuDefModel value) {
    return MenuDefCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(MenuDefModel value) {
    return MenuDefCollection.document(value.documentID).delete();
  }

  Future<MenuDefModel> update(MenuDefModel value) {
    return MenuDefCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  MenuDefModel _populateDoc(DocumentSnapshot value) {
    return MenuDefModel.fromEntity(value.documentID, MenuDefEntity.fromMap(value.data));
  }

  Future<MenuDefModel> _populateDocPlus(DocumentSnapshot value) async {
    return MenuDefModel.fromEntityPlus(value.documentID, MenuDefEntity.fromMap(value.data), appId: appId);  }

  Future<MenuDefModel> get(String id) {
    return MenuDefCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<MenuDefModel>> listen(MenuDefModelTrigger trigger, { String orderBy, bool descending }) {
    var stream = (orderBy == null ?  MenuDefCollection : MenuDefCollection.orderBy(orderBy, descending: descending)).snapshots()
        .map((data) {
      Iterable<MenuDefModel> menuDefs  = data.documents.map((doc) {
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
    Stream<List<MenuDefModel>> stream = MenuDefCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMenuDefModels) {
      trigger(listOfMenuDefModels);
    });
  }


  Stream<List<MenuDefModel>> values() {
    return MenuDefCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<MenuDefModel>> valuesWithDetails() {
    return MenuDefCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<MenuDefModel>> valuesList() async {
    return await MenuDefCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<MenuDefModel>> valuesListWithDetails() async {
    return await MenuDefCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return MenuDefCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference MenuDefCollection;

  MenuDefFirestore(this.appId) : MenuDefCollection = Firestore.instance.collection('MenuDef-${appId}');
}

