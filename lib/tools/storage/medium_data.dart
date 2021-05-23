import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:image/image.dart' as imgpackage;
import 'package:flutter/services.dart' show rootBundle;
import 'package:video_thumbnail/video_thumbnail.dart';

import 'basename_helper.dart';
import 'medium_base.dart';

abstract class MediumData {
  static int thumbnailSize = 200;
  static String videoImage = 'packages/eliud_core/assets/undraw_co/undraw_online_video_ivvq.png';

  static Future<PhotoWithThumbnail> enrichPhotoWithPath(String path) async {
    var baseName = BaseNameHelper.baseName(path);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(path);

    var imageBytes = await File(path).readAsBytes();
    if (imageBytes == null) {
      throw Exception("Can't read $path. imageBytes is null");
    }

    return enrichPhoto(baseName, thumbnailBaseName, imageBytes);
  }

  /*
   * Create thumbnail from image
   */
  static Uint8List getThumbnail(Image img) {
    var thumbnailWidth;
    var thumbnailHeight;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);
    var thumbNailData = Uint8List.fromList(imgpackage.encodePng(thumbnail));
    return thumbNailData;
  }

  /*
   * Create thumbnail from asset
   */
  static Future<Uint8List> getThumbnailFromAsset(String assetPath) async {
    final imgData = await rootBundle.load(assetPath);
    var uint8List = imgData.buffer.asUint8List();
    var img = imgpackage.decodeImage(uint8List);
    if (img == null) {
      throw Exception('Can not decode image from asset $assetPath');
    }
    var thumbNailData = getThumbnail(img);
    return thumbNailData;
  }

  /*
   * Enrich a photo with a thumbnail
   *
   * Usage: When you need a thumbnail of a photo and information about the photo
   */
  static Future<PhotoWithThumbnail> enrichPhoto(
      String baseName, String thumbnailBaseName, Uint8List imgBytes) async {
    var img = imgpackage.decodeImage(imgBytes);
    if (img == null) {
      throw Exception('Can not decode image with baseName $baseName');
    }
    var thumbNailData = getThumbnail(img);

    return PhotoWithThumbnail(
      photoData: ImageData(
          baseName: baseName,
          width: img.width,
          height: img.height,
          data: imgBytes),
      thumbNailData: ImageData(
          baseName: thumbnailBaseName,
          width: thumbnailSize,
          height: thumbnailSize,
          data: thumbNailData),
    );
  }

  static Future<VideoWithThumbnail> enrichVideoWithPath(String filePath) async {
    var baseName = BaseNameHelper.baseName(filePath);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(baseName);
    var videoBytes = await File(filePath).readAsBytes();
    if (videoBytes == null) {
      throw Exception("Can't read $filePath. videoBytes is null");
    }

    var thumbNailData = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.PNG,
      maxWidth: thumbnailSize, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 30,
    );

    if (thumbNailData == null) {
      throw Exception("Could not create thumbnail for video with path $filePath");
    }

    // return the data
    return VideoWithThumbnail(
        videoData: VideoData(
            baseName: baseName,
            data: videoBytes), // we don't know the size of the video... todo
        thumbNailData: ImageData(
            baseName: thumbnailBaseName,
            width: thumbnailSize,
            height: thumbnailSize,
            data: thumbNailData));
  }

  /*
   * Enrich a video with a thumbnail. Because in this situation we do not have access to the file but only to the Uint8List representation
   * we can't create a thumbnail (at least not to our knowledge). So hence we have a hardcoded thumbnail instead.
   *
   * Usage: When you need a thumbnail of a video and information about the video
   *
   */
  static Future<VideoWithThumbnail> enrichVideo(
      String baseName, String thumbnailBaseName, Uint8List imgBytes) async {
    var thumbNailData = await getThumbnailFromAsset(videoImage);

    // return the data
    return VideoWithThumbnail(
        videoData: VideoData(
            baseName: baseName,
            data: imgBytes), // we don't know the size of the video... todo
        thumbNailData: ImageData(
            baseName: thumbnailBaseName,
            width: thumbnailSize,
            height: thumbnailSize,
            data: thumbNailData));
  }

  /*
   * Create an image with thumbnail from a specific page of a pdf doc
   * Before: _createImageFromPdfPage(with thumbnail TRUE)
   */
  static Future<PhotoWithThumbnail> createPhotoWithThumbnailFromPdfPage(
      String filePath, String name, int pageNumber) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }
    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }
    var thumbnailWidth;
    var thumbnailHeight;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);
    var thumbNailData = Uint8List.fromList(imgpackage.encodePng(thumbnail));

    var baseName = name + '.png';
    var thumbnailBaseName = name + '.thumbnail.png';
    return PhotoWithThumbnail(
        photoData: ImageData(
            baseName: baseName,
            data: pageImage.bytes,
            width: img.width,
            height: img.height),
        thumbNailData: ImageData(
            baseName: thumbnailBaseName,
            width: thumbnailSize,
            height: thumbnailSize,
            data: thumbNailData));
  }

  /*
   * Create an image from a specific page of a pdf doc
   * Before: _createImageFromPdfPage(with thumbnail FALSE)
   */
  static Future<ImageData> createPhotoFromPdfPage(
      String filePath, int pageNumber) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }

    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }

    return ImageData(
        baseName: BaseNameHelper.baseName(filePath),
        width: img.width,
        height: img.height,
        data: pageImage.bytes);
  }
}

/* Classes to hold data for image, video or pdf */
class ImageData extends MediumData {
  final String baseName;
  final Uint8List data;
  final int? width;
  final int? height;

  ImageData(
      {required this.baseName,
      required this.data,
      required this.width,
      this.height});
}

class VideoData extends MediumData {
  final String baseName;
  final Uint8List data;

  VideoData({required this.baseName, required this.data});
}

class PdfData extends MediumData {
  final String filePath;
  final int width;
  final int height;

  PdfData({
    required this.filePath,
    required this.width,
    required this.height,
  });
}
