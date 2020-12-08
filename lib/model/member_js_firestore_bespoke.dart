/*
Bespoke
*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/model/member_repository_bespoke.dart';
import 'package:eliud_core/model/model_export.dart';
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

  @override
  StreamSubscription<List<MemberModel>> listen(String currentMember, MemberModelTrigger trigger, { String orderBy, bool descending }) {
    // If we use memberCollection here, then the second subscription fails
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).where("readAccess", 'array-contains', currentMember).onSnapshot
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

  StreamSubscription<List<MemberModel>> listenWithDetails(String currentMember, MemberModelTrigger trigger) {
    // If we use memberCollection here, then the second subscription fails
    Stream<List<MemberModel>> stream = getCollection().where("readAccess", "array-contains", currentMember).onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  Stream<List<MemberModel>> values(String currentMember) {
    return memberCollection.where("readAccess", "array-contains", currentMember).onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<MemberModel>> valuesWithDetails(String currentMember) {
    return memberCollection.where("readAccess", "array-contains", currentMember).onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<MemberModel>> valuesList(String currentMember,) {
    return memberCollection.where("readAccess", "array-contains", currentMember).get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<MemberModel>> valuesListWithDetails(String currentMember,) {
    return memberCollection.where("readAccess", "array-contains", currentMember).get().then((value) {
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
