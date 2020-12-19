/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

//import 'dart:async';

import 'dart:async';

import 'package:eliud_core/tools/common_tools.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

import 'image_entity.dart';
import 'image_model.dart';
import 'image_repository.dart';

class ImageJsFirestore implements ImageRepository {
  final String appID;
  final CollectionReference imageCollection;

  ImageJsFirestore(this.appID) : imageCollection = firestore().collection('Image-${appID}');

  CollectionReference getCollection() => firestore().collection('Image-${appID}');

  @override
  Future<ImageModel> add(ImageModel value) async {
//    todo: flutterweb frieldly upload required!!
//    return ImageTools.uploadPic(value).then((onValue) {
//    also: don't upload when we're dealing with internal photos, like profile photo
      return imageCollection.doc(value.documentID)
          .set(value.toEntity(appId: appID).toDocument())
          .then((_) => value);
//    });
  }

  @override
  Future<void> delete(ImageModel value) {
    return imageCollection.doc(value.documentID).delete();
  }

  @override
  Future<ImageModel> update(ImageModel value) {
    return imageCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appID).toDocument())
        .then((_) => value);
  }

  @override
  Future<void> deleteAll() {
    return imageCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => imageCollection.doc(element.id).delete()));
  }

  ImageModel _populateDoc(DocumentSnapshot doc) {
    return ImageModel.fromEntity(doc.id, ImageEntity.fromMap(doc.data()));
  }

  Future<ImageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ImageModel.fromEntityPlus(doc.id, ImageEntity.fromMap(doc.data()));
  }

  @override
  Future<ImageModel> get(String id) {
    return imageCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }


  @override
  Stream<List<ImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    if (orderBy == null) {
      return imageCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return imageCollection.orderBy(
          orderBy, descending ? 'desc' : 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  @override
  Future<List<ImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    if (orderBy == null) {
      return imageCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return imageCollection.orderBy(
          orderBy, descending ? 'desc' : 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Stream<List<ImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    if (orderBy == null) {
      return imageCollection.onSnapshot.asyncMap((data) =>
          Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return imageCollection.orderBy(
          orderBy, descending ? 'desc' : 'asc').onSnapshot.asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<ImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    if (orderBy == null) {
      return imageCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return imageCollection.orderBy(
          orderBy, descending ? 'desc' : 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  @override
  void flush() {}

  @override
  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger, {String currentMember,  String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel }) {
    Stream<List<ImageModel>> stream;
    if (orderBy == null) {
      stream = imageCollection.onSnapshot
          .map((data) {
        Iterable<ImageModel> images = data.docs.map((doc) {
          var value = _populateDoc(doc);
          return value;
        }).toList();
        return images;
      });
    } else {
      stream = imageCollection.orderBy(
          orderBy, descending ? 'desc' : 'asc').onSnapshot
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
  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger, { String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel }) {
    Stream<List<ImageModel>> stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      stream = getCollection().orderBy(
          orderBy, descending ? 'desc' : 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(
            data.docs.map((doc) => _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

}
