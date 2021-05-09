import 'package:eliud_core/model/member_medium_model.dart';
import 'package:flutter/cupertino.dart';

/*
 * I asssume we want a member storage section on firebase storage. A bucket / directory.
 * I assume we want a model representation of these files which we can use
 * to reference from within a feed, from a gallery, etc...
 * I assume these photos are stored in /appId/memberId/...
 * I assume we might want to have a ui to allow to organise photos in a user image repository
 */
typedef void MediumAvailable(String path);

abstract class AbstractStoragePlatform {
  static AbstractStoragePlatform? platform;

  /*
   * Allows the user to take a photo or record a video.
   * The picture is stored onto firestore, together with a thumbnail
   */
  void takeMedium(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);

  /*
   * Allows the user to upload a medium
   * The picture is stored onto firestore, together with a thumbnail
   */
  void uploadMedium(BuildContext context, String? appId, MediumAvailable? feedbackFunction, String? memberId);
}
