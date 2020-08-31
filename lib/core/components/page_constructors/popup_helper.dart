import 'package:eliud_core/core/access/bloc/access_details.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/components/page_helper.dart';

class PopupHelper {
  final String currentPage;
  final MemberModel member;
  final AccessDetails accessDetails;

  PopupHelper(this.currentPage, this.member, this.accessDetails);

  Widget popupMenuButton(
      BuildContext context,
      MenuDefModel menu,
      Widget text,
      Icon icon,
      RgbModel menuBackgroundColor) {
    if (menu.menuItems.length == 0) return null;
    List<MenuItemModel> menuItems = List();
    for (int i = 0; i < menu.menuItems.length; i++) {
      MenuItemModel item = menu.menuItems[i];
      if (accessDetails.hasAccess(item)) menuItems.add(item);
    }
//          if (snapshot.data == null) deal with it;
//          if (snapshot.data.length < 2) deal with it;

    return PopupMenuButton<int>(
        icon: icon,
        child: icon == null ? text : null,
        onSelected: (int result) {
          MenuItemModel item = menuItems[result];
          ActionModel action = item.action;
          if (action is PopupMenu) {
            PopupMenuWidget(currentPage).openMenu(
              context,
              action,
              menuBackgroundColor,
              RelativeRect.fromLTRB(1000.0, 0.0, 0.0, 0.0),
            );
          } else {
            if (!PageHelper.isActivePage(currentPage, action))
              eliudrouter.Router.navigateTo(context, action);
          }
        },
        itemBuilder: (BuildContext context) {
          var entries = List<PopupMenuEntry<int>>();
          int index = 0;
          menuItems.forEach((item) {
            TextStyle style = PageHelper.isActivePage(currentPage, item.action) ? FontTools.textStyle(GlobalData.app().h3) : FontTools.textStyle(GlobalData.app().h4);
            String description = item.description;
            var menuItem = PopupMenuItem<int>(
              value: index,
              child: new Text(description),
              textStyle: style,
            );
            entries.add(menuItem);
            index++;
          });

          return entries;
        });
  }
}
