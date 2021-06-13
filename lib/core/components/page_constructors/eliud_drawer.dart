import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/menu_helper.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/core/components/util/page_helper.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EliudDrawer extends StatefulWidget {
  final String currentPage;
  final DrawerModel drawer;
  EliudDrawer({Key? key, required this.drawer, required this.currentPage})
      : super(key: key);

  @override
  _EliudDrawerState createState() {
    return _EliudDrawerState();
  }
}

class _EliudDrawerState extends State<EliudDrawer> {
  @override
  Widget build(BuildContext context) {
    var drawer = widget.drawer;
    var currentPage = widget.currentPage;
    return BlocBuilder<AccessBloc, AccessState>(builder: (context, theState) {
      if (theState is AppLoaded) {
        var app = theState.app;
        if (drawer == null) return Text('Drawer is not defined');
        if (drawer.menu == null) return Text('Drawer menu not defined');
        var widgets = <Widget>[];
        widgets.add(
          Container(
              height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
              child: DrawerHeader(
                  child: Center(
                      child: StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().h3(context, drawer.headerText!)
),
                  decoration: BoxDecorationHelper.boxDecoration(
                      theState, drawer.headerBackground))),
        );
        if ((drawer.secondHeaderText != null) &&
            (drawer.secondHeaderText!.isNotEmpty)) {
          widgets.add(Container(
            height: drawer.headerHeight == 0 ? null : drawer.headerHeight,
            child: DrawerHeader(
                child: Center(
                    child: StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().h4(context, drawer.secondHeaderText!),
                )),
          ));
        }

        var member = theState is LoggedIn ? theState.member : null;

        for (var i = 0; i < drawer.menu!.menuItems!.length; i++) {
          var item = drawer.menu!.menuItems![i];
          var style = PageHelper.isActivePage(currentPage, item.action)
              ? StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().styleH3(context)
              : StyleRegistry.registry().styleWithContext(context).frontEndFormStyle().styleH4(context);

              if (theState.menuItemHasAccess(item)) {
            _addWidget(context, widgets, item, style, member);
          }
        }

        return Drawer(
            child: Container(
                decoration: BoxDecorationHelper.boxDecoration(
                    theState, drawer.background),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: widgets,
                )));
      } else {
        return Text('Error constructing Drawer');
      }
    });
  }

  void _addWidget(BuildContext context, List<Widget> widgets,
      MenuItemModel item, TextStyle? style, MemberModel? member) {
    return MenuHelper.addWidget(context,  widgets, item, style, member, widget.currentPage);
  }
}
