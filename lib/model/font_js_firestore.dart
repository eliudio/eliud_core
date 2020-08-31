/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'font_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class FontJsFirestore implements FontRepository {
  Future<FontModel> add(FontModel value) {
    return fontCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(FontModel value) {
    return fontCollection.doc(value.documentID).delete();
  }

  Future<FontModel> update(FontModel value) {
    return fontCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  FontModel _populateDoc(DocumentSnapshot doc) {
    return FontModel.fromEntity(doc.id, FontEntity.fromMap(doc.data()));
  }

  Future<FontModel> _populateDocPlus(DocumentSnapshot doc) async {
    return FontModel.fromEntityPlus(doc.id, FontEntity.fromMap(doc.data()));
  }

  Future<FontModel> get(String id) {
    return fontCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<FontModel>> listen(FontModelTrigger trigger) {
    // If we use fontCollection here, then the second subscription fails
    Stream<List<FontModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<FontModel> fonts  = data.docs.map((doc) {
        FontModel value = _populateDoc(doc);
        return value;
      }).toList();
      return fonts;
    });

    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }

  StreamSubscription<List<FontModel>> listenWithDetails(FontModelTrigger trigger) {
    // If we use fontCollection here, then the second subscription fails
    Stream<List<FontModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }

  Stream<List<FontModel>> values() {
    return fontCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<FontModel>> valuesWithDetails() {
    return fontCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<FontModel>> valuesList() {
    return fontCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<FontModel>> valuesListWithDetails() {
    return fontCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return fontCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => fontCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Font-$appID');

  final String appID;
  
  FontJsFirestore(this.appID) : fontCollection = firestore().collection('Font-$appID');

  final CollectionReference fontCollection;
}
