import 'package:eliud_core/model/icon_model.dart';
import 'package:flutter/cupertino.dart';

typedef OnSelection = void Function(int choice);

abstract class AbstractMenuItemAttributes {
  final String? label;
  final IconModel? icon;
  final String? imageURL;
  final bool isActive;

  AbstractMenuItemAttributes(
      {required this.label, this.imageURL, this.icon, required this.isActive});
}

class MenuItemAttributes extends AbstractMenuItemAttributes {
  final VoidCallback onTap;

  MenuItemAttributes(
      {required bool isActive,
        required this.onTap,
        String? label,
        String? imageURL,
        IconModel? icon})
      : super(label: label, imageURL: imageURL, icon: icon, isActive: isActive);
}

class MenuItemWithMenuItems extends AbstractMenuItemAttributes {
  List<AbstractMenuItemAttributes> items;

  MenuItemWithMenuItems(
      {required this.items, required String label, IconModel? icon, required bool isActive})
      : super(label: label, icon: icon, isActive: isActive);
}
