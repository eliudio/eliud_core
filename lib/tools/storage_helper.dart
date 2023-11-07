import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

/*
 * Helper class if we would consider implementing a firebase storage version of the repositories.
 * I have considered doing so, the below is what's left of some experiments.
 */
class StorageHelper {
  Reference storageReference = FirebaseStorage.instance.ref();

  Future<void> put(
      String collectionID, String documentID, String jsonContents) {
    String fileName = "$collectionID/$documentID.json";
    Uint8List data = Uint8List.fromList(jsonContents.codeUnits);
    final Reference storageRef = storageReference.child(fileName);
    final UploadTask uploadTask = storageRef.putData(
      data,
    );
    return uploadTask;
  }

  Future<void> delete(String collectionID, String documentID) {
    String fileName = "$collectionID/$documentID.json";
    final Reference storageRef = storageReference.child(fileName);
    return storageRef.delete();
  }
}
