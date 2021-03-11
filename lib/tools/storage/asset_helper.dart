import 'dart:async';

//import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show AssetBundle, rootBundle;

class AssetHelper {
  // Read asset as a string
  static Future<String> getContents(String path) async {
    return await rootBundle.loadString(path);
  }
}
