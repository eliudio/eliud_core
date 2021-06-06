import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../util/page_helper.dart';

class PopupMenuWidget {
  final String? currentPage;
  final AppModel? app;

  PopupMenuWidget(this.app, this.currentPage);

  void openMenu(BuildContext context, PopupMenu popupMenu, RgbModel? popupMenuBackgroundColor, RelativeRect position) async {
    MenuDefModel menuDef = popupMenu.menuDef!;
    var popupMenuItems = <PopupMenuItem<int>>[];
    int i = 0;
    menuDef.menuItems!.forEach((element) {
      TextStyle? style = PageHelper.isActivePage(currentPage, element.action) ? FontTools.textStyle(app!.h3) : FontTools.textStyle(app!.h4);
      PopupMenuItem<int> p = PopupMenuItem<int>(value: i, child: Text(element.description!, style: style));
      popupMenuItems.add(p);
      i++;
    });

    final result = await showMenu<int>(
      context: context,
      position: position,
      items: popupMenuItems,
      elevation: 8.0,
      color: RgbHelper.color(rgbo: popupMenuBackgroundColor)
    );
    if (result != null) {
      MenuItemModel subItem = menuDef.menuItems![result];
      eliudrouter.Router.navigateTo(context, subItem.action!);
    }
  }
}
