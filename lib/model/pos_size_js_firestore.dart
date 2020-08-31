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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/pos_size_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class PosSizeJsFirestore implements PosSizeRepository {
  Future<PosSizeModel> add(PosSizeModel value) {
    return posSizeCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(PosSizeModel value) {
    return posSizeCollection.doc(value.documentID).delete();
  }

  Future<PosSizeModel> update(PosSizeModel value) {
    return posSizeCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  PosSizeModel _populateDoc(DocumentSnapshot doc) {
    return PosSizeModel.fromEntity(doc.id, PosSizeEntity.fromMap(doc.data()));
  }

  Future<PosSizeModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PosSizeModel.fromEntityPlus(doc.id, PosSizeEntity.fromMap(doc.data()));
  }

  Future<PosSizeModel> get(String id) {
    return posSizeCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<PosSizeModel>> listen(PosSizeModelTrigger trigger) {
    // If we use posSizeCollection here, then the second subscription fails
    Stream<List<PosSizeModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<PosSizeModel> posSizes  = data.docs.map((doc) {
        PosSizeModel value = _populateDoc(doc);
        return value;
      }).toList();
      return posSizes;
    });

    return stream.listen((listOfPosSizeModels) {
      trigger(listOfPosSizeModels);
    });
  }

  StreamSubscription<List<PosSizeModel>> listenWithDetails(PosSizeModelTrigger trigger) {
    // If we use posSizeCollection here, then the second subscription fails
    Stream<List<PosSizeModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPosSizeModels) {
      trigger(listOfPosSizeModels);
    });
  }

  Stream<List<PosSizeModel>> values() {
    return posSizeCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<PosSizeModel>> valuesWithDetails() {
    return posSizeCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<PosSizeModel>> valuesList() {
    return posSizeCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<PosSizeModel>> valuesListWithDetails() {
    return posSizeCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return posSizeCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => posSizeCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('PosSize-$appID');

  final String appID;
  
  PosSizeJsFirestore(this.appID) : posSizeCollection = firestore().collection('PosSize-$appID');

  final CollectionReference posSizeCollection;
}
