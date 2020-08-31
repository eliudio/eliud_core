import 'package:eliud_core/core/access/bloc/access_details.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/member_model.dart';

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/tools/action_model.dart';
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
      TextStyle style, MemberModel member, AccessDetails accessDetails) {
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
                action: SwitchApp(appID: value.app.documentID));
            _addWidget(context, widgets, menuItemModel, style, member, accessDetails);
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
          _addWidget(context, widgets, element, style, member, accessDetails);
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
//    return BlocBuilder<PluggableBloc, PluggableState>(builder: (context, state) {
      if (drawer == null) return null;
      if (drawer.menu == null) return null;
      var widgets = <Widget>[];
      widgets.add(
        Container(
            height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
            child: DrawerHeader(
                child: Center(child: Text(
                  drawer.headerText, // description drawer
                  style: FontTools.textStyle(GlobalData.app().h3),
                )),
                decoration:
                    BoxDecorationHelper.boxDecoration(drawer.headerBackground))),
      );
      if ((drawer.secondHeaderText != null) && (drawer.secondHeaderText.isNotEmpty)) {
        widgets.add(
            Container(
              height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
              child: DrawerHeader(
                  child: Center(child: Text(
                    processDoc(context, drawer.secondHeaderText),
                    style: FontTools.textStyle(GlobalData.app().h4),
                  ))
              ),
            ));
      }

      var member = GlobalData.member();
      var accessDetails = GlobalData.details();

      for (var i = 0; i < drawer.menu.menuItems.length; i++) {
        var item = drawer.menu.menuItems[i];
        var style = PageHelper.isActivePage(currentPage, item.action) ? FontTools.textStyle(GlobalData.app().h3) : FontTools.textStyle(GlobalData.app().h4);
        if (accessDetails.hasAccess(item)) {
          _addWidget(context, widgets, item, style, member, accessDetails);
        }
      }

      return Drawer(
          child: Container(
              decoration: BoxDecorationHelper.boxDecoration(drawer.background),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: widgets,
              )));
//    });
  }
}
