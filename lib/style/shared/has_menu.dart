import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:flutter/material.dart';

abstract class HasMenu {
  Future<void> openMenu(BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride});
}
