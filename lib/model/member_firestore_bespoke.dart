/*
Bespoke
*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/member_repository.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

class MemberFirestore implements MemberRepository {
  @override
  Future<MemberModel> add(MemberModel value) {
    return MemberCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(MemberModel value) {
    return MemberCollection.doc(value.documentID).delete();
  }

  @override
  Future<MemberModel> update(MemberModel value) {
    return MemberCollection.doc(value.documentID)
        .update(value.toEntity().toDocument())
        .then((_) => value);
  }

  MemberModel _populateDoc(DocumentSnapshot doc) {
    return MemberModel.fromEntity(
        doc.id, MemberEntity.fromMap(doc.data()));
  }

  Future<MemberModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberModel.fromEntityPlus(
        doc.id, MemberEntity.fromMap(doc.data()));
  }

  @override
  Future<MemberModel> get(String id, { Function(Exception) onError }) {
    return MemberCollection.doc(id).get().then((doc) {
      if (doc.data != null) {
        return _populateDocPlus(doc);
      } else {
        return null;
      }
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  @override
  StreamSubscription<List<MemberModel>> listen(
      MemberModelTrigger trigger,
      {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<MemberModel>> stream;
    if (orderBy == null) {
      stream =
          MemberCollection.where('readAccess', arrayContains: currentMember)
              .snapshots()
              .map((data) {
        Iterable<MemberModel> members = data.docs.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return members;
      });
    } else {
      stream = MemberCollection.orderBy(orderBy, descending: descending)
          .where('readAccess', arrayContains: currentMember)
          .snapshots()
          .map((data) {
        Iterable<MemberModel> members = data.docs.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return members;
      });
    }

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  @override
  StreamSubscription<List<MemberModel>> listenWithDetails(
      MemberModelTrigger trigger, { String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
    var stream;
    if (orderBy == null) {
      stream = MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      stream = MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  @override
  Stream<List<MemberModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    if (orderBy == null) {
      return MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Stream<List<MemberModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    if (orderBy == null) {
      return MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((snapshot) {
        return Future.wait(
            snapshot.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((snapshot) {
        return Future.wait(
            snapshot.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  @override
  Future<List<MemberModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    if (orderBy == null) {
      return await MemberCollection.where('readAccess',
          arrayContains: currentMember)
          .get()
          .then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await MemberCollection.orderBy(orderBy, descending: descending).where('readAccess',
          arrayContains: currentMember)
          .get()
          .then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<MemberModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    if (orderBy == null) {
      return await MemberCollection.where('readAccess',
          arrayContains: currentMember)
          .get()
          .then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return await MemberCollection.orderBy(orderBy, descending: descending).where('readAccess',
          arrayContains: currentMember)
          .get()
          .then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return MemberCollection.get().then((snapshot) {
      for (var ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  MemberFirestore();

  final CollectionReference MemberCollection =
      FirebaseFirestore.instance.collection('member');

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String timeStampToString(timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  StreamSubscription<MemberModel> listenTo(String documentId, MemberChanged changed) {
    var stream = MemberCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((member) {
      changed(member);
    });
  }
}
