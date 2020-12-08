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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/font_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class FontFirestore implements FontRepository {
  Future<FontModel> add(FontModel value) {
    return FontCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(FontModel value) {
    return FontCollection.document(value.documentID).delete();
  }

  Future<FontModel> update(FontModel value) {
    return FontCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  FontModel _populateDoc(DocumentSnapshot value) {
    return FontModel.fromEntity(value.documentID, FontEntity.fromMap(value.data));
  }

  Future<FontModel> _populateDocPlus(DocumentSnapshot value) async {
    return FontModel.fromEntityPlus(value.documentID, FontEntity.fromMap(value.data), appId: appId);  }

  Future<FontModel> get(String id) {
    return FontCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<FontModel>> listen(FontModelTrigger trigger, { String orderBy, bool descending }) {
    var stream = (orderBy == null ?  FontCollection : FontCollection.orderBy(orderBy, descending: descending)).snapshots()
        .map((data) {
      Iterable<FontModel> fonts  = data.documents.map((doc) {
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
    Stream<List<FontModel>> stream = FontCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }


  Stream<List<FontModel>> values() {
    return FontCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<FontModel>> valuesWithDetails() {
    return FontCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<FontModel>> valuesList() async {
    return await FontCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<FontModel>> valuesListWithDetails() async {
    return await FontCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return FontCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference FontCollection;

  FontFirestore(this.appId) : FontCollection = Firestore.instance.collection('Font-${appId}');
}

