import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/eliud_popup_menu.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuHelper {
  static void addWidget(
      BuildContext context,
      List<Widget> widgets,
      MenuItemModel item,
      TextStyle? style,
      MemberModel? member,
      String currentPage) {
    var action = item.action;
    if ((action is InternalAction) &&
        (action.internalActionEnum == InternalActionEnum.OtherApps)) {
      var i = 0;
      if ((member != null) && (member.subscriptions != null)) {
        member.subscriptions!.forEach((value) {
          if (value.app != null) {
            i++;
            var menuItemModel = MenuItemModel(
                documentID: '${i}',
                text: value.app!.documentID,
                description: value.app!.title,
                action: SwitchApp(value.app!.documentID,
                    toAppID: value.app!.documentID));
            addWidget(
                context, widgets, menuItemModel, style, member, currentPage);
          }
        });
      }
    } else {
      if (action is PopupMenu) {
        widgets.add(ListTile(
            leading: item.icon == null
                ? null
                : IconHelper.getIconFromModelWithFlutterColor(
                    iconModel: item.icon, color: style!.color),
            title:
                Text(item.text!, textAlign: TextAlign.center, style: style)));
        action.menuDef!.menuItems!.forEach((element) {
          addWidget(context, widgets, element, style, member, currentPage);
        });
      } else {
        widgets.add(ListTile(
            leading: item.icon == null
                ? null
                : IconHelper.getIconFromModelWithFlutterColor(
                    iconModel: item.icon, color: style!.color),
            title: Text(item.text!, textAlign: TextAlign.center, style: style),
            onTap: () {
              if (!PageHelper.isActivePage(currentPage, action)) {
                eliudrouter.Router.navigateTo(context, action!);
              }
            }));
      }
    }
  }

  static void addButton(
    BuildContext context,
    AccessState state,
    AppModel app,
    List<Widget> buttons,
    MenuItemModel item,
    MemberModel? member,
    String currentPage,
    RgbModel selectedIconColor,
    RgbModel iconColor,
    RgbModel menuBackgroundColor,
  ) {
    var isActive = PageHelper.isActivePage(currentPage, item.action);
    var _color = isActive
        ? RgbHelper.color(rgbo: selectedIconColor)
        : RgbHelper.color(rgbo: iconColor);

    var _rgbcolor = isActive ? selectedIconColor : iconColor;

    var action = item.action;
    if ((action is PopupMenu) &&
        (action.menuDef != null) &&
        (action.menuDef!.menuItems != null) &&
        (action.menuDef!.menuItems!.length > 0)) {
      var popupMenu = EliudPopupMenu(
          app: app,
          state: state,
          currentPage: currentPage,
          member: member,
          menu: action.menuDef!,
          text: Text(item.text!),
          icon: item.icon == null
              ? null
              : IconHelper.getIconFromModel(
                  iconModel: item.icon, color: _rgbcolor),
          menuBackgroundColor: menuBackgroundColor);
      buttons.add(Theme(
          data: Theme.of(context).copyWith(
            cardColor: RgbHelper.color(rgbo: menuBackgroundColor),
          ),
          child: popupMenu));
    } else {
      if (item.icon != null) {
        buttons.add(IconButton(
          icon: IconHelper.getIconFromModel(iconModel: item.icon)!,
          color: _color,
          onPressed: () {
            if (!PageHelper.isActivePage(currentPage, item.action)) {
              eliudrouter.Router.navigateTo(context, item.action!);
            }
          },
        ));
      } else {
        buttons.add(Center(
            child: OutlineButton(
          padding: EdgeInsets.all(10.0),
          child: Text('${item.text}', style: FontTools.textStyle(app.h5)),
          onPressed: () {
            if (!PageHelper.isActivePage(currentPage, item.action)) {
              eliudrouter.Router.navigateTo(context, item.action!);
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          borderSide: BorderSide(color: FontTools.textStyle(app.h4)!.color!),
        )));
      }
    }
  }
}
