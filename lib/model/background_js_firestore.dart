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


class BackgroundJsFirestore implements BackgroundRepository {
  Future<BackgroundModel> add(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID).delete();
  }

  Future<BackgroundModel> update(BackgroundModel value) {
    return backgroundCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  BackgroundModel _populateDoc(DocumentSnapshot doc) {
    return BackgroundModel.fromEntity(doc.id, BackgroundEntity.fromMap(doc.data()));
  }

  Future<BackgroundModel> _populateDocPlus(DocumentSnapshot doc) async {
    return BackgroundModel.fromEntityPlus(doc.id, BackgroundEntity.fromMap(doc.data()));
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

  StreamSubscription<List<BackgroundModel>> listen(BackgroundModelTrigger trigger) {
    // If we use backgroundCollection here, then the second subscription fails
    Stream<List<BackgroundModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<BackgroundModel> backgrounds  = data.docs.map((doc) {
        BackgroundModel value = _populateDoc(doc);
        return value;
      }).toList();
      return backgrounds;
    });

    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }

  StreamSubscription<List<BackgroundModel>> listenWithDetails(BackgroundModelTrigger trigger) {
    // If we use backgroundCollection here, then the second subscription fails
    Stream<List<BackgroundModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfBackgroundModels) {
      trigger(listOfBackgroundModels);
    });
  }

  Stream<List<BackgroundModel>> values() {
    return backgroundCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<BackgroundModel>> valuesWithDetails() {
    return backgroundCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<BackgroundModel>> valuesList() {
    return backgroundCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<BackgroundModel>> valuesListWithDetails() {
    return backgroundCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return backgroundCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => backgroundCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Background-$appID');

  final String appID;
  
  BackgroundJsFirestore(this.appID) : backgroundCollection = firestore().collection('Background-$appID');

  final CollectionReference backgroundCollection;
}
