import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'basename_helper.dart';

class UploadInfo {
  final String url;
  final String ref;

  UploadInfo(this.url, this.ref);

  /*
   * Create custom meta data.
   *
   * ownerId is the memberId
   * readAccess is the list of member IDs, or 'PUBLIC'
   *
   * Usage: When you need to construct meta data for a file before uploading. Set the owner and read access rights.
   */
  static Map<String, String> _customMetaData(
      String ownerId, List<String> readAccess) {
    var customMetaData = {
      'owner': ownerId,
      'readAccess': readAccess.join(';') + ';'
    };
    return customMetaData;
  }

  /*
   * Upload data to firebase storage
   *
   * Usage: When you need to upload data (Uint8List) to firebase storage
   *
   * Before: _uploadData
   */
  static Future<UploadInfo?> uploadData(String baseName, Uint8List fileData,
      String appId, String ownerId, List<String> readAccess) async {
    try {
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putData(
          fileData,
          firebase_storage.SettableMetadata(
              customMetadata: _customMetaData(ownerId, readAccess)));
      var url = await _getUrl(uploadTask);
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }

  /*
   * Upload a file to firebase storage
   *
   * Usage: When you need to upload a file to firebase storage
   *
   * Before: _uploadFile
   */
  static Future<UploadInfo> uploadFile(String filePath, String appId,
      String ownerId, List<String> readAccess) async {
    var file = File(filePath);
    try {
      var baseName = BaseNameHelper.baseName(filePath);
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = await firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putFile(
          file,
          firebase_storage.SettableMetadata(
              customMetadata: _customMetaData(ownerId, readAccess)));
      var url = await _getUrl(uploadTask);
      return UploadInfo(url, ref);
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception(
          'Exception during file upload. code = $e.code,  message = $e.message');
    }
  }

  /*
   * When we retrieve the download url using getDownloadURL then this include security token
   * This makes the URL accessible for everybody without security rules.
   * I'm assuming that by removing the token this url becomes a URL only accessible for
   * those who have access rights through the storage rules.
   *
   * See https://stackoverflow.com/questions/67664805/in-flutter-after-uploading-a-file-to-firebase-storage-how-do-i-get-the-public
   */
  static Future<String> _getUrl(firebase_storage.TaskSnapshot uploadTask) async {
    var url = await uploadTask.ref.getDownloadURL();
    var uri = Uri.parse(url);
    var newMap = Map<String, dynamic>.from(uri.queryParameters)..removeWhere((k, v) => k == 'token');
    var newUri = uri.replace(queryParameters: newMap);
    var newUrl = newUri.toString();
    return newUrl;
  }
}

