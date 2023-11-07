import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/tools/page_helper.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'document_processor.dart';

class MenuItemMapper {
  static Future<List<AbstractMenuItemAttributes>> mapMenu(BuildContext context,
      MenuDefModel menu, MemberModel? member, String? currentPage) async {
    try {
      var itemList = <AbstractMenuItemAttributes>[];
      for (var i = 0; i < menu.menuItems!.length; i++) {
        var item = menu.menuItems![i];
        var menuItem = await mapMenuItem(context, item, member, currentPage);
        if (menuItem != null) {
          itemList.add(menuItem);
        }
      }
      return itemList;
    } catch (e) {
      throw Exception('Exception during mapMenu');
    }
  }

  static Future<AbstractMenuItemAttributes?> mapMenuItem(BuildContext context,
      MenuItemModel item, MemberModel? member, String? currentPage) async {
    var action = item.action;
    if (action == null) return null;
    if ((action is InternalAction) &&
        (action.internalActionEnum == InternalActionEnum.otherApps)) {
      if ((member != null) && (member.subscriptions != null)) {
        var items = <MenuItemAttributes>[];
        for (var value in member.subscriptions!) {
          if (value.app != null) {
            items.add(MenuItemAttributes(
                label: value.app!.title == null ? '?' : value.app!.title!,
                isActive: false,
                onTap: () => eliudrouter.Router.navigateTo(context,
                    SwitchApp(value.app!, toAppID: value.app!.documentID))));
          }
        }
        return MenuItemWithMenuItems(
          icon: item.icon,
          label: 'Switch to...',
          items: items,
          isActive: false,
        );
      }
    } else {
      if (action is PopupMenu) {
        var items = <AbstractMenuItemAttributes>[];
        var hasActive = false;
        if (action.menuDef != null) {
          for (var item in action.menuDef!.menuItems!) {
//          action.menuDef!.menuItems!.forEach((item) async {
            var newItem = await mapMenuItem(context, item, member, currentPage);
            if (newItem != null) {
              items.add(newItem);
              hasActive = hasActive || newItem.isActive;
            }
          }
          if (items.isNotEmpty) {
            return MenuItemWithMenuItems(
              icon: item.icon,
              label: item.text == null ? '?' : item.text!,
              items: items,
              isActive: hasActive,
            );
          }
        }
      } else {
        if (await action.hasAccess(context)) {
          return MenuItemAttributes(
              icon: item.icon,
              label: item.text == null
                  ? ''
                  : processDoc(context, action.app, item.text!),
              onTap: () {
                if (!PageHelper.isActivePage(currentPage, action)) {
                  eliudrouter.Router.navigateTo(context, action);
                }
              },
              isActive: PageHelper.isActivePage(currentPage, action));
        }
      }
    }
    return null;
  }
}
