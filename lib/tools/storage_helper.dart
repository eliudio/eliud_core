import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

/*
 * Helper class if we would consider implementing a firebase storage version of the repositories.
 * I have considered doing so, the below is what's left of some experiments.
 */
class StorageHelper {
  StorageReference storageReference = FirebaseStorage.instance.ref();

  Future<StorageTaskSnapshot> put(String collectionID, String documentID, String jsonContents) {
    String fileName = collectionID + "/" + documentID + ".json";
    Uint8List data = new Uint8List.fromList(jsonContents.codeUnits);
    final StorageReference storageRef = storageReference.child(fileName);
    final StorageUploadTask uploadTask = storageRef.putData(
      data,
    );
    // upload and return the original value
    return uploadTask.onComplete;
  }

  Future<StorageTaskSnapshot> delete(String collectionID, String documentID) {
    String fileName = collectionID + "/" + documentID + ".json";
    final StorageReference storageRef = storageReference.child(fileName);
    return storageRef.delete();
  }

}