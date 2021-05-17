import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/basename_helper.dart';
import 'package:eliud_core/tools/storage/medium_base.dart';
import 'package:eliud_core/tools/storage/medium_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

/*
 * I asssume we want a member storage section on firebase storage. A bucket / directory.
 * I assume we want a model representation of these files which we can use
 * to reference from within a feed, from a gallery, etc...
 * I assume these photos are stored in /appId/memberId/...
 * I assume we might want to have a ui to allow to organise photos in a user image repository
 */
typedef void PhotoWithThumbnailAvailable(PhotoWithThumbnail photoWithThumbnail);
typedef void VideoWithThumbnailAvailable(VideoWithThumbnail videoWithThumbnail);

abstract class AbstractStoragePlatform {
  static AbstractStoragePlatform? platform;

  /*
   * Allows the user to take a photo
   * When photo is selected feedbackFunction is triggered
   */
  void takePhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction);

  /*
   * Allows the user to take a photo
   * When photo is selected feedbackFunction is triggered
   */
  void takeVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction);

  void uploadPhoto(BuildContext context, PhotoWithThumbnailAvailable feedbackFunction);

  /*
   * Allows the user to select a photo from library
   * When photo is selected feedbackFunction is triggered
   */
  void uploadVideo(BuildContext context, VideoWithThumbnailAvailable feedbackFunction);

  bool hasCamera();
}