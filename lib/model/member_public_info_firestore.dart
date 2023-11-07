/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/member_public_info_repository.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class MemberPublicInfoFirestore implements MemberPublicInfoRepository {
  @override
  MemberPublicInfoEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return MemberPublicInfoEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<MemberPublicInfoEntity> addEntity(
      String documentID, MemberPublicInfoEntity value) {
    return memberPublicInfoCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<MemberPublicInfoEntity> updateEntity(
      String documentID, MemberPublicInfoEntity value) {
    return memberPublicInfoCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  @override
  Future<MemberPublicInfoModel> add(MemberPublicInfoModel value) {
    return memberPublicInfoCollection
        .doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  @override
  Future<void> delete(MemberPublicInfoModel value) {
    return memberPublicInfoCollection.doc(value.documentID).delete();
  }

  @override
  Future<MemberPublicInfoModel> update(MemberPublicInfoModel value) {
    return memberPublicInfoCollection
        .doc(value.documentID)
        .update(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<MemberPublicInfoModel?> _populateDoc(DocumentSnapshot value) async {
    return MemberPublicInfoModel.fromEntity(
        value.id, MemberPublicInfoEntity.fromMap(value.data()));
  }

  Future<MemberPublicInfoModel?> _populateDocPlus(
      DocumentSnapshot value) async {
    return MemberPublicInfoModel.fromEntityPlus(
      value.id,
      MemberPublicInfoEntity.fromMap(value.data()),
    );
  }

  @override
  Future<MemberPublicInfoEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = memberPublicInfoCollection.doc(id);
      var doc = await collection.get();
      return MemberPublicInfoEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberPublicInfo with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  Future<MemberPublicInfoModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = memberPublicInfoCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberPublicInfo with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  @override
  StreamSubscription<List<MemberPublicInfoModel?>> listen(
      MemberPublicInfoModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<MemberPublicInfoModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('memberpublicinfo'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(memberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfMemberPublicInfoModels) {
      trigger(listOfMemberPublicInfoModels);
    });
  }

  @override
  StreamSubscription<List<MemberPublicInfoModel?>> listenWithDetails(
      MemberPublicInfoModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<MemberPublicInfoModel?>> stream;
    stream = getQuery(
      FirebaseFirestore.instance.collection('memberpublicinfo'),
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(memberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberPublicInfoModels) {
      trigger(listOfMemberPublicInfoModels);
    });
  }

  @override
  StreamSubscription<MemberPublicInfoModel?> listenTo(
      String documentId, MemberPublicInfoChanged changed,
      {MemberPublicInfoErrorHandler? errorHandler}) {
    var stream =
        memberPublicInfoCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  @override
  Stream<List<MemberPublicInfoModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberPublicInfoModel?>> values = getQuery(
      memberPublicInfoCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Stream<List<MemberPublicInfoModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberPublicInfoModel?>> values = getQuery(
      memberPublicInfoCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<MemberPublicInfoModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<MemberPublicInfoModel?> values = await getQuery(
      memberPublicInfoCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  Future<List<MemberPublicInfoModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<MemberPublicInfoModel?> values = await getQuery(
      memberPublicInfoCollection,
      orderBy: orderBy,
      descending: descending,
      startAfter: startAfter as DocumentSnapshot?,
      limit: limit,
      privilegeLevel: privilegeLevel,
      eliudQuery: eliudQuery,
    )!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  @override
  void flush() {}

  @override
  Future<void> deleteAll() {
    return memberPublicInfoCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return memberPublicInfoCollection.doc(documentId).collection(name);
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  Future<MemberPublicInfoModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return memberPublicInfoCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  MemberPublicInfoFirestore();

  final CollectionReference memberPublicInfoCollection =
      FirebaseFirestore.instance.collection('memberpublicinfo');
}
