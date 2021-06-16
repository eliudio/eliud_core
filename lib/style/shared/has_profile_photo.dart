import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

abstract class HasProfilePhoto {
  Widget getProfilePhotoButtonFromMember(BuildContext context, MemberModel? member, RgbModel? iconColor, VoidCallback? onPressed);
  Widget getProfilePhotoButtonFromCurrentMember(BuildContext context, RgbModel? iconColor, VoidCallback? onPressed);
  Widget getProfilePhotoButtonFromURL(BuildContext context, String? url, RgbModel? iconColor, VoidCallback? onPressed);
}
