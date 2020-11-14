/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/model/image_repository.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/image_entity.dart';
import 'package:eliud_core/tools/image_tools.dart';

class ImageFirestore implements ImageRepository {
  final String appID;
  final CollectionReference imageCollection;

  ImageFirestore(this.appID) : imageCollection = Firestore.instance.collection('Image-${appID}');

  Future<ImageModel> add(ImageModel value) async {
    if (value.source != SourceImage.YourProfilePhoto) {
      return ImageTools.uploadPic(value).then((onValue) {
        return imageCollection
            .document(value.documentID)
            .setData(onValue.toEntity(appID).toDocument()).then((_) =>
        onValue);
      }).catchError((onError) =>
          print(onError)
      );
    } else {
      return imageCollection
          .document(value.documentID)
          .setData(value.toEntity(appID).toDocument()).then((_) => value);
    }
  }

  Future<void> delete(ImageModel value) {
    return _deletePic(value).then(
        (onValue) => imageCollection.document(onValue.documentID).delete());
  }

  Future<ImageModel> update(ImageModel value) {
    if (value.source != SourceImage.YourProfilePhoto) {
      return ImageTools.uploadPic(value).then((uploaded) =>
          imageCollection
              .document(uploaded.documentID)
              .updateData(uploaded.toEntity(appID).toDocument()).then((value) =>
          uploaded)
      );
    } else {
      return imageCollection
          .document(value.documentID)
          .setData(value.toEntity(appID).toDocument()).then((_) => value);
    }
  }

  ImageModel _populateDoc(DocumentSnapshot doc) {
    return ImageModel.fromEntity(doc.documentID, ImageEntity.fromMap(doc.data));
  }

  Future<ImageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return ImageModel.fromEntityPlus(doc.documentID, ImageEntity.fromMap(doc.data));
  }

  Future<ImageModel> get(String id) {
    return imageCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  Stream<List<ImageModel>> values() {
    return imageCollection.snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<ImageModel>> valuesWithDetails() {
    return imageCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  @override
  Future<List<ImageModel>> valuesList() async {
    return await imageCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<ImageModel>> valuesListWithDetails() async {
    return await imageCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  Future<ImageModel> _deletePic(ImageModel model) async {
    return model;
  }

  Future<void> deleteAll() {
    return imageCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }

  void flush() {
  }

  StreamSubscription<List<ImageModel>> listen(ImageModelTrigger trigger) {
    Stream<List<ImageModel>> stream = imageCollection.snapshots()
        .map((data) {
      Iterable<ImageModel> fonts  = data.documents.map((doc) {
        ImageModel value = _populateDoc(doc);
        return value;
      }).toList();
      return fonts;
    });

    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }

  StreamSubscription<List<ImageModel>> listenWithDetails(ImageModelTrigger trigger) {
    Stream<List<ImageModel>> stream = imageCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfImageModels) {
      trigger(listOfImageModels);
    });
  }


}
