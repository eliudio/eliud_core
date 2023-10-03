import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'types.dart';
import 'package:flutter/material.dart';
import '../style_registry.dart';

abstract class HasMenu {
  Future<void> openMenu(AppModel app, BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride});
}

Future<void> openMenu(AppModel app, BuildContext context,
    {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .menuStyle()
        .openMenu(app, context,
        position: position,
          menuItems: menuItems,
          popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride);