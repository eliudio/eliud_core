/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 country_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/country_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class CountryFirestore implements CountryRepository {
  Future<CountryModel> add(CountryModel value) {
    return CountryCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(CountryModel value) {
    return CountryCollection.document(value.documentID).delete();
  }

  Future<CountryModel> update(CountryModel value) {
    return CountryCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  CountryModel _populateDoc(DocumentSnapshot value) {
    return CountryModel.fromEntity(value.documentID, CountryEntity.fromMap(value.data));
  }

  Future<CountryModel> _populateDocPlus(DocumentSnapshot value) async {
    return CountryModel.fromEntityPlus(value.documentID, CountryEntity.fromMap(value.data), );  }

  Future<CountryModel> get(String id) {
    return CountryCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<CountryModel>> listen(CountryModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<CountryModel>> stream;
    if (orderBy == null) {
       stream = CountryCollection.snapshots().map((data) {
        Iterable<CountryModel> countrys  = data.documents.map((doc) {
          CountryModel value = _populateDoc(doc);
          return value;
        }).toList();
        return countrys;
      });
    } else {
      stream = CountryCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<CountryModel> countrys  = data.documents.map((doc) {
          CountryModel value = _populateDoc(doc);
          return value;
        }).toList();
        return countrys;
      });
  
    }
    return stream.listen((listOfCountryModels) {
      trigger(listOfCountryModels);
    });
  }

  StreamSubscription<List<CountryModel>> listenWithDetails(CountryModelTrigger trigger) {
    Stream<List<CountryModel>> stream = CountryCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfCountryModels) {
      trigger(listOfCountryModels);
    });
  }


  Stream<List<CountryModel>> values() {
    return CountryCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<CountryModel>> valuesWithDetails() {
    return CountryCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<CountryModel>> valuesList() async {
    return await CountryCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<CountryModel>> valuesListWithDetails() async {
    return await CountryCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return CountryCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  CountryFirestore();

  final CollectionReference CountryCollection = Firestore.instance.collection('Country');

}

