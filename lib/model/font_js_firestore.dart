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
import 'package:eliud_core/model/font_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class FontJsFirestore implements FontRepository {
  Future<FontModel> add(FontModel value) {
    return fontCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(FontModel value) {
    return fontCollection.doc(value.documentID).delete();
  }

  Future<FontModel> update(FontModel value) {
    return fontCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  FontModel _populateDoc(DocumentSnapshot value) {
    return FontModel.fromEntity(value.id, FontEntity.fromMap(value.data()));
  }

  Future<FontModel> _populateDocPlus(DocumentSnapshot value) async {
    return FontModel.fromEntityPlus(value.id, FontEntity.fromMap(value.data()), appId: appId);
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

  @override
  StreamSubscription<List<FontModel>> listen(FontModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<FontModel> fonts  = data.docs.map((doc) {
          FontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return fonts;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<FontModel> fonts  = data.docs.map((doc) {
          FontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return fonts;
      });
    }
    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }

  StreamSubscription<List<FontModel>> listenWithDetails(FontModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use fontCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use fontCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }

  Stream<List<FontModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return fontCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return fontCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<FontModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return fontCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return fontCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<FontModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return fontCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return fontCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<FontModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return fontCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return fontCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return fontCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => fontCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Font-$appId');

  final String appId;
  
  FontJsFirestore(this.appId) : fontCollection = firestore().collection('Font-$appId');

  final CollectionReference fontCollection;
}
