import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:image/image.dart' as imgpackage;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdfx/pdfx.dart';
//import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:get_thumbnail_video/src/image_format.dart';

import 'basename_helper.dart';
import 'medium_base.dart';

import 'package:http/http.dart' as http;

abstract class MediumData {
  static int thumbnailSize = 200;
  static String videoImage =
      'packages/eliud_core/assets/undraw_co/undraw_online_video_ivvq.png';

  static Future<PhotoWithThumbnail> enrichPhotoWithPath(
      String memberMediumdocumentID, String path) async {
    var baseName = BaseNameHelper.baseName(memberMediumdocumentID, path);
    var thumbnailBaseName =
        BaseNameHelper.thumbnailBaseName(memberMediumdocumentID, path);

    var imageBytes = await File(path).readAsBytes();
/*
    if (imageBytes == null) {
      throw Exception("Can't read $path. imageBytes is null");
    }
*/

    return enrichPhoto(baseName, thumbnailBaseName, imageBytes);
  }

  /*
   * Create thumbnail from image
   */
  static Uint8List getThumbnail(Image img) {
    int thumbnailWidth = 0;
    int thumbnailHeight = 0;
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

  static Future<VideoWithThumbnail> enrichVideoWithPath(
      String memberMediumDocumentID, String filePath) async {
    var baseName = BaseNameHelper.baseName(memberMediumDocumentID, filePath);
    var thumbnailBaseName =
        BaseNameHelper.thumbnailBaseName(memberMediumDocumentID, baseName);
    var videoBytes = await File(filePath).readAsBytes();
/*
    if (videoBytes == null) {
      throw Exception("Can't read $filePath. videoBytes is null");
    }
*/

    var thumbNailData = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.PNG,
      maxWidth:
          thumbnailSize, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 30,
    );

/*
    if (thumbNailData == null) {
      throw Exception(
          "Could not create thumbnail for video with path $filePath");
    }
*/

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

  static Future<Uint8List> getThumbnailUsingHerokuapp(String videoUrl) async {
    var input = '{"videoUrl" : "$videoUrl"}';
    var url =
        'https://video-thumbnail-generator-pub.herokuapp.com/generate/thumbnail';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-type': 'application/json'},
        body: input,
      );
      if (response.statusCode == 200) {
        var data = response.body;
        return base64Decode(data);
      } else {
        throw 'Could not fetch data from api | Error Code: ${response.statusCode}';
      }
    } on Exception catch (e) {
      throw 'Error : $e';
    }
  }

  static Future<VideoWithThumbnail> enrichVideoUsngHerokuapp(String baseName,
      String thumbnailBaseName, Uint8List imgBytes, String url) async {
    print('url: $url');
    var thumbNailData = await getThumbnailUsingHerokuapp(url);

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
   *
   *  Can we use Uint8List getThumbnail(Image img) to generate thumbnail for a video (for web)?
   *  For this we would need to get the first frame of a video
   */

  /*
   * Enrich a video with a hardcoded thumbnail fom assets.
   *
   * VideoThumbnail does not support flutterweb. So as a consequence we use getThumbnailUsingHerokuapp to generate a thumbnail
   * However, this is not ideal. It's an external service, which means a dependency.
   * For now, we stick with it, until production. Then we should reconsider: does VideoThumbnail support flutterweb?
   * If yes, then use it. If no, perhaps consider using a hardcoded thumbnail and replace the calls to getThumbnailUsingHerokuapp into calls to
   * enrichVideoWithHardcodedThumbnail
   *
   */
  static Future<VideoWithThumbnail> enrichVideoWithHardcodedThumbnail(
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
    final pageImage = await page.render(
        width: page.width, height: page.height, format: PdfPageImageFormat.png);
    await page.close();
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }
    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }
    int thumbnailWidth = 0;
    int thumbnailHeight = 0;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);
    var thumbNailData = Uint8List.fromList(imgpackage.encodePng(thumbnail));

    var baseName = '$name.png';
    var thumbnailBaseName = '$name.thumbnail.png';
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
   * Create an image with thumbnail from a specific page of a pdf doc
   * Before: _createImageFromPdfPage(with thumbnail TRUE)
   */
  static Future<PhotoWithThumbnail> createPhotoWithThumbnailFromPdfData(
      Uint8List fileData, String name, int pageNumber) async {
    final document = await PdfDocument.openData(fileData);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(
        width: page.width, height: page.height, format: PdfPageImageFormat.png);
    await page.close();
    if (pageImage == null) {
      throw Exception("Can't find render image $name");
    }
    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }
    int thumbnailWidth = 0;
    int thumbnailHeight = 0;
    if (img.width > img.height) {
      thumbnailWidth = thumbnailSize;
    } else {
      thumbnailHeight = thumbnailSize;
    }
    var thumbnail = imgpackage.copyResize(img,
        width: thumbnailWidth, height: thumbnailHeight);
    var thumbNailData = Uint8List.fromList(imgpackage.encodePng(thumbnail));

    var baseName = '$name.png';
    var thumbnailBaseName = '$name.thumbnail.png';
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
      String memberMediumDocumentID, String filePath, int pageNumber) async {
    final document = await PdfDocument.openFile(filePath);
    final page = await document.getPage(pageNumber);
    final pageImage = await page.render(width: page.width, height: page.height);
    await page.close();
    if (pageImage == null) {
      throw Exception("Can't find render image $filePath");
    }

    var img = imgpackage.decodeImage(pageImage.bytes);
    if (img == null) {
      throw Exception('Could not decode image');
    }

    return ImageData(
        baseName: BaseNameHelper.baseName(memberMediumDocumentID, filePath),
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
