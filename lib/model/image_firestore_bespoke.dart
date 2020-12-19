/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/model/image_repository.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/image_entity.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/image_tools.dart';

class ImageFirestore implements ImageRepository {
  final String appID;
  final CollectionReference imageCollection;

  ImageFirestore(this.appID) : imageCollection = Firestore.instance.collection('Image-${appID}');

  @override
  Future<ImageModel> add(ImageModel value) async {
    if (value.source != SourceImage.YourProfilePhoto) {
      return ImageTools.uploadPic(value).then((onValue) {
        return imageCollection
            .document(value.documentID)
            .setData(onValue.toEntity(appId: appID).toDocument()).then((_) =>
        onValue);
      }).catchError((onError) =>
          print(onError)
      );
    } else {
      return imageCollection
          .document(value.documentID)
          .setData(value.toEntity(appId: appID).toDocument()).then((_) => value);
    }
  }

  @override
  Future<void> delete(ImageModel value) {
    return _deletePic(value).then(
        (onValue) => imageCollection.document(onValue.documentID).delete());
  }

  @override
  Future<ImageModel> update(ImageModel value) {
    if (value.source != SourceImage.YourProfilePhoto) {
      return ImageTools.uploadPic(value).then((uploaded) =>
          imageCollection
              .document(uploaded.documentID)
              .updateData(uploaded.toEntity(appId: appID).toDocument()).then((value) =>
          uploaded)
      );
    } else {
      return imageCollection
          .document(value.documentID)
          .setData(value.toEntity(appId: appID).toDocument()).then((_) => value);
    }
  }

  ImageModel _populateDoc(DocumentSnapshot doc) {
    return ImageModel.fromEntity(doc.documentID, ImageEntity.fromMap(doc.data));
  }

  Future<ImageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ImageModel.fromEntityPlus(doc.documentID, ImageEntity.fromMap(doc.data));
  }

  @override
  Future<ImageModel> get(String id) {
    return imageCollection.document(id).get().then((doc) {
      if (doc.data != null) {
        return _populateDocPlus(doc);
      } else {
        return null;
      }
    });
  }

  @override
  Stream<List<ImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Stream<List<ImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
  }

  @override
  Future<List<ImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    return await getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    return await getQuery(imageCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<ImageModel> _deletePic(ImageModel model) async {
    return model;
  }

  @override
  Future<void> deleteAll() {
    return imageCollection.getDocuments().then((snapshot) {
      for (var ds in snapshot.documents){
        ds.reference.delete();
      }});
  }

  @override
  void flush() {
  }

  @override
  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
    Stream<List<ImageModel>> stream;
    if (orderBy == null) {
      stream = imageCollection.snapshots()
          .map((data) {
        Iterable<ImageModel> images = data.documents.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return images;
      });
    } else {
      stream = imageCollection.orderBy(orderBy, descending: descending).snapshots()
          .map((data) {
        Iterable<ImageModel> images = data.documents.map((doc) {
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
  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
    Stream<List<ImageModel>>  stream;
    if (orderBy == null) {
      stream = imageCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      stream = imageCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(
            data.documents.map((doc) => _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

}
