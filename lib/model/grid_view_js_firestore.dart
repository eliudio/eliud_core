/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'grid_view_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class GridViewJsFirestore implements GridViewRepository {
  Future<GridViewModel> add(GridViewModel value) {
    return gridViewCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(GridViewModel value) {
    return gridViewCollection.doc(value.documentID).delete();
  }

  Future<GridViewModel> update(GridViewModel value) {
    return gridViewCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  GridViewModel _populateDoc(DocumentSnapshot doc) {
    return GridViewModel.fromEntity(doc.id, GridViewEntity.fromMap(doc.data()));
  }

  Future<GridViewModel> _populateDocPlus(DocumentSnapshot doc) async {
    return GridViewModel.fromEntityPlus(doc.id, GridViewEntity.fromMap(doc.data()));
  }

  Future<GridViewModel> get(String id) {
    return gridViewCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<GridViewModel>> listen(GridViewModelTrigger trigger) {
    // If we use gridViewCollection here, then the second subscription fails
    Stream<List<GridViewModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<GridViewModel> gridViews  = data.docs.map((doc) {
        GridViewModel value = _populateDoc(doc);
        return value;
      }).toList();
      return gridViews;
    });

    return stream.listen((listOfGridViewModels) {
      trigger(listOfGridViewModels);
    });
  }

  StreamSubscription<List<GridViewModel>> listenWithDetails(GridViewModelTrigger trigger) {
    // If we use gridViewCollection here, then the second subscription fails
    Stream<List<GridViewModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfGridViewModels) {
      trigger(listOfGridViewModels);
    });
  }

  Stream<List<GridViewModel>> values() {
    return gridViewCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<GridViewModel>> valuesWithDetails() {
    return gridViewCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<GridViewModel>> valuesList() {
    return gridViewCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<GridViewModel>> valuesListWithDetails() {
    return gridViewCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return gridViewCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => gridViewCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('GridView-$appID');

  final String appID;
  
  GridViewJsFirestore(this.appID) : gridViewCollection = firestore().collection('GridView-$appID');

  final CollectionReference gridViewCollection;
}
