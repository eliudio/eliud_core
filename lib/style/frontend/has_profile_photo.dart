import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

class ProfileAttributes {
  final String? url;
  final String name;

  ProfileAttributes(this.name, this.url);
}

/*
 * Returns a future which represents the url of a profile. Can be used to use a profile from an collection
 */
typedef ExternalProfileURLProvider = Future<ProfileAttributes> Function();

typedef BackupProfileURLProvider = String? Function();

abstract class HasProfilePhoto {
  Widget getProfilePhotoButtonFromMember(AppModel app, BuildContext context,
      {MemberModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
  Widget getProfilePhotoButtonFromPublicMember(AppModel app, BuildContext context,
      {MemberPublicInfoModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
  Widget getProfilePhotoButtonFromExternalProvider(AppModel app, BuildContext context,
      {required ExternalProfileURLProvider externalProfileURLProvider,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});

  Widget getProfilePhotoButtonFromCurrentMember(AppModel app, BuildContext context,
      {RgbModel? iconColor, required double radius, VoidCallback? onPressed});

  Widget getProfilePhotoButtonFromURL(AppModel app, BuildContext context,
      {String? url,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
}

Widget getProfilePhotoButtonFromMember(AppModel app, BuildContext context,
        {MemberModel? member,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromMember(app, context,
            member: member,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromPublicMember(AppModel app, BuildContext context,
        {MemberPublicInfoModel? member,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromPublicMember(app, context,
            member: member,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromExternalProvider(AppModel app, BuildContext context,
        {required ExternalProfileURLProvider externalProfileURLProvider,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromExternalProvider(app, context,
            externalProfileURLProvider: externalProfileURLProvider,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromCurrentMember(AppModel app, BuildContext context,
        {RgbModel? iconColor,
        required double radius,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromCurrentMember(app, context,
            iconColor: iconColor, radius: radius, onPressed: onPressed);

Widget getProfilePhotoButtonFromURL(AppModel app, BuildContext context,
        {String? url,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromURL(app, context,
            url: url,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);
