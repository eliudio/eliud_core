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

import 'package:eliud_core/model/font_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

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

  StreamSubscription<List<FontModel>> listen(FontModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    Stream<List<FontModel>> stream;
    if (orderBy == null) {
       stream = FontCollection.snapshots().map((data) {
        Iterable<FontModel> fonts  = data.documents.map((doc) {
          FontModel value = _populateDoc(doc);
          return value;
        }).toList();
        return fonts;
      });
    } else {
      stream = FontCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<FontModel> fonts  = data.documents.map((doc) {
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

  StreamSubscription<List<FontModel>> listenWithDetails(FontModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    Stream<List<FontModel>> stream;
    if (orderBy == null) {
      stream = FontCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = FontCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfFontModels) {
      trigger(listOfFontModels);
    });
  }


  Stream<List<FontModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<FontModel>> _values = getQuery(FontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<FontModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<FontModel>> _values = getQuery(FontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<FontModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<FontModel> _values = await getQuery(FontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<FontModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<FontModel> _values = await getQuery(FontCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, readCondition: readCondition, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return FontCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference FontCollection;

  FontFirestore(this.appId) : FontCollection = Firestore.instance.collection('Font-${appId}');
}

