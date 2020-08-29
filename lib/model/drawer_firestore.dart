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
import 'package:cloud_firestore/cloud_firestore.dart';

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


class DrawerFirestore implements DrawerRepository {
  Future<DrawerModel> add(DrawerModel value) {
    return DrawerCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(DrawerModel value) {
    return DrawerCollection.document(value.documentID).delete();
  }

  Future<DrawerModel> update(DrawerModel value) {
    return DrawerCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  DrawerModel _populateDoc(DocumentSnapshot doc) {
    return DrawerModel.fromEntity(doc.documentID, DrawerEntity.fromMap(doc.data));
  }

  Future<DrawerModel> _populateDocPlus(DocumentSnapshot doc) async {
    return DrawerModel.fromEntityPlus(doc.documentID, DrawerEntity.fromMap(doc.data));  }

  Future<DrawerModel> get(String id) {
    return DrawerCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<DrawerModel>> listen(DrawerModelTrigger trigger) {
    Stream<List<DrawerModel>> stream = DrawerCollection.snapshots()
        .map((data) {
      Iterable<DrawerModel> drawers  = data.documents.map((doc) {
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
    Stream<List<DrawerModel>> stream = DrawerCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDrawerModels) {
      trigger(listOfDrawerModels);
    });
  }


  Stream<List<DrawerModel>> values() {
    return DrawerCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<DrawerModel>> valuesWithDetails() {
    return DrawerCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<DrawerModel>> valuesList() async {
    return await DrawerCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<DrawerModel>> valuesListWithDetails() async {
    return await DrawerCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return DrawerCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference DrawerCollection;

  DrawerFirestore(this.appID) : DrawerCollection = Firestore.instance.collection('Drawer-${appID}');
}

