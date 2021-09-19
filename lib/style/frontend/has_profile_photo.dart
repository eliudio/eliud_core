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
  Widget getProfilePhotoButtonFromMember(BuildContext context,
      {MemberModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
  Widget getProfilePhotoButtonFromPublicMember(BuildContext context,
      {MemberPublicInfoModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
  Widget getProfilePhotoButtonFromExternalProvider(BuildContext context,
      {required ExternalProfileURLProvider externalProfileURLProvider,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});

  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context,
      {RgbModel? iconColor, required double radius, VoidCallback? onPressed});

  Widget getProfilePhotoButtonFromURL(BuildContext context,
      {String? url,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed});
}

Widget getProfilePhotoButtonFromMember(BuildContext context,
        {MemberModel? member,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromMember(context,
            member: member,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromPublicMember(BuildContext context,
        {MemberPublicInfoModel? member,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromPublicMember(context,
            member: member,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromExternalProvider(BuildContext context,
        {required ExternalProfileURLProvider externalProfileURLProvider,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromExternalProvider(context,
            externalProfileURLProvider: externalProfileURLProvider,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);

Widget getProfilePhotoButtonFromCurrentMember(BuildContext context,
        {RgbModel? iconColor,
        required double radius,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromCurrentMember(context,
            iconColor: iconColor, radius: radius, onPressed: onPressed);

Widget getProfilePhotoButtonFromURL(BuildContext context,
        {String? url,
        required double radius,
        RgbModel? iconColor,
        VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .profilePhotoStyle()
        .getProfilePhotoButtonFromURL(context,
            url: url,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);
