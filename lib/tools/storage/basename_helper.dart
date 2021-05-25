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

class BaseNameHelper {
  static String baseName(String filePath) {
    return context.basename(filePath);
  }

  static String thumbnailBaseName(String filePath) {
    return context.basenameWithoutExtension(filePath) +
        '.thumbnail.png';
  }

  static String baseNameExt(String filePath, String ext) {
    return context.basenameWithoutExtension(filePath) + '.' + ext;
  }

  static String baseNameWithPageExt(String filePath, int page, String ext) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.' +
        ext;
  }

  static String thumbnailBaseNameWithPage(String filePath, int page) {
    return context.basenameWithoutExtension(filePath) +
        '.$page.thumbnail.png';
  }
}