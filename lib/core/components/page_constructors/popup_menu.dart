import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../util/page_helper.dart';

class PopupMenuWidget {
  final String? currentPage;
  final AppModel? app;

  PopupMenuWidget(this.app, this.currentPage);

  void openMenu(BuildContext context, {required PopupMenu popupMenu,
      RgbModel? popupMenuBackgroundColorOverride, required RelativeRect position}) async {
    var i = 0;
    var menuItems = popupMenu.menuDef!.menuItems!.map((element) {
      var isActive = PageHelper.isActivePage(currentPage, element.action);
      i++;
      return MenuItemAttributes(i, element.description!, isActive);
    }).toList();

    await StyleRegistry.registry().styleWithContext(context).frontEndStyle().openMenu(context, position: position, menuItems: menuItems, popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride, onSelected: (result) {
      var subItem = popupMenu.menuDef!.menuItems![result];
      eliudrouter.Router.navigateTo(context, subItem.action!);
    });
  }
}
