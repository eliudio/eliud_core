/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_firestore.dart
                       
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


class AppBarJsFirestore implements AppBarRepository {
  Future<AppBarModel> add(AppBarModel value) {
    return appBarCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(AppBarModel value) {
    return appBarCollection.doc(value.documentID).delete();
  }

  Future<AppBarModel> update(AppBarModel value) {
    return appBarCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  AppBarModel _populateDoc(DocumentSnapshot doc) {
    return AppBarModel.fromEntity(doc.id, AppBarEntity.fromMap(doc.data()));
  }

  Future<AppBarModel> _populateDocPlus(DocumentSnapshot doc) async {
    return AppBarModel.fromEntityPlus(doc.id, AppBarEntity.fromMap(doc.data()));
  }

  Future<AppBarModel> get(String id) {
    return appBarCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<AppBarModel>> listen(AppBarModelTrigger trigger) {
    // If we use appBarCollection here, then the second subscription fails
    Stream<List<AppBarModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<AppBarModel> appBars  = data.docs.map((doc) {
        AppBarModel value = _populateDoc(doc);
        return value;
      }).toList();
      return appBars;
    });

    return stream.listen((listOfAppBarModels) {
      trigger(listOfAppBarModels);
    });
  }

  StreamSubscription<List<AppBarModel>> listenWithDetails(AppBarModelTrigger trigger) {
    // If we use appBarCollection here, then the second subscription fails
    Stream<List<AppBarModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfAppBarModels) {
      trigger(listOfAppBarModels);
    });
  }

  Stream<List<AppBarModel>> values() {
    return appBarCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<AppBarModel>> valuesWithDetails() {
    return appBarCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<AppBarModel>> valuesList() {
    return appBarCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<AppBarModel>> valuesListWithDetails() {
    return appBarCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return appBarCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => appBarCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('AppBar-$appID');

  final String appID;
  
  AppBarJsFirestore(this.appID) : appBarCollection = firestore().collection('AppBar-$appID');

  final CollectionReference appBarCollection;
}
