import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';
import 'types.dart';

class AppbarHeaderAttributes {
  final String? title;
  final IconModel? icon;
  final MemberMediumModel? memberMediumModel;
  final HeaderSelection header;

  AppbarHeaderAttributes(
      {this.title, this.icon, this.memberMediumModel, required this.header});
}

abstract class HasAppBar {
  PreferredSizeWidget appBar(AppModel app, BuildContext context,
      {required AppbarHeaderAttributes headerAttributes,
      required String pageName,
      required MemberModel? member,
      List<AbstractMenuItemAttributes>? items,
      BackgroundModel? backgroundOverride,
      RgbModel? menuBackgroundColorOverride,
      RgbModel? selectedIconColorOverride,
      RgbModel? iconColorOverride,
      VoidCallback? openDrawer,
      Key? key});
}

PreferredSizeWidget appBar(AppModel app, BuildContext context,
    {required AppbarHeaderAttributes headerAttributes,
      required MemberModel? member,
      required String pageName,
      List<AbstractMenuItemAttributes>? items,
      BackgroundModel? backgroundOverride,
      RgbModel? menuBackgroundColorOverride,
      RgbModel? selectedIconColorOverride,
      RgbModel? iconColorOverride,
      VoidCallback? openDrawer,
      Key? key}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .appBarStyle()
        .appBar(app, context,
        headerAttributes: headerAttributes,
        member: member,
        pageName: pageName,
        items: items,
        backgroundOverride: backgroundOverride,
        menuBackgroundColorOverride: menuBackgroundColorOverride,
        selectedIconColorOverride: selectedIconColorOverride,
        iconColorOverride: iconColorOverride,
        openDrawer: openDrawer,
        key: key);
