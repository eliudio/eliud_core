/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';
import 'dart:io';

import 'file:///C:/src/eliud/eliud_model/lib/model/image_formfield.dart';

import 'package:eliud_core/model/image_model.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class FileTools {
  static String FIREBASE_STORAGE_DIRECTORY = "mydirectory";

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  static var httpClient = new HttpClient();
  static Future<File> downloadFile(String url, String fileName) async {
    try {
      return await httpClient.getUrl(Uri.parse(url)).then((value) async {
        return value.close().then((response) async {
          return await consolidateHttpClientResponseBytes(response).then((bytes) async {
            return await _localFile.then((file) async {
              return await file.writeAsBytes(bytes);
            }).catchError((onError) =>
            null);
          }).catchError((onError) =>
          null);
        }).catchError((onError) =>
        null);
      }).catchError((onError) =>
      null);
    } catch (error) {
      return null;
    }
  }
}
