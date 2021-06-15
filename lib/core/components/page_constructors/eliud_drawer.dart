import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/util/page_helper.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EliudDrawer extends StatefulWidget {
  final String currentPage;
  final DrawerModel drawer;
  final DrawerType drawerType;

  EliudDrawer(
      {Key? key,
      required this.drawerType,
      required this.drawer,
      required this.currentPage})
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
        if (drawer == null) return Text('Drawer is not defined');
        if (drawer.menu == null) return Text('Drawer menu not defined');

        var drawerHeader1Attributes = DrawerHeader1Attributes(
            drawer.headerHeight,
            drawer.headerText!,
            drawer.headerBackgroundOverride);
        var drawerHeader2Attributes;
        if ((drawer.secondHeaderText != null) &&
            (drawer.secondHeaderText!.isNotEmpty)) {
          drawerHeader2Attributes = DrawerHeader2Attributes(
              drawer.headerHeight, drawer.secondHeaderText!);
        }

        var itemList = <DrawerItemAttributes>[];
        for (var i = 0; i < drawer.menu!.menuItems!.length; i++) {
          var item = drawer.menu!.menuItems![i];
          var active = PageHelper.isActivePage(currentPage, item.action);
          if (theState.menuItemHasAccess(item)) {
            itemList.add(DrawerItemAttributes(item, active));
          }
        }

        return StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .drawer(context,
                drawerType: widget.drawerType,
                header1: drawerHeader1Attributes,
                header2: drawerHeader2Attributes,
                items: itemList,
                backgroundOverride: widget.drawer.backgroundOverride);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }
}
