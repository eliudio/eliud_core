import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'basename_helper.dart';

typedef FeedbackProgress = Function(double? progress);

class UploadInfo {
  final String url;
  final String ref;

  UploadInfo(this.url, this.ref);

  String toString() {
    return 'UploadInfo($url, $ref)';
  }

  /*
   * Upload member data to firebase storage
   */
  static Future<UploadInfo?> uploadData(
      String baseName,
      Uint8List fileData,
      String appId,
      String ownerId,
      String packageName,
      Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    return _uploadData(baseName, fileData, appId, ownerId, packageName, ownerId,
        customMetaData,
        feedbackProgress: feedbackProgress);
  }

  /*
   * Upload temp data to firebase storage
   */
  static Future<UploadInfo?> uploadTempData(Uint8List fileData, String appId,
      String ownerId, String packageName, Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    return _uploadData(newRandomKey(), fileData, appId, 'temp', packageName,
        ownerId, customMetaData,
        feedbackProgress: feedbackProgress);
  }

  /*
   * Upload data to firebase storage
   *
   * Usage: When you need to upload data (Uint8List) to firebase storage
   */
  static Future<UploadInfo?> _uploadData(
      String baseName,
      Uint8List fileData,
      String appId,
      String directory,
      String packageName,
      String ownerId,
      Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    try {
      var ref = '$appId/$packageName/$directory/$baseName';
      var uploadTask = firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putData(
              fileData,
              firebase_storage.SettableMetadata(
                  customMetadata: customMetaData));
      uploadTask.snapshotEvents.listen((event) {
        if (feedbackProgress != null) {
          feedbackProgress(event.bytesTransferred / event.totalBytes);
        }
      });
      var uploadedTask = await uploadTask;
      var url = await uploadedTask.ref.getDownloadURL();
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
   * returns tuple of
   * UploadInfo and
   * Uint8List: the bytes representation of the file
   */
  static Future<Tuple2<UploadInfo, Uint8List>> uploadFile(
      String memberMediumDocumentID,
      String filePath,
      String appId,
      String ownerId,
      String packageName,
      Map<String, String> customMetaData,
      {FeedbackProgress? feedbackProgress}) async {
    var file = File(filePath);
    try {
      var baseName = BaseNameHelper.baseName(memberMediumDocumentID, filePath);
      print('baseName = ' + baseName);
      var ref = '$appId/$packageName/$ownerId/$baseName';

      var uploadTask;
      var bytes;
      if (kIsWeb) {
        // todo: make parameter
        var myUri = Uri.parse('https://minkey.io/assets/' + filePath);
        final response = await http.get(myUri);
        print('uploadTask = ');
        bytes = response.bodyBytes;
      } else {
        bytes = File(filePath).readAsBytesSync();
/*
        uploadTask = firebase_storage.FirebaseStorage.instance
            .ref(ref)
            .putFile(
            file,
            firebase_storage.SettableMetadata(
                customMetadata: customMetaData));
*/
      }
      uploadTask = firebase_storage.FirebaseStorage.instance
          .ref(ref).putData(bytes, firebase_storage.SettableMetadata(
          customMetadata: customMetaData));
      if (uploadTask != null) {
        print('listen');
        uploadTask.snapshotEvents.listen((event) {
          print('event');
          if (feedbackProgress != null) {
            print('event b');
            feedbackProgress(event.bytesTransferred / event.totalBytes);
          }
        });
        print('await uploadedTask');
        var uploadedTask = await uploadTask;
        print('url = ...');
        var url = await uploadedTask.ref.getDownloadURL();
        print('url = ' + url);
        var uploadInfo = UploadInfo(url, ref);
        print('uploadInfo = ' + uploadInfo.toString());
        return Tuple2(uploadInfo, bytes);
      } else {
        throw Exception(
            'Exception during file upload. Could not upload file ' + filePath);
      }
    } on firebase_storage.FirebaseException catch (e) {
      throw Exception('Exception during file upload. code = $e.code,  message = $e.message');
    }
  }
}
