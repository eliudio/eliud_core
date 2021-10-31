import 'dart:async';

import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'dart:io';
import 'package:eliud_core/tools/random.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

class AssetHelper {
  // Read asset as a string
  static Future<String> getContents(String path) async {
    return await rootBundle.loadString(path);
  }

  /*
   * Copy an asset to a local temporary file
   *
   * Items specified in assetPath must be added to a package lib directory and they must be added to your pubspec.yaml file
   * For example,
   * 1) add file abc.jpg to the package eliud_pkg_apps and put it in directory lib/assets/minkey_app/feed/abc.jpg
   * 2) add the following to your pubspec.yaml
   *    flutter:
   *      assets:
   *        - packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg
   *
   * 3) specify 'packages/eliud_pkg_apps/assets/minkey_app/feed/abc.jpg' as value for your assetPath
   *
   */
  static Future<String> getFileFromAssets(String documentID, String path) async {
    final byteData = await rootBundle.load(path);

    final newFileName = documentID + '-' + context.basenameWithoutExtension(path) +
        '-' +
        context.extension(path); // make sure it's a unique filename
    final newFile = File(Directory.systemTemp.path + '/' + newFileName);
    await newFile.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return newFile.path;
  }
}
