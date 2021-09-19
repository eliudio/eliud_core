import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import '../style_registry.dart';
import 'types.dart';
import 'package:flutter/material.dart';

abstract class HasBottomNavigationBar {
  Widget bottomNavigationBar(
    BuildContext context, {
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
    Key? key,
  });
}

Widget bottomNavigationBar(
  BuildContext context, {
  BackgroundModel? backgroundOverride,
  RgbModel? popupMenuBackgroundColorOverride,
  required List<AbstractMenuItemAttributes> items,
  Key? key,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .bottomNavigationBarStyle()
        .bottomNavigationBar(
          context,
          backgroundOverride: backgroundOverride,
          popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride,
          items: items,
          key: key,
        );
