/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';


// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


class DrawerJsFirestore implements DrawerRepository {
  Future<DrawerModel> add(DrawerModel value) {
    return drawerCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(DrawerModel value) {
    return drawerCollection.doc(value.documentID).delete();
  }

  Future<DrawerModel> update(DrawerModel value) {
    return drawerCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  DrawerModel _populateDoc(DocumentSnapshot doc) {
    return DrawerModel.fromEntity(doc.id, DrawerEntity.fromMap(doc.data()));
  }

  Future<DrawerModel> _populateDocPlus(DocumentSnapshot doc) async {
    return DrawerModel.fromEntityPlus(doc.id, DrawerEntity.fromMap(doc.data()));
  }

  Future<DrawerModel> get(String id) {
    return drawerCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<DrawerModel>> listen(DrawerModelTrigger trigger) {
    // If we use drawerCollection here, then the second subscription fails
    Stream<List<DrawerModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<DrawerModel> drawers  = data.docs.map((doc) {
        DrawerModel value = _populateDoc(doc);
        return value;
      }).toList();
      return drawers;
    });

    return stream.listen((listOfDrawerModels) {
      trigger(listOfDrawerModels);
    });
  }

  StreamSubscription<List<DrawerModel>> listenWithDetails(DrawerModelTrigger trigger) {
    // If we use drawerCollection here, then the second subscription fails
    Stream<List<DrawerModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDrawerModels) {
      trigger(listOfDrawerModels);
    });
  }

  Stream<List<DrawerModel>> values() {
    return drawerCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<DrawerModel>> valuesWithDetails() {
    return drawerCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<DrawerModel>> valuesList() {
    return drawerCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<DrawerModel>> valuesListWithDetails() {
    return drawerCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return drawerCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => drawerCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Drawer-$appID');

  final String appID;
  
  DrawerJsFirestore(this.appID) : drawerCollection = firestore().collection('Drawer-$appID');

  final CollectionReference drawerCollection;
}
