/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/model/image_repository.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/image_entity.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/image_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

class ImageFirestore implements ImageRepository {
  final String appID;
  final CollectionReference imageCollection;

  ImageFirestore(this.appID, this.imageCollection);

  @override
  Future<ImageModel> add(ImageModel value) async {
    return ImageTools.uploadPic(value).then((onValue) {
      return imageCollection
          .doc(value.documentID)
          .set(onValue.toEntity(appId: appID).toDocument()).then((_) =>
      onValue);
    }).catchError((onError) =>
        print(onError)
    );
  }

  @override
  Future<void> delete(ImageModel value) {
    return _deletePic(value).then(
        (onValue) => imageCollection.doc(onValue.documentID).delete());
  }

  @override
  Future<ImageModel> update(ImageModel value) {
    return ImageTools.uploadPic(value).then((uploaded) =>
        imageCollection
            .doc(uploaded.documentID)
            .update(uploaded.toEntity(appId: appID).toDocument()).then((value) =>
        uploaded)
    );
  }

  ImageModel _populateDoc(DocumentSnapshot doc) {
    return ImageModel.fromEntity(doc.id, ImageEntity.fromMap(doc.data()));
  }

  Future<ImageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ImageModel.fromEntityPlus(doc.id, ImageEntity.fromMap(doc.data()));
  }

  @override
  Future<ImageModel> get(String id, { Function(Exception) onError }) {
    return imageCollection.doc(id).get().then((doc) {
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
  Stream<List<ImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Stream<List<ImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    return getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.docs
            .map((doc) => _populateDocPlus(doc)).toList());
      });
  }

  @override
  Future<List<ImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    return await getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<ImageModel> _deletePic(ImageModel model) async {
    return model;
  }

  @override
  Future<void> deleteAll() {
    return imageCollection.get().then((snapshot) {
      for (var ds in snapshot.docs){
        ds.reference.delete();
      }});
  }

  @override
  void flush() {
  }

  @override
  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
    Stream<List<ImageModel>> stream;
    if (orderBy == null) {
      stream = imageCollection.snapshots()
          .map((data) {
        Iterable<ImageModel> images = data.docs.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return images;
      });
    } else {
      stream = imageCollection.orderBy(orderBy, descending: descending).snapshots()
          .map((data) {
        Iterable<ImageModel> images = data.docs.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return images;
      });
    }
    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

  @override
  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery }) {
    Stream<List<ImageModel>>  stream;
    if (orderBy == null) {
      stream = imageCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      stream = imageCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }


  @override
  String timeStampToString(timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  @override
  StreamSubscription<ImageModel> listenTo(String documentId, changed) {
    throw UnimplementedError();
  }

  @override
  Future<ImageModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return imageCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }
}
