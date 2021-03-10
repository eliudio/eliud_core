import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';
//import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'package:image/image.dart' as imgpackage;
import 'package:thumbnails/thumbnails.dart';
import 'package:flutter/services.dart' show AssetBundle, rootBundle;

class AssetHelper {
  // Read asset as a string
  static Future<String> getContents(String path) async {
    return await rootBundle.loadString(path);
  }
}
