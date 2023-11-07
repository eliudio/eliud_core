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
      {required super.isActive,
      required this.onTap,
      super.label,
      super.imageURL,
      super.icon});
}

class MenuItemWithMenuItems extends AbstractMenuItemAttributes {
  List<AbstractMenuItemAttributes> items;

  MenuItemWithMenuItems(
      {required this.items,
      required String super.label,
      super.icon,
      required super.isActive});
}
