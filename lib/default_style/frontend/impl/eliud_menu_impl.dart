import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/has_menu.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudMenuImpl implements HasMenu {
  final EliudStyle _eliudStyle;

  EliudMenuImpl(this._eliudStyle);

  @override
  Future<void> openMenu(BuildContext context, {required RelativeRect position, required List<AbstractMenuItemAttributes> menuItems, RgbModel? popupMenuBackgroundColorOverride}) async {
    var popupMenuBackgroundColor;
    if (popupMenuBackgroundColorOverride == null) {
      popupMenuBackgroundColor = _eliudStyle.eliudStyleAttributesModel.backgroundColorHomeMenu;
    } else {
      popupMenuBackgroundColor = popupMenuBackgroundColorOverride;
    }
     var popupMenuItems = <PopupMenuItem<int>>[];
      var i = 0;
      menuItems!.forEach((element) {
        var style = element.isActive
            ? _eliudStyle.frontEndStyle()
            .styleH3(context)
            : _eliudStyle.frontEndStyle()
            .styleH4(context);
        var p = PopupMenuItem<int>(
            value: i, child: Text(element.label!, style: style));
        popupMenuItems.add(p);
        i++;
      });

      final result = await showMenu<int>(
          context: context,
          position: position,
          items: popupMenuItems,
          elevation: 8.0,
          color: RgbHelper.color(rgbo: popupMenuBackgroundColor));
      if (result != null) {
        var item = menuItems[result];
        if (item is MenuItemAttributes) {
          item.onTap();
        } else if (item is MenuItemWithMenuItems) {
          await openMenu(context, position: position, menuItems: item.items, popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride);
        }
      }
  }
}

