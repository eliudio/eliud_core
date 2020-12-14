/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/pos_size_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class PosSizeFirestore implements PosSizeRepository {
  Future<PosSizeModel> add(PosSizeModel value) {
    return PosSizeCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PosSizeModel value) {
    return PosSizeCollection.document(value.documentID).delete();
  }

  Future<PosSizeModel> update(PosSizeModel value) {
    return PosSizeCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PosSizeModel _populateDoc(DocumentSnapshot value) {
    return PosSizeModel.fromEntity(value.documentID, PosSizeEntity.fromMap(value.data));
  }

  Future<PosSizeModel> _populateDocPlus(DocumentSnapshot value) async {
    return PosSizeModel.fromEntityPlus(value.documentID, PosSizeEntity.fromMap(value.data), appId: appId);  }

  Future<PosSizeModel> get(String id) {
    return PosSizeCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PosSizeModel>> listen(PosSizeModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<PosSizeModel>> stream;
    if (orderBy == null) {
       stream = PosSizeCollection.snapshots().map((data) {
        Iterable<PosSizeModel> posSizes  = data.documents.map((doc) {
          PosSizeModel value = _populateDoc(doc);
          return value;
        }).toList();
        return posSizes;
      });
    } else {
      stream = PosSizeCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<PosSizeModel> posSizes  = data.documents.map((doc) {
          PosSizeModel value = _populateDoc(doc);
          return value;
        }).toList();
        return posSizes;
      });
  
    }
    return stream.listen((listOfPosSizeModels) {
      trigger(listOfPosSizeModels);
    });
  }

  StreamSubscription<List<PosSizeModel>> listenWithDetails(PosSizeModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<PosSizeModel>> stream;
    if (orderBy == null) {
      stream = PosSizeCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = PosSizeCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfPosSizeModels) {
      trigger(listOfPosSizeModels);
    });
  }


  Stream<List<PosSizeModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return PosSizeCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return PosSizeCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<PosSizeModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return PosSizeCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return PosSizeCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<PosSizeModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await PosSizeCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await PosSizeCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<PosSizeModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await PosSizeCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await PosSizeCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return PosSizeCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference PosSizeCollection;

  PosSizeFirestore(this.appId) : PosSizeCollection = Firestore.instance.collection('PosSize-${appId}');
}

