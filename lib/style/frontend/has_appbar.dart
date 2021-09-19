import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import '../style_registry.dart';
import 'types.dart';
import 'package:flutter/material.dart';

class AppbarHeaderAttributes {
  final String? title;
  final IconModel? icon;
  final MemberMediumModel? memberMediumModel;
  final HeaderSelection header;

  AppbarHeaderAttributes(
      {this.title, this.icon, this.memberMediumModel, required this.header});
}

class AppbarPlaystoreAttributes {}

abstract class HasAppBar {
  PreferredSizeWidget appBar(BuildContext context,
      {required AppbarHeaderAttributes headerAttributes,
      required String pageName,
      List<AbstractMenuItemAttributes>? items,
      BackgroundModel? backgroundOverride,
      RgbModel? menuBackgroundColorOverride,
      RgbModel? selectedIconColorOverride,
      RgbModel? iconColorOverride,
      VoidCallback? openDrawer,
      Key? key});
}

PreferredSizeWidget appBar(BuildContext context,
        {required AppbarHeaderAttributes headerAttributes,
        required String pageName,
        List<AbstractMenuItemAttributes>? items,
        BackgroundModel? backgroundOverride,
        RgbModel? menuBackgroundColorOverride,
        RgbModel? selectedIconColorOverride,
        RgbModel? iconColorOverride,
        VoidCallback? openDrawer,
        Key? key}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .appBarStyle()
        .appBar(context,
            headerAttributes: headerAttributes,
            pageName: pageName,
            items: items,
            backgroundOverride: backgroundOverride,
            menuBackgroundColorOverride: menuBackgroundColorOverride,
            selectedIconColorOverride: selectedIconColorOverride,
            iconColorOverride: iconColorOverride,
            openDrawer: openDrawer,
            key: key);
