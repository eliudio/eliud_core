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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'country_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class CountryJsFirestore implements CountryRepository {
  Future<CountryModel> add(CountryModel value) {
    return countryCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(CountryModel value) {
    return countryCollection.doc(value.documentID).delete();
  }

  Future<CountryModel> update(CountryModel value) {
    return countryCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  CountryModel _populateDoc(DocumentSnapshot doc) {
    return CountryModel.fromEntity(doc.id, CountryEntity.fromMap(doc.data()));
  }

  Future<CountryModel> _populateDocPlus(DocumentSnapshot doc) async {
    return CountryModel.fromEntityPlus(doc.id, CountryEntity.fromMap(doc.data()));
  }

  Future<CountryModel> get(String id) {
    return countryCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<CountryModel>> listen(CountryModelTrigger trigger) {
    // If we use countryCollection here, then the second subscription fails
    Stream<List<CountryModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<CountryModel> countrys  = data.docs.map((doc) {
        CountryModel value = _populateDoc(doc);
        return value;
      }).toList();
      return countrys;
    });

    return stream.listen((listOfCountryModels) {
      trigger(listOfCountryModels);
    });
  }

  StreamSubscription<List<CountryModel>> listenWithDetails(CountryModelTrigger trigger) {
    // If we use countryCollection here, then the second subscription fails
    Stream<List<CountryModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfCountryModels) {
      trigger(listOfCountryModels);
    });
  }

  Stream<List<CountryModel>> values() {
    return countryCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<CountryModel>> valuesWithDetails() {
    return countryCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<CountryModel>> valuesList() {
    return countryCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<CountryModel>> valuesListWithDetails() {
    return countryCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return countryCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => countryCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Country');

  CountryJsFirestore();

  final CollectionReference countryCollection = firestore().collection('Country');
}
