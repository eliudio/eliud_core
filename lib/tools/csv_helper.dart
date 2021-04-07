import 'package:eliud_core/tools/file_tools.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class CsvHelper {
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  static Future<String?> loadTextFile(String url) async {
//    String dir =  (await getApplicationDocumentsDirectory()).path;
    String dir = "";
    return FileTools.downloadFile(url, dir + "textfile.txt").then((f) {
      return f!.readAsString();
    });
    return null;
  }
}

