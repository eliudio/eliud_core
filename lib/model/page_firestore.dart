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
import 'package:cloud_firestore/cloud_firestore.dart';

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


class PageFirestore implements PageRepository {
  Future<PageModel> add(PageModel value) {
    return PageCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(PageModel value) {
    return PageCollection.document(value.documentID).delete();
  }

  Future<PageModel> update(PageModel value) {
    return PageCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  PageModel _populateDoc(DocumentSnapshot doc) {
    return PageModel.fromEntity(doc.documentID, PageEntity.fromMap(doc.data));
  }

  Future<PageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PageModel.fromEntityPlus(doc.documentID, PageEntity.fromMap(doc.data));  }

  Future<PageModel> get(String id) {
    return PageCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PageModel>> listen(PageModelTrigger trigger) {
    Stream<List<PageModel>> stream = PageCollection.snapshots()
        .map((data) {
      Iterable<PageModel> pages  = data.documents.map((doc) {
        PageModel value = _populateDoc(doc);
        return value;
      }).toList();
      return pages;
    });

    return stream.listen((listOfPageModels) {
      trigger(listOfPageModels);
    });
  }

  StreamSubscription<List<PageModel>> listenWithDetails(PageModelTrigger trigger) {
    Stream<List<PageModel>> stream = PageCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPageModels) {
      trigger(listOfPageModels);
    });
  }


  Stream<List<PageModel>> values() {
    return PageCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<PageModel>> valuesWithDetails() {
    return PageCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<PageModel>> valuesList() async {
    return await PageCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<PageModel>> valuesListWithDetails() async {
    return await PageCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return PageCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference PageCollection;

  PageFirestore(this.appID) : PageCollection = Firestore.instance.collection('Page-${appID}');
}

