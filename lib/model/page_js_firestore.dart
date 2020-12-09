/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/page_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class PageJsFirestore implements PageRepository {
  Future<PageModel> add(PageModel value) {
    return pageCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(PageModel value) {
    return pageCollection.doc(value.documentID).delete();
  }

  Future<PageModel> update(PageModel value) {
    return pageCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  PageModel _populateDoc(DocumentSnapshot value) {
    return PageModel.fromEntity(value.id, PageEntity.fromMap(value.data()));
  }

  Future<PageModel> _populateDocPlus(DocumentSnapshot value) async {
    return PageModel.fromEntityPlus(value.id, PageEntity.fromMap(value.data()), appId: appId);
  }

  Future<PageModel> get(String id) {
    return pageCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<PageModel>> listen(PageModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<PageModel> pages  = data.docs.map((doc) {
          PageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return pages;
      });
    } else {
      stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
          .map((data) {
        Iterable<PageModel> pages  = data.docs.map((doc) {
          PageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return pages;
      });
    }
    return stream.listen((listOfPageModels) {
      trigger(listOfPageModels);
    });
  }

  StreamSubscription<List<PageModel>> listenWithDetails(PageModelTrigger trigger) {
    // If we use pageCollection here, then the second subscription fails
    Stream<List<PageModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPageModels) {
      trigger(listOfPageModels);
    });
  }

  Stream<List<PageModel>> values() {
    return pageCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<PageModel>> valuesWithDetails() {
    return pageCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<PageModel>> valuesList() {
    return pageCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<PageModel>> valuesListWithDetails() {
    return pageCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return pageCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => pageCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Page-$appId');

  final String appId;
  
  PageJsFirestore(this.appId) : pageCollection = firestore().collection('Page-$appId');

  final CollectionReference pageCollection;
}
