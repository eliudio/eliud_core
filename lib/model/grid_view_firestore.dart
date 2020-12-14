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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/grid_view_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class GridViewFirestore implements GridViewRepository {
  Future<GridViewModel> add(GridViewModel value) {
    return GridViewCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(GridViewModel value) {
    return GridViewCollection.document(value.documentID).delete();
  }

  Future<GridViewModel> update(GridViewModel value) {
    return GridViewCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  GridViewModel _populateDoc(DocumentSnapshot value) {
    return GridViewModel.fromEntity(value.documentID, GridViewEntity.fromMap(value.data));
  }

  Future<GridViewModel> _populateDocPlus(DocumentSnapshot value) async {
    return GridViewModel.fromEntityPlus(value.documentID, GridViewEntity.fromMap(value.data), appId: appId);  }

  Future<GridViewModel> get(String id) {
    return GridViewCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<GridViewModel>> listen(GridViewModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<GridViewModel>> stream;
    if (orderBy == null) {
       stream = GridViewCollection.snapshots().map((data) {
        Iterable<GridViewModel> gridViews  = data.documents.map((doc) {
          GridViewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return gridViews;
      });
    } else {
      stream = GridViewCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<GridViewModel> gridViews  = data.documents.map((doc) {
          GridViewModel value = _populateDoc(doc);
          return value;
        }).toList();
        return gridViews;
      });
  
    }
    return stream.listen((listOfGridViewModels) {
      trigger(listOfGridViewModels);
    });
  }

  StreamSubscription<List<GridViewModel>> listenWithDetails(GridViewModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<GridViewModel>> stream;
    if (orderBy == null) {
      stream = GridViewCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = GridViewCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfGridViewModels) {
      trigger(listOfGridViewModels);
    });
  }


  Stream<List<GridViewModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return GridViewCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return GridViewCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<GridViewModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return GridViewCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return GridViewCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<GridViewModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await GridViewCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await GridViewCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<GridViewModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await GridViewCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await GridViewCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return GridViewCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference GridViewCollection;

  GridViewFirestore(this.appId) : GridViewCollection = Firestore.instance.collection('GridView-${appId}');
}

