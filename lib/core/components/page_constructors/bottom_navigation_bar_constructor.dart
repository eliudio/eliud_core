import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/components/page_helper.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/background_model.dart';

import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarConstructor {
  final String currentPage;

  BottomNavigationBarConstructor(this.currentPage);

  Widget bottomNavigationBar(
          AppModel app, HomeMenuModel homeMenu, BackgroundModel bg) =>
      BottomNavigationBarWidget(
          app: app, homeMenu: homeMenu, bg: bg, currentPage: currentPage);
}

class BottomNavigationBarWidget extends StatefulWidget {
  final String currentPage;
  final HomeMenuModel homeMenu;
  final BackgroundModel bg;
  final AppModel app;

  const BottomNavigationBarWidget(
      {Key key, this.app, this.homeMenu, this.bg, this.currentPage})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.homeMenu == null) return null; // does this actually work?
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, theState) {
      if (theState is AppLoaded) {
        var menuItems = [];
        for (var i = 0; i < widget.homeMenu.menu.menuItems.length; i++) {
          var item = widget.homeMenu.menu.menuItems[i];
          if (theState.menuItemHasAccess(item)) menuItems.add(item);
        }
        if (menuItems.length < 2)
          return Container(height: 1.0);
        else {
          return Container(
              decoration: BoxDecorationHelper.boxDecoration(
                  theState, widget.homeMenu.background),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  onTap: (int index) async {
                    MenuItemModel item = menuItems[index];
                    var action = item.action;
                    if (action.hasAccess(context)) {
                      if (action is PopupMenu) {
                        await PopupMenuWidget(widget.app, widget.currentPage)
                            .openMenu(
                          context,
                          action,
                          widget.homeMenu.popupMenuBackgroundColor,
                          RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                        );
                      } else {
                        if (!PageHelper.isActivePage(
                            widget.currentPage, action))
                          eliudrouter.Router.navigateTo(context, action);
                      }
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
    });
  }
}
