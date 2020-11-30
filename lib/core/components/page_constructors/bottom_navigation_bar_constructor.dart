import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/background_model.dart';

import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigationBarConstructor {
  final String currentPage;

  BottomNavigationBarConstructor(this.currentPage);

  Widget bottomNavigationBar(AppModel app, AccessState state, BuildContext context,
          HomeMenuModel homeMenu, BackgroundModel bg) =>
      BottomNavigationBarWidget(
        app: app,
        state: state,
        homeMenu: homeMenu,
        bg: bg,
        currentPage: currentPage,
      );
}

class BottomNavigationBarWidget extends StatefulWidget {
  final String currentPage;
  final HomeMenuModel homeMenu;
  final BackgroundModel bg;
  final AppModel app;
  final AccessState state;

  const BottomNavigationBarWidget(
      {Key key, this.app, this.state, this.homeMenu, this.bg, this.currentPage})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.homeMenu == null) return null;
    var theState = widget.state;
    if (theState is AccessStateWithDetails) {
      List<MenuItemModel> menuItems = List();
      for (int i = 0; i < widget.homeMenu.menu.menuItems.length; i++) {
        MenuItemModel item = widget.homeMenu.menu.menuItems[i];
        if (theState.hasAccess(item)) menuItems.add(item);
      }
      if (menuItems.length < 2)
        return Container(height: 1.0);
      else {
        return Container(
            decoration: BoxDecorationHelper.boxDecoration(
                widget.state, widget.homeMenu.background),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                onTap: (int index) async {
                  MenuItemModel item = menuItems[index];
                  ActionModel action = item.action;
                  if (action is PopupMenu) {
                    await PopupMenuWidget(widget.app, widget.currentPage)
                        .openMenu(
                      context,
                      action,
                      widget.homeMenu.popupMenuBackgroundColor,
                      RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                    );
                  } else {
                    if (!PageHelper.isActivePage(widget.currentPage, action))
                      eliudrouter.Router.navigateTo(context, action);
                  }
                },
                currentIndex: 0,
                fixedColor: Colors.teal,
                items: menuItems.map((item) {
                  TextStyle style =
                      PageHelper.isActivePage(widget.currentPage, item.action)
                          ? FontTools.textStyle(widget.app.h3)
                          : FontTools.textStyle(widget.app.h4);
                  return BottomNavigationBarItem(
                    title: Text(
                      item.text,
                      style: style,
                    ),
                    icon: IconHelper.getIconFromModelWithFlutterColor(
                        iconModel: item.icon, color: style.color),
                  );
                }).toList()));
      }
    } else {
      return Text("Error constructing buttom navigation widget");
    }
  }
}
