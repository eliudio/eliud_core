/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

//import 'dart:async';

import 'dart:async';

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

  Future<ImageModel> add(ImageModel value) async {
//    todo: flutterweb frieldly upload required!!
//    return ImageTools.uploadPic(value).then((onValue) {
//    also: don't upload when we're dealing with internal photos, like profile photo
      return imageCollection.doc(value.documentID)
          .set(value.toEntity().toDocument())
          .then((_) => value);
//    });
  }

  Future<void> delete(ImageModel value) {
    return imageCollection.doc(value.documentID).delete();
  }

  Future<ImageModel> update(ImageModel value) {
    return imageCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

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

  Future<ImageModel> get(String id) {
    return imageCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }


  Stream<List<ImageModel>> values() {
    return imageCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Future<List<ImageModel>> valuesList() {
    return imageCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<ImageModel>> valuesWithDetails() {
    return imageCollection.onSnapshot.asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  Future<List<ImageModel>> valuesListWithDetails() {
    return imageCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger) {
    Stream<List<ImageModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<ImageModel> images  = data.docs.map((doc) {
        ImageModel value = _populateDoc(doc);
        return value;
      }).toList();
      return images;
    });

    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger) {
    Stream<List<ImageModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

}
