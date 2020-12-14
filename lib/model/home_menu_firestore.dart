/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/home_menu_repository.dart';

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

class HomeMenuFirestore implements HomeMenuRepository {
  Future<HomeMenuModel> add(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).delete();
  }

  Future<HomeMenuModel> update(HomeMenuModel value) {
    return HomeMenuCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  HomeMenuModel _populateDoc(DocumentSnapshot value) {
    return HomeMenuModel.fromEntity(value.documentID, HomeMenuEntity.fromMap(value.data));
  }

  Future<HomeMenuModel> _populateDocPlus(DocumentSnapshot value) async {
    return HomeMenuModel.fromEntityPlus(value.documentID, HomeMenuEntity.fromMap(value.data), appId: appId);  }

  Future<HomeMenuModel> get(String id) {
    return HomeMenuCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<HomeMenuModel>> listen(HomeMenuModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<HomeMenuModel>> stream;
    if (orderBy == null) {
       stream = HomeMenuCollection.snapshots().map((data) {
        Iterable<HomeMenuModel> homeMenus  = data.documents.map((doc) {
          HomeMenuModel value = _populateDoc(doc);
          return value;
        }).toList();
        return homeMenus;
      });
    } else {
      stream = HomeMenuCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<HomeMenuModel> homeMenus  = data.documents.map((doc) {
          HomeMenuModel value = _populateDoc(doc);
          return value;
        }).toList();
        return homeMenus;
      });
  
    }
    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }

  StreamSubscription<List<HomeMenuModel>> listenWithDetails(HomeMenuModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<HomeMenuModel>> stream;
    if (orderBy == null) {
      stream = HomeMenuCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = HomeMenuCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfHomeMenuModels) {
      trigger(listOfHomeMenuModels);
    });
  }


  Stream<List<HomeMenuModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<HomeMenuModel>> _values = getQuery(HomeMenuCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<HomeMenuModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<HomeMenuModel>> _values = getQuery(HomeMenuCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<HomeMenuModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<HomeMenuModel> _values = await getQuery(HomeMenuCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<HomeMenuModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<HomeMenuModel> _values = await getQuery(HomeMenuCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
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
    return HomeMenuCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference HomeMenuCollection;

  HomeMenuFirestore(this.appId) : HomeMenuCollection = Firestore.instance.collection('HomeMenu-${appId}');
}

