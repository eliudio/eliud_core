import 'package:eliud_core/platform/storage_platform.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/medium_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class MobileStoragePlatform extends AbstractStoragePlatform {
  MobileStoragePlatform() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> pickImage(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction, ImgSource source) async {
    var _image = await ImagePickerGC.pickImage(
      enableCloseButton: true,
      closeIcon: Icon(
        Icons.close,
        color: Colors.red,
        size: 12,
      ),
      context: context,
      source: source,
      barrierDismissible: true,
      cameraIcon: Icon(
        Icons.camera_alt,
        color: Colors.red,
      ),
    );
    var baseName = BaseNameHelper.baseName(_image.path);
    var thumbnailBaseName = BaseNameHelper.thumbnailBaseName(_image.path);
    var bytes = await _image.readAsBytes();
    var thumbnailInfo = await MediumData.enrichPhoto(baseName, thumbnailBaseName, bytes);
    feedbackFunction(thumbnailInfo);
  }

  @override
  void takePhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction) {
    pickImage(context, feedbackFunction, ImgSource.Camera);
  }

  @override
  void takeVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction) {
  }

  @override
  bool hasCamera() => true;

  @override
  Future<void> uploadPhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction) async {
    var _result = await FilePicker.platform.pickFiles(type: FileType.image);
    return processPhotos(_result, feedbackFunction);
  }

  @override
  Future<void> uploadVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction) async {
    var _result = await FilePicker.platform.pickFiles(type: FileType.video);
    return processVideos(_result, feedbackFunction);
  }

  Future<void> processPhotos(FilePickerResult? result, PhotoWithThumbnailAvailable feedbackFunction,) async {
    if (result != null) {
      for (var aFile in result.files) {
        var path = aFile.path;
        if (path != null) {
          var thumbnailInfo = await MediumData.enrichPhotoWithPath(path);
          feedbackFunction(thumbnailInfo);
        } else {
          print("Can't read file: path is null");
        }
      }
    }
  }

  Future<void> processVideos(FilePickerResult? result, VideoWithThumbnailAvailable feedbackFunction,) async {
    if (result != null) {
      for (var aFile in result.files) {
        var path = aFile.path;
        if (path != null) {
          var enrichedVideo = await MediumData.enrichVideoWithPath(path);
          feedbackFunction(enrichedVideo);
        } else {
          print("Can't read file: path is null");
        }
      }
    }
  }
}
