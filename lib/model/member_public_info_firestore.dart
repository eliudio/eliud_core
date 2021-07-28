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


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class MemberPublicInfoFirestore implements MemberPublicInfoRepository {
  Future<MemberPublicInfoModel> add(MemberPublicInfoModel value) {
    return MemberPublicInfoCollection.doc(value.documentID).set(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(MemberPublicInfoModel value) {
    return MemberPublicInfoCollection.doc(value.documentID).delete();
  }

  Future<MemberPublicInfoModel> update(MemberPublicInfoModel value) {
    return MemberPublicInfoCollection.doc(value.documentID).update(value.toEntity().toDocument()).then((_) => value);
  }

  MemberPublicInfoModel? _populateDoc(DocumentSnapshot value) {
    return MemberPublicInfoModel.fromEntity(value.id, MemberPublicInfoEntity.fromMap(value.data()));
  }

  Future<MemberPublicInfoModel?> _populateDocPlus(DocumentSnapshot value) async {
    return MemberPublicInfoModel.fromEntityPlus(value.id, MemberPublicInfoEntity.fromMap(value.data()), );  }

  Future<MemberPublicInfoModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = MemberPublicInfoCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberPublicInfo with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  StreamSubscription<List<MemberPublicInfoModel?>> listen(MemberPublicInfoModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<MemberPublicInfoModel?>> stream;
//    stream = getQuery(FirebaseFirestore.instance.collection('memberpublicinfo'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
//    The above line is replaced by the below line. The reason we had the above line is because we could not be subscribed to this collecction twice
//    See https://github.com/felangel/bloc/issues/2073.
//    However... I believe this issue seems now resolved and hence we use the below. In case we do seem the issue re-occuring (in admin, then let's revisit... the above github has some other suggestions)
      stream = getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((data) {
      Iterable<MemberPublicInfoModel?> memberPublicInfos  = data.docs.map((doc) {
        MemberPublicInfoModel? value = _populateDoc(doc);
        return value;
      }).toList();
      return memberPublicInfos as List<MemberPublicInfoModel?>;
    });
    return stream.listen((listOfMemberPublicInfoModels) {
      trigger(listOfMemberPublicInfoModels);
    });
  }

  StreamSubscription<List<MemberPublicInfoModel?>> listenWithDetails(MemberPublicInfoModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<MemberPublicInfoModel?>> stream;
//  stream = getQuery(FirebaseFirestore.instance.collection('memberpublicinfo'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
//  see comment listen(...) above
    stream = getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberPublicInfoModels) {
      trigger(listOfMemberPublicInfoModels);
    });
  }

  @override
  StreamSubscription<MemberPublicInfoModel?> listenTo(String documentId, MemberPublicInfoChanged changed) {
    var stream = MemberPublicInfoCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<MemberPublicInfoModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberPublicInfoModel?>> _values = getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<MemberPublicInfoModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberPublicInfoModel?>> _values = getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<MemberPublicInfoModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<MemberPublicInfoModel?> _values = await getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<MemberPublicInfoModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<MemberPublicInfoModel?> _values = await getQuery(MemberPublicInfoCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, )!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return MemberPublicInfoCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return MemberPublicInfoCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<MemberPublicInfoModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return MemberPublicInfoCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  MemberPublicInfoFirestore();

  final CollectionReference MemberPublicInfoCollection = FirebaseFirestore.instance.collection('memberpublicinfo');

}

