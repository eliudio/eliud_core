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

import 'medium_data.dart';

abstract class MediumBase {
}

class PhotoWithThumbnail extends MediumBase {
  final ImageData photoData;
  final ImageData thumbNailData;

  PhotoWithThumbnail({
    required this.photoData,
    required this.thumbNailData,
  });
}

class VideoWithThumbnail extends MediumBase {
  final VideoData videoData;
  final ImageData thumbNailData;

  VideoWithThumbnail({required this.videoData, required this.thumbNailData});
}
