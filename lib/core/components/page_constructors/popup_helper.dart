import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/core/components/page_helper.dart';

class PopupHelper {
  final String currentPage;
  final MemberModel member;
  final AppModel app;
  final AccessState state;

  PopupHelper(this.app, this.state, this.currentPage, this.member);

  Widget popupMenuButton(
      BuildContext context,
      MenuDefModel menu,
      Widget text,
      Icon icon,
      RgbModel menuBackgroundColor) {
    var theState = state;
    if (theState is AccessStateWithDetails) {
      if (menu.menuItems.isEmpty) return null;
      var menuItems = <MenuItemModel>[];
      for (var i = 0; i < menu.menuItems.length; i++) {
        var item = menu.menuItems[i];
        if (theState.hasAccess(item)) menuItems.add(item);
      }
      return PopupMenuButton<int>(
          icon: icon,
          child: icon == null ? text : null,
          onSelected: (int result) {
            var item = menuItems[result];
            var action = item.action;
            if (action is PopupMenu) {
              PopupMenuWidget(app, currentPage).openMenu(
                context,
                action,
                menuBackgroundColor,
                RelativeRect.fromLTRB(1000.0, 0.0, 0.0, 0.0),
              );
            } else {
              if (!PageHelper.isActivePage(currentPage, action)) {
                eliudrouter.Router.navigateTo(context, action);
              }
            }
          },
          itemBuilder: (BuildContext context) {
            var entries = <PopupMenuEntry<int>>[];
            var index = 0;
            menuItems.forEach((item) {
              var style = PageHelper.isActivePage(
                  currentPage, item.action)
                  ? FontTools.textStyle(app.h3)
                  : FontTools.textStyle(app.h4);
              var description = item.description;
              var menuItem = PopupMenuItem<int>(
                value: index,
                child: Text(description),
                textStyle: style,
              );
              entries.add(menuItem);
              index++;
            });

            return entries;
          });
    } else {
      return null;
    }
  }
}
