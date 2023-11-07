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
  Future<MemberEntity> addEntity(String documentID, MemberEntity value) {
    return memberCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<MemberEntity> updateEntity(String documentID, MemberEntity value) {
    return memberCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<MemberModel> add(MemberModel? value) {
    return memberCollection
        .doc(value!.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(MemberModel? value) {
    return memberCollection.doc(value!.documentID).delete();
  }

  @override
  Future<MemberModel> update(MemberModel? value) {
    return memberCollection
        .doc(value!.documentID)
        .update(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<MemberModel?> _populateDoc(DocumentSnapshot doc) async {
    return MemberModel.fromEntity(
        doc.id, MemberEntity.fromMap(doc.data() as Map<String, dynamic>));
  }

  Future<MemberModel?> _populateDocPlus(DocumentSnapshot doc) async {
    var data = doc.data();
    if (data == null) return null;
    var map = data as Map<String, dynamic>;
    var memberModel =
        await MemberModel.fromEntityPlus(doc.id, MemberEntity.fromMap(map));
    if (memberModel == null) return null;
    // it could be that the app is deleted after a member had subscribed and then this becomes corrupt. So we verify...
    var subscriptions = <MemberSubscriptionModel>[];
    var subscriptionStrings = <String>[];
    if (memberModel.subscriptions != null) {
      for (var i = 0; i < memberModel.subscriptions!.length; i++) {
        var theApp = memberModel.subscriptions![i].app;
        if (theApp != null) {
          subscriptions.add(memberModel.subscriptions![i]);
          subscriptionStrings.add(theApp.documentID);
        }
      }
    }
    return memberModel.copyWith(subscriptions: subscriptions);
  }

  @override
  Future<MemberModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = memberCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      print("Error whilst retrieving MemberModel with id $id");
      print("Exceptoin: $e");
      if (onError != null) {
        onError(e);
      }
    }
    return null;
  }

  @override
  StreamSubscription<List<MemberModel?>> listen(MemberModelTrigger trigger,
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    var stream = getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });
    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  @override
  StreamSubscription<List<MemberModel?>> listenWithDetails(
      MemberModelTrigger trigger,
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    var stream = getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });
    return stream.listen((listOfMemberModels) {
      trigger(listOfMemberModels);
    });
  }

  @override
  Stream<List<MemberModel?>> values(
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(
          snapshot.docs.map((doc) => _populateDoc(doc)).toList());
    });
  }

  @override
  Stream<List<MemberModel?>> valuesWithDetails(
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(
          snapshot.docs.map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  @override
  Future<List<MemberModel?>> valuesList(
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) => _populateDoc(doc)).toList());
    });
  }

  @override
  Future<List<MemberModel?>> valuesListWithDetails(
      {String? currentMember,
      String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await getQuery(memberCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery)!
        .where('readAccess', arrayContains: currentMember)
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return memberCollection.get().then((snapshot) {
      for (var ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  MemberFirestore();

  final CollectionReference memberCollection =
      FirebaseFirestore.instance.collection('member');

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  @override
  String? timeStampToString(timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  StreamSubscription<MemberModel?> listenTo(
      String documentId, MemberChanged changed,
      {MemberErrorHandler? errorHandler}) {
    var stream = memberCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var returnMe = stream.listen((member) {
      changed(member);
    });
    returnMe.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return returnMe;
  }

  @override
  Future<MemberModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return memberCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  @override
  Future<MemberEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) async {
    try {
      var collection = memberCollection.doc(id);
      var doc = await collection.get();
      return MemberEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberEntity with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  MemberEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return MemberEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }
}
