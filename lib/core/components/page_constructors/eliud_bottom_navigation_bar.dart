import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/page_constructors/popup_menu.dart';
import 'package:eliud_core/core/components/util/page_helper.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/background_model.dart';

import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EliudBottomNavigationBar extends StatefulWidget {
  final String? currentPage;
  final HomeMenuModel? homeMenu;
  final BackgroundModel? bg;
  final AppModel? app;

  const EliudBottomNavigationBar(
      {Key? key, this.app, this.homeMenu, this.bg, this.currentPage})
      : super(key: key);

  @override
  _EliudBottomNavigationBarState createState() =>
      _EliudBottomNavigationBarState();
}

class _EliudBottomNavigationBarState extends State<EliudBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.homeMenu == null)
      return Text("Home menu not defined"); // does this actually work?
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, theState) {
      if (theState is AppLoaded) {
        var menuItems = [];
        for (var i = 0; i < widget.homeMenu!.menu!.menuItems!.length; i++) {
          var item = widget.homeMenu!.menu!.menuItems![i];
          if (theState.menuItemHasAccess(item)) menuItems.add(item);
        }
        if (menuItems.length < 2)
          return Container(height: 1.0);
        else {
          return Container(
              decoration: BoxDecorationHelper.boxDecoration(
                  theState, widget.homeMenu!.background),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  onTap: (int index) async {
                    MenuItemModel item = menuItems[index];
                    runIt(item);
                  },
                  currentIndex: 0,
                  fixedColor: Colors.teal,
                  items: menuItems.map((item) {
                    var text =
                        PageHelper.isActivePage(widget.currentPage, item.action)
                            ? StyleRegistry.registry()
                                .styleWithContext(context)
                                .frontEndFormStyle()
                                .h3(context, item.text)
                            : StyleRegistry.registry()
                                .styleWithContext(context)
                                .frontEndFormStyle()
                                .h4(context, item.text);

                    return BottomNavigationBarItem(
                      title: text,
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

  Future<void> runIt(MenuItemModel item) async {
    var action = item.action!;
    if (action.hasAccess(context)) {
      if (action is PopupMenu) {
        PopupMenuWidget(widget.app, widget.currentPage).openMenu(
          context,
          action,
          widget.homeMenu!.popupMenuBackgroundColor,
          RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
        );
      } else {
        if (!PageHelper.isActivePage(widget.currentPage, action))
          eliudrouter.Router.navigateTo(context, action);
      }
    }
  }
}
