/*
Bespoke
*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/member_repository.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/common_tools.dart';

class MemberFirestore implements MemberRepository {
  @override
  Future<MemberModel> add(MemberModel value) {
    return MemberCollection.document(value.documentID)
        .setData(value.toEntity().toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(MemberModel value) {
    return MemberCollection.document(value.documentID).delete();
  }

  @override
  Future<MemberModel> update(MemberModel value) {
    return MemberCollection.document(value.documentID)
        .updateData(value.toEntity().toDocument())
        .then((_) => value);
  }

  MemberModel _populateDoc(DocumentSnapshot doc) {
    return MemberModel.fromEntity(
        doc.documentID, MemberEntity.fromMap(doc.data));
  }

  Future<MemberModel> _populateDocPlus(DocumentSnapshot doc) async {
    return MemberModel.fromEntityPlus(
        doc.documentID, MemberEntity.fromMap(doc.data));
  }

  @override
  Future<MemberModel> get(String id) {
    return MemberCollection.document(id).get().then((doc) {
      if (doc.data != null) {
        return _populateDocPlus(doc);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<MemberModel>> listen(
      MemberModelTrigger trigger,
      {String currentMember, String orderBy, bool descending}) {
    Stream<List<MemberModel>> stream;
    if (orderBy == null) {
      stream =
          MemberCollection.where('readAccess', arrayContains: currentMember)
              .snapshots()
              .map((data) {
        Iterable<MemberModel> members = data.documents.map((doc) {
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
        Iterable<MemberModel> members = data.documents.map((doc) {
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
      MemberModelTrigger trigger, { String currentMember, String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      stream = MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  @override
  Stream<List<MemberModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    if (orderBy == null) {
      return MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .map((snapshot) {
        return snapshot.documents.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .map((snapshot) {
        return snapshot.documents.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Stream<List<MemberModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    if (orderBy == null) {
      return MemberCollection.where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((snapshot) {
        return Future.wait(
            snapshot.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return MemberCollection.orderBy(orderBy, descending: descending).where('readAccess', arrayContains: currentMember)
          .snapshots()
          .asyncMap((snapshot) {
        return Future.wait(
            snapshot.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  @override
  Future<List<MemberModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    if (orderBy == null) {
      return await MemberCollection.where('readAccess',
          arrayContains: currentMember)
          .getDocuments()
          .then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await MemberCollection.orderBy(orderBy, descending: descending).where('readAccess',
          arrayContains: currentMember)
          .getDocuments()
          .then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<MemberModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    if (orderBy == null) {
      return await MemberCollection.where('readAccess',
          arrayContains: currentMember)
          .getDocuments()
          .then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return await MemberCollection.orderBy(orderBy, descending: descending).where('readAccess',
          arrayContains: currentMember)
          .getDocuments()
          .then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return MemberCollection.getDocuments().then((snapshot) {
      for (var ds in snapshot.documents) {
        ds.reference.delete();
      }
    });
  }

  MemberFirestore();

  final CollectionReference MemberCollection =
      Firestore.instance.collection('Member');
}
