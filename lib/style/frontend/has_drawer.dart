import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'types.dart';
import 'package:flutter/material.dart';

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
  Drawer drawer(BuildContext context,
      {required DrawerType drawerType,
        Key? key,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items});
}
