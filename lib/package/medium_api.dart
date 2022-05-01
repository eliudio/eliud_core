import 'dart:typed_data';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/storage/upload_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'access_rights.dart';

/*
 * I asssume we want a member storage section on firebase storage. A bucket / directory.
 * I assume we want a model representation of these files which we can use
 * to reference from within a feed, from a gallery, etc...
 * I assume these photos are stored in /appId/memberId/...
 * I assume we might want to have a ui to allow to organise photos in a user image repository
 */
typedef void MediumAvailable(dynamic? mediumModel);
typedef AccessRights AccessRightsProvider();

abstract class MediumApi {
  void showPhotos(BuildContext context, AppModel app,
      List<MemberMediumModel> media, int initialPage);
  void showPhotosPlatform(BuildContext context, AppModel app,
      List<PlatformMediumModel> media, int initialPage);
  void showPhotosPublic(BuildContext context, AppModel app,
      List<PublicMediumModel> media, int initialPage);
  Future<void> showVideo(
      BuildContext context, AppModel app, MemberMediumModel memberMediumModel);
  Future<void> showVideoPlatform(BuildContext context, AppModel app,
      PlatformMediumModel platformMediumModel);
  void takePhoto(
      BuildContext context,
      AppModel app,
      String ownerId,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress,
      {bool? allowCrop});
  void takeVideo(
      BuildContext context,
      AppModel app,
      String ownerId,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress);
  void uploadPhoto(
      BuildContext context,
      AppModel app,
      String ownerId,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress,
      {bool? allowCrop});
  void uploadVideo(
      BuildContext context,
      AppModel app,
      String ownerId,
      AccessRightsProvider accessRightsProvider,
      MediumAvailable feedbackFunction,
      FeedbackProgress? feedbackProgress);
  bool hasCamera();
  bool hasAccessToAssets();
  bool hasAccessToLocalFilesystem();

  /* Allow to add an imnage / upload / ... */
  Widget getPublicPhotoWidget(
      {Key? key,
      required String title,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required PublicMediumModel? initialImage});
  Widget getPlatformPhotoWidget(
      {Key? key,
      required String title,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required PlatformMediumModel? initialImage});
  /*
   * Currently default / only access is public. Should expand the api to allow to change
   */
  Widget getMemberPhotoWidget(
      {Key? key,
      required String title,
      required BuildContext context,
      required AppModel app,
      String?
          defaultImage, // asset location of default image which the user can choose
      required MediumAvailable feedbackFunction,
      required MemberMediumModel? initialImage});
}
