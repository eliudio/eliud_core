import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/components/util/page_helper.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EliudPopupMenu extends StatefulWidget {
  final String currentPage;
  final MemberModel? member;
  final AppModel app;
  final AccessState state;
  final MenuDefModel menu;
  final Widget text;
  final Icon? icon;
  final RgbModel? menuBackgroundColor;

  const EliudPopupMenu(
      {Key? key,
      required this.currentPage,
      this.member,
      required this.app,
      required this.state,
      required this.menu,
      required this.text,
      this.icon,
      this.menuBackgroundColor})
      : super(key: key);

  @override
  _EliudPopupMenuState createState() => _EliudPopupMenuState();
}

class _EliudPopupMenuState extends State<EliudPopupMenu> {
  @override
  Widget build(BuildContext context) {
     var menuBackgroundColor = widget.menuBackgroundColor;
    var menu = widget.menu;
    return stylePopupMenuButton(context, menu,
        icon: widget.icon,
        text: widget.text,
        background: menuBackgroundColor,
        currentPage: widget.currentPage);
  }

  Widget stylePopupMenuButton(BuildContext context, MenuDefModel menu,
      {Icon? icon,
      required Widget text,
      RgbModel? background,
      String? currentPage}) {
    if (menu!.menuItems!.isEmpty) return Text('No menu items');
    var state = AccessBloc.getState(context);
    if (state is AppLoaded) {
      var app = state.app;
      var menuItems = <MenuItemModel>[];
      for (var i = 0; i < menu.menuItems!.length; i++) {
        var item = menu.menuItems![i];
        if (state.menuItemHasAccess(item)) menuItems.add(item);
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
                background,
                RelativeRect.fromLTRB(1000.0, 0.0, 0.0, 0.0),
              );
            } else {
              if (!PageHelper.isActivePage(currentPage, action)) {
                eliudrouter.Router.navigateTo(context, action!);
              }
            }
          },
          itemBuilder: (BuildContext context) {
            var entries = <PopupMenuEntry<int>>[];
            var index = 0;
            menuItems.forEach((item) {
              var style = PageHelper.isActivePage(currentPage, item.action)
                  ? StyleRegistry.registry().styleWithContext(context).frontEndStyle().styleH3(context)
                  : StyleRegistry.registry().styleWithContext(context).frontEndStyle().styleH4(context);
              var description = item.description!;
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
      return Text('App not loaded');
    }
  }
}
