/*
 Bespoke code firestore implementation. This differs from generated firestore implementation in that it will upload / delete the images as required.
*/

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FileTools {
  static String firebaseStorageDirectory = "mydirectory";

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  static var httpClient = HttpClient();
  static Future<File?> downloadFile(String url, String fileName) async {
    try {
      return await httpClient.getUrl(Uri.parse(url)).then((value) async {
        return value.close().then((response) async {
          return await consolidateHttpClientResponseBytes(response)
              .then((bytes) async {
            return await _localFile.then((file) async {
              return await file.writeAsBytes(bytes);
            }).catchError((onError) => throw ("Error 1"));
          }).catchError((onError) => throw ("Error 2"));
        }).catchError((onError) => throw ("Error 3"));
      }).catchError((onError) => throw ("Error 4"));
    } catch (error) {
      return Future.value(null);
    }
  }
}
