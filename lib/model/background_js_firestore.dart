/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/background_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class BackgroundJsFirestore implements BackgroundRepository {
  Future<BackgroundModel> add(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID).delete();
  }

  Future<BackgroundModel> update(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  BackgroundModel _populateDoc(DocumentSnapshot value) {
    return BackgroundModel.fromEntity(value.id, BackgroundEntity.fromMap(value.data()));
  }

  Future<BackgroundModel> _populateDocPlus(DocumentSnapshot value) async {
    return BackgroundModel.fromEntityPlus(value.id, BackgroundEntity.fromMap(value.data()), appId: appId);
  }

  Future<BackgroundModel> get(String id) {
    return backgroundCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<BackgroundModel> backgrounds  = data.docs.map((doc) {
          BackgroundModel value = _populateDoc(doc);
          return value;
        }).toList();
        return backgrounds;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<BackgroundModel> backgrounds  = data.docs.map((doc) {
          BackgroundModel value = _populateDoc(doc);
          return value;
        }).toList();
        return backgrounds;
      });
    }
    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }

  StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use backgroundCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use backgroundCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }

  Stream<List<BackgroundModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return backgroundCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return backgroundCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<BackgroundModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return backgroundCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return backgroundCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<BackgroundModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return backgroundCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return backgroundCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<BackgroundModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return backgroundCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return backgroundCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return backgroundCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => backgroundCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Background-$appId');

  final String appId;
  
  BackgroundJsFirestore(this.appId) : backgroundCollection = firestore().collection('Background-$appId');

  final CollectionReference backgroundCollection;
}
