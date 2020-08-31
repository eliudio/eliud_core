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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/member_repository.dart';

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';


class MemberFirestore implements MemberRepository {
  Future<MemberModel> add(MemberModel value) {
    return MemberCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(MemberModel value) {
    return MemberCollection.document(value.documentID).delete();
  }

  Future<MemberModel> update(MemberModel value) {
    return MemberCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  MemberModel _populateDoc(DocumentSnapshot doc) {
    return MemberModel.fromEntity(doc.documentID, MemberEntity.fromMap(doc.data));
  }

  Future<MemberModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberModel.fromEntityPlus(doc.documentID, MemberEntity.fromMap(doc.data));  }

  Future<MemberModel> get(String id) {
    return MemberCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<MemberModel>> listen(MemberModelTrigger trigger) {
    Stream<List<MemberModel>> stream = MemberCollection.snapshots()
        .map((data) {
      Iterable<MemberModel> members  = data.documents.map((doc) {
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
    Stream<List<MemberModel>> stream = MemberCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }


  Stream<List<MemberModel>> values() {
    return MemberCollection.where("readAccess", arrayContains: GlobalData.memberID()).snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<MemberModel>> valuesWithDetails() {
    return MemberCollection.where("readAccess", arrayContains: GlobalData.memberID()).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<MemberModel>> valuesList() async {
    return await MemberCollection.where("readAccess", arrayContains: GlobalData.memberID()).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<MemberModel>> valuesListWithDetails() async {
    return await MemberCollection.where("readAccess", arrayContains: GlobalData.memberID()).getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return MemberCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  MemberFirestore();

  final CollectionReference MemberCollection = Firestore.instance.collection('Member');

}

