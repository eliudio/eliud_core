import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/shared/has_profile_photo.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudProfilePhotoImpl implements HasProfilePhoto {
  final EliudStyle _eliudStyle;

  EliudProfilePhotoImpl(this._eliudStyle);

  @override
  Widget getProfilePhotoButtonFromMember(BuildContext context, MemberModel? member, RgbModel? iconColor, VoidCallback? onPressed) {
    if (member != null) {
      var url = member.photoURL;
      if (url != null) {
        return getProfilePhotoButtonFromURL(context, url, iconColor, onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context, null, iconColor, onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context, RgbModel? iconColor, VoidCallback? onPressed) {
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var member = state.getMember();
      if (member != null) {
        return getProfilePhotoButtonFromURL(context, member.photoURL, iconColor, onPressed);
      }
    }
    return getProfilePhotoButtonFromURL(context, null, iconColor, onPressed);
  }

  @override
  Widget getProfilePhotoButtonFromURL(BuildContext context, String? url, RgbModel? iconColor, VoidCallback? onPressed) {
    if (url != null) {
      return _formatProfilePhotoButton(Image.network(
          url
      ), onPressed);
    } else {
      return _defaultProfile(iconColor);
    }
  }

  Widget _defaultProfile(RgbModel? color) {
    return Icon(Icons.person_outline,
        color: color != null ? RgbHelper.color(rgbo: color) : null);
  }

  Widget _formatProfilePhotoButton(Widget widget, VoidCallback? onPressed) {
    return IconButton(
      icon: CircleAvatar(
        radius: 30.0,
        child: ClipOval(
            child: widget),
        backgroundColor: Colors.transparent,
      ),
      onPressed: onPressed,
    );
  }
}
