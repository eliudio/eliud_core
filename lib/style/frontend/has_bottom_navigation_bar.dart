import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';
import 'types.dart';

abstract class HasBottomNavigationBar {
  Widget bottomNavigationBar(AppModel app,
      BuildContext context, {
    required MemberModel? member,
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
    Key? key,
  });
}

Widget bottomNavigationBar(AppModel app,
    BuildContext context, {
      required MemberModel? member,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items,
      Key? key,
    }) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .bottomNavigationBarStyle()
        .bottomNavigationBar(app,
      context,
      member: member,
      backgroundOverride: backgroundOverride,
      popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride,
      items: items,
      key: key,
    );
