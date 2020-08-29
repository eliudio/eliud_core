/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

import 'package:eliud_core/core/global_data.dart';

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


class MemberJsFirestore implements MemberRepository {
  Future<MemberModel> add(MemberModel value) {
    return memberCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(MemberModel value) {
    return memberCollection.doc(value.documentID).delete();
  }

  Future<MemberModel> update(MemberModel value) {
    return memberCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  MemberModel _populateDoc(DocumentSnapshot doc) {
    return MemberModel.fromEntity(doc.id, MemberEntity.fromMap(doc.data()));
  }

  Future<MemberModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberModel.fromEntityPlus(doc.id, MemberEntity.fromMap(doc.data()));
  }

  Future<MemberModel> get(String id) {
    return memberCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<MemberModel>> listen(MemberModelTrigger trigger) {
    // If we use memberCollection here, then the second subscription fails
    Stream<List<MemberModel>> stream = getCollection().where("readAccess", "array-contains", GlobalData.memberID()).onSnapshot
        .map((data) {
      Iterable<MemberModel> members  = data.docs.map((doc) {
        MemberModel value = _populateDoc(doc);
        return value;
      }).toList();
      return members;
    });

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  StreamSubscription<List<MemberModel>> listenWithDetails(MemberModelTrigger trigger) {
    // If we use memberCollection here, then the second subscription fails
    Stream<List<MemberModel>> stream = getCollection().where("readAccess", "array-contains", GlobalData.memberID()).onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  Stream<List<MemberModel>> values() {
    return memberCollection.where("readAccess", "array-contains", GlobalData.memberID()).onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<MemberModel>> valuesWithDetails() {
    return memberCollection.where("readAccess", "array-contains", GlobalData.memberID()).onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<MemberModel>> valuesList() {
    return memberCollection.where("readAccess", "array-contains", GlobalData.memberID()).get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<MemberModel>> valuesListWithDetails() {
    return memberCollection.where("readAccess", "array-contains", GlobalData.memberID()).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return memberCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => memberCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Member');

  MemberJsFirestore();

  final CollectionReference memberCollection = firestore().collection('Member');
}
