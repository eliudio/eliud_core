/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/shadow_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class ShadowJsFirestore implements ShadowRepository {
  Future<ShadowModel> add(ShadowModel value) {
    return shadowCollection.doc(value.documentID)
        .set(value.toEntity(appID).toDocument())
        .then((_) => value);
  }

  Future<void> delete(ShadowModel value) {
    return shadowCollection.doc(value.documentID).delete();
  }

  Future<ShadowModel> update(ShadowModel value) {
    return shadowCollection.doc(value.documentID)
        .update(data: value.toEntity(appID).toDocument())
        .then((_) => value);
  }

  ShadowModel _populateDoc(DocumentSnapshot doc) {
    return ShadowModel.fromEntity(doc.id, ShadowEntity.fromMap(doc.data()));
  }

  Future<ShadowModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ShadowModel.fromEntityPlus(doc.id, ShadowEntity.fromMap(doc.data()));
  }

  Future<ShadowModel> get(String id) {
    return shadowCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<ShadowModel>> listen(ShadowModelTrigger trigger) {
    // If we use shadowCollection here, then the second subscription fails
    Stream<List<ShadowModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<ShadowModel> shadows  = data.docs.map((doc) {
        ShadowModel value = _populateDoc(doc);
        return value;
      }).toList();
      return shadows;
    });

    return stream.listen((listOfShadowModels) {
      trigger(listOfShadowModels);
    });
  }

  StreamSubscription<List<ShadowModel>> listenWithDetails(ShadowModelTrigger trigger) {
    // If we use shadowCollection here, then the second subscription fails
    Stream<List<ShadowModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfShadowModels) {
      trigger(listOfShadowModels);
    });
  }

  Stream<List<ShadowModel>> values() {
    return shadowCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<ShadowModel>> valuesWithDetails() {
    return shadowCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<ShadowModel>> valuesList() {
    return shadowCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ShadowModel>> valuesListWithDetails() {
    return shadowCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return shadowCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => shadowCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Shadow-$appID');

  final String appID;
  
  ShadowJsFirestore(this.appID) : shadowCollection = firestore().collection('Shadow-$appID');

  final CollectionReference shadowCollection;
}
