import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_profile_photo.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class ProfilePhotoHelper {
  Widget getProfilePhotoButtonFromMember(BuildContext context,
      {MemberModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (member != null) {
      var url = member.photoURL;
      if (url != null) {
        return getProfilePhotoButtonFromURL(context,
            radius: radius,
            url: url,
            iconColor: iconColor,
            onPressed: onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context,
        url: null, radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  Widget getProfilePhotoButtonFromPublicMember(BuildContext context,
      {MemberPublicInfoModel? member,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (member != null) {
      var url = member.photoURL;
      if (url != null) {
        return getProfilePhotoButtonFromURL(context,
            url: url,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context,
        url: null, radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  Widget getProfilePhotoButtonFromExternalProvider(BuildContext context,
      {required ExternalProfileURLProvider externalProfileURLProvider,
      BackupProfileURLProvider? fallBackURLProvider,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    return FutureBuilder<ProfileAttributes>(
        future: externalProfileURLProvider(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var profileAttributes = snapshot.data;
            if ((profileAttributes == null) ||
                (profileAttributes.url == null)) {
              return _defaultProfile(iconColor, onPressed, radius);
            } else {
              return _formatProfilePhotoButton(
                  Image.network(profileAttributes.url!), iconColor, radius, onPressed);
            }
          }
          return StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context);
        });
  }

  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context,
      {RgbModel? iconColor, required double radius, VoidCallback? onPressed}) {
    var state = AccessBloc.getState(context);
    if (state is AccessDetermined) {
      var member = state.getMember();
      if (member != null) {
        return getProfilePhotoButtonFromURL(context,
            url: member.photoURL,
            radius: radius,
            iconColor: iconColor,
            onPressed: onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context,
        url: null, radius: radius, iconColor: iconColor, onPressed: onPressed);
  }

  Widget getProfilePhotoButtonFromURL(BuildContext context,
      {String? url,
      required double radius,
      RgbModel? iconColor,
      VoidCallback? onPressed}) {
    if (url != null) {
      return _formatProfilePhotoButton(Image.network(url), iconColor, radius, onPressed);
    } else {
      return _defaultProfile(iconColor, onPressed, radius);
    }
  }

  Widget _defaultProfile(RgbModel? color, VoidCallback? onPressed, double radius) {
    return _formatProfilePhotoButton(Icon(Icons.person_outline, size: radius,
        color: color != null ? RgbHelper.color(rgbo: color) : null), color, radius, onPressed);
  }

  Widget _formatProfilePhotoButton(
      Widget widget, RgbModel? iconColor, double radius, VoidCallback? onPressed) {
    return GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
            radius: radius,
            backgroundColor: iconColor == null ? Colors.black : RgbHelper.color(rgbo: iconColor),            // border color
            child: CircleAvatar(
              radius: radius-2,
              backgroundColor: Colors.white,         // background color
              child: CircleAvatar(
                radius: radius - 4,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: widget,
                ),
              ),
            )));
  }
}
