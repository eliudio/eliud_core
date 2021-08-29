import '../helper/menu_helper.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_menu.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultMenuImpl implements HasMenu {
  final FrontEndStyle _frontEndStyle;

  DefaultMenuImpl(this._frontEndStyle);

  @override
  Future<void> openMenu(BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride}) async {
    return MenuHelper(_frontEndStyle).openMenu(context, position: position, menuItems: menuItems, popupMenuBackgroundColor:  popupMenuBackgroundColorOverride);
  }
}
