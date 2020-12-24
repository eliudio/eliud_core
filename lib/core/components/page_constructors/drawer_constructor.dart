import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerConstructor {
  final String currentPage;

  const DrawerConstructor(this.currentPage);

  void _addWidget(BuildContext context, List<Widget> widgets, MenuItemModel item,
      TextStyle style, MemberModel member) {
    var action = item.action;
    if ((action is InternalAction) && (action.internalActionEnum == InternalActionEnum.OtherApps)) {
      var i = 0;
      if ((member != null) && (member.subscriptions != null)) {
        member.subscriptions.forEach((value) {
          if (value.app != null) {
            i++;
            var menuItemModel = MenuItemModel(documentID: '${i}',
                text: value.app.documentID,
                description: value.app.title,
                action: SwitchApp(value.app.documentID, toAppID: value.app.documentID));
            _addWidget(context, widgets, menuItemModel, style, member);
          }
        });
      }
    } else {
      if (action is PopupMenu) {
        widgets.add(ListTile(
            leading: item.icon == null
                ? null
                : IconHelper.getIconFromModelWithFlutterColor(
                iconModel: item.icon, color: style.color),
            title: Text(item.text,
                textAlign: TextAlign.center, style: style)));
        action.menuDef.menuItems.forEach((element) {
          _addWidget(context, widgets, element, style, member);
        });
      } else {
        widgets.add(ListTile(
            leading: item.icon == null
                ? null
                : IconHelper.getIconFromModelWithFlutterColor(
                iconModel: item.icon, color: style.color),
            title: Text(item.text,
                textAlign: TextAlign.center, style: style),
            onTap: () {
              if (!PageHelper.isActivePage(currentPage, action)) {
                eliudrouter.Router.navigateTo(context, action);
              }
            }));
      }
    }
  }

  Widget drawer(BuildContext context, DrawerModel drawer) {
    var theState = AccessBloc.getState(context);
    if (theState is AppLoaded) {
      var app = theState.app;
      if (drawer == null) return null;
      if (drawer.menu == null) return null;
      var widgets = <Widget>[];
      widgets.add(
        Container(
            height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
            child: DrawerHeader(
                child: Center(child: Text(
                  drawer.headerText, // description drawer
                  style: FontTools.textStyle(app.h3),
                )),
                decoration:
                BoxDecorationHelper.boxDecoration(theState, drawer.headerBackground))),
      );
      if ((drawer.secondHeaderText != null) &&
          (drawer.secondHeaderText.isNotEmpty)) {
        widgets.add(
            Container(
              height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
              child: DrawerHeader(
                  child: Center(child: Text(
                    processDoc(context, drawer.secondHeaderText),
                    style: FontTools.textStyle(app.h4),
                  ))
              ),
            ));
      }

      var member = theState is LoggedIn ? theState.member : null;

      for (var i = 0; i < drawer.menu.menuItems.length; i++) {
        var item = drawer.menu.menuItems[i];
        var style = PageHelper.isActivePage(currentPage, item.action)
            ? FontTools.textStyle(app.h3)
            : FontTools.textStyle(app.h4);
        if (theState.hasAccess(item)) {
          _addWidget(context, widgets, item, style, member);
        }
      }

      return Drawer(
          child: Container(
              decoration: BoxDecorationHelper.boxDecoration(theState, drawer.background),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: widgets,
              )));
    } else {
      return Text("Error constructing Drawer");
    }
  }
}
