import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';
import 'types.dart';

enum DrawerType { Left, Right }

class DrawerHeader1Attributes {
  final double? height;
  final String text;
  final BackgroundModel? backgroundOverride;

  DrawerHeader1Attributes(this.height, this.text, this.backgroundOverride);
}

class DrawerHeader2Attributes {
  final double? height;
  final String text;

  DrawerHeader2Attributes(this.height, this.text);
}

class DrawerItemAttributes {
  final MenuItemModel menuItemModel;
  final bool isActive;

  DrawerItemAttributes(this.menuItemModel, this.isActive);
}

abstract class HasDrawer {
  Drawer drawer(AppModel app, BuildContext context,
      {required DrawerType drawerType,
      required MemberModel? member,
      Key? key,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items});
}

Drawer drawer(AppModel app, BuildContext context,
        {required DrawerType drawerType,
        required MemberModel? member,
        Key? key,
        DrawerHeader1Attributes? header1,
        DrawerHeader2Attributes? header2,
        BackgroundModel? backgroundOverride,
        RgbModel? popupMenuBackgroundColorOverride,
        required List<AbstractMenuItemAttributes> items}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .drawerStyle()
        .drawer(app, context,
            drawerType: drawerType,
            member: member,
            key: key,
            header1: header1,
            header2: header2,
            backgroundOverride: backgroundOverride,
            popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride,
            items: items);

