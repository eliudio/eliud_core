import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imgpackage;
import 'package:flutter/services.dart' show rootBundle;
import 'package:video_thumbnail/video_thumbnail.dart';

import 'basename_helper.dart';

typedef FeedbackProgress(double progress);

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
   * Upload member data to firebase storage
   */
  static Future<UploadInfo?> uploadData(String baseName, Uint8List fileData,
      String appId, String ownerId, List<String> readAccess, {FeedbackProgress? feedbackProgress}) async {
    return _uploadData(baseName, fileData, appId, ownerId, ownerId, readAccess, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload temp data to firebase storage
   */
  static Future<UploadInfo?> uploadTempData(Uint8List fileData,
      String appId, String ownerId, List<String> readAccess, {FeedbackProgress? feedbackProgress}) async {
    return _uploadData(newRandomKey(), fileData, appId, 'temp', ownerId, readAccess, feedbackProgress: feedbackProgress);
  }

  /*
   * Upload data to firebase storage
   *
   * Usage: When you need to upload data (Uint8List) to firebase storage
   */
  static Future<UploadInfo?> _uploadData(String baseName, Uint8List fileData,
      String appId, String directory, String ownerId, List<String> readAccess, {FeedbackProgress? feedbackProgress}) async {
    try {
      var ref = '$appId/$directory/$baseName';
      var uploadTask = firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putData(
          fileData,
          firebase_storage.SettableMetadata(
              customMetadata: _customMetaData(ownerId, readAccess)));
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
   */
  static Future<UploadInfo> uploadFile(String filePath, String appId,
      String ownerId, List<String> readAccess, {FeedbackProgress? feedbackProgress}) async {
    var file = File(filePath);
    try {
      var baseName = BaseNameHelper.baseName(filePath);
      var ref = '$appId/$ownerId/$baseName';
      var uploadTask = firebase_storage.FirebaseStorage.instance
          .ref(ref)
          .putFile(
          file,
          firebase_storage.SettableMetadata(
              customMetadata: _customMetaData(ownerId, readAccess)));
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
}

