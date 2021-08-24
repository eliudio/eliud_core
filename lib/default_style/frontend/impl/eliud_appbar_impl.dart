import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/frontend/helper/appbar_helper.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_appbar.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';
import 'eliud_menu_impl.dart';

class EliudAppBarImpl implements HasAppBar {
  final EliudStyle _eliudStyle;

  EliudAppBarImpl(this._eliudStyle);

  @override
  PreferredSizeWidget appBar(BuildContext context,
      {required AppbarHeaderAttributes headerAttributes,
      required String pageName,
      List<AbstractMenuItemAttributes>? items,
      BackgroundModel? backgroundOverride,
      RgbModel? menuBackgroundColorOverride,
      RgbModel? selectedIconColorOverride,
      RgbModel? iconColorOverride,
      VoidCallback? openDrawer,
      Key? key}) {
    var appBarHelper = AppBarHelper(_eliudStyle, EliudMenuImpl(_eliudStyle));
    var _title = appBarHelper.title(context, headerAttributes, pageName);

    var iconThemeData = IconThemeData(color: RgbHelper.color(rgbo: iconColorOverride));

    // add menu items
    List<Widget>? buttons;
    if (items != null) {
      buttons = items
          .map((item) => appBarHelper.button(
              context, item, menuBackgroundColorOverride, selectedIconColorOverride, iconColorOverride))
          .toList();
    } else {
      buttons = [];
    }

    // add profilePhoto
    var member = AccessBloc.member(context);
    if (member != null) {
      buttons.add(_eliudStyle
          .frontEndStyle()
          .profilePhotoStyle()
          .getProfilePhotoButtonFromMember(context,
              member: member,
              radius: 20,
              iconColor: EliudColors.white,
              onPressed: openDrawer));
    }

    var state = AccessBloc.getState(context);
    return AppBar(
        key: key,
        iconTheme: iconThemeData,
        title: _title,
        actions: buttons,
        flexibleSpace: Container(
            decoration: BoxDecorationHelper.boxDecoration(state, backgroundOverride)));
  }
}
