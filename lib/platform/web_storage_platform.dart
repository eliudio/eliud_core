import 'package:eliud_core/platform/storage_platform.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/medium_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebStoragePlatform extends AbstractStoragePlatform {

  @override
  void takePhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction) {
  }

  @override
  void takeVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction) {
  }

  @override
  bool hasCamera() => false;

  Future<void> uploadPhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction) async {
    var _result = await FilePicker.platform.pickFiles(type: FileType.image);
    return processPhotos(_result, feedbackFunction);
  }

  Future<void> uploadVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction) async {
    var _result = await FilePicker.platform.pickFiles(type: FileType.video);
    return processVideos(_result, feedbackFunction);
  }

  Future<void> processPhotos(FilePickerResult? result, PhotoWithThumbnailAvailable feedbackFunction,) async {
    if (result != null) {
      for (var aFile in result.files) {
        var baseName = aFile.name!;
        var thumbnailBaseName = aFile.extension!;
        var bytes = await aFile.bytes;
        if (bytes != null) {
          var thumbnailInfo = await MediumData.enrichPhoto(
              baseName, thumbnailBaseName, bytes);

          feedbackFunction(thumbnailInfo);
        } else {
          print('bytes is null!');
        }
      }
    }
  }

  Future<void> processVideos(FilePickerResult? result, VideoWithThumbnailAvailable feedbackFunction,) async {
    if (result != null) {
      for (var aFile in result.files) {
        var bytes = aFile.bytes;
        if (bytes == null) throw Exception('Could not process video. Bytes is null');
        var name = aFile.name;
        if (name == null) throw Exception('Could not process video. Name is null');
        var ext = aFile.extension;
        if (ext == null) throw Exception('Could not process video. Ext is null');

        var baseName = BaseNameHelper.baseNameExt(name, ext);
        var thumbnailBaseName = BaseNameHelper.thumbnailBaseNameExt(name, ext);
        var thumbnailInfo = await MediumData.enrichVideo(baseName, thumbnailBaseName, aFile.bytes!);

        feedbackFunction(thumbnailInfo);
      }
    }
  }
}
