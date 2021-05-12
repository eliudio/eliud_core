import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/storage/firestore_helper.dart';
import 'package:flutter/cupertino.dart';

/*
 * I asssume we want a member storage section on firebase storage. A bucket / directory.
 * I assume we want a model representation of these files which we can use
 * to reference from within a feed, from a gallery, etc...
 * I assume these photos are stored in /appId/memberId/...
 * I assume we might want to have a ui to allow to organise photos in a user image repository
 */
typedef void MediumAvailable(MediumAndItsThumbnailData mediumAndItsThumbnailData);

abstract class AbstractStoragePlatform {
  static AbstractStoragePlatform? platform;

  /*
   * Allows the user to take a photo
   * When photo is selected feedbackFunction is triggered
   */
  void takePhoto(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);

  /*
   * Allows the user to select a photo from library
   * When photo is selected feedbackFunction is triggered
   */
  void uploadPhoto(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);

  /*
   * Allows the user to take a photo
   * When photo is selected feedbackFunction is triggered
   */
  void takeVideo(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);

  /*
   * Allows the user to select a photo from library
   * When photo is selected feedbackFunction is triggered
   */
  void uploadVideo(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);
}
