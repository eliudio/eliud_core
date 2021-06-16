import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/style/shared/has_drawer.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    var theState = AccessBloc.getState(context);
    if (theState is AppLoaded) {
      if (drawer.menu != null) {
        var drawerHeader1Attributes = DrawerHeader1Attributes(
            drawer.headerHeight,
            drawer.headerText!,
            drawer.headerBackgroundOverride);
        var drawerHeader2Attributes;
        if ((drawer.secondHeaderText != null) &&
            (drawer.secondHeaderText!.isNotEmpty)) {
          drawerHeader2Attributes = DrawerHeader2Attributes(
              drawer.headerHeight, processDoc(context, drawer.secondHeaderText!));
        }

        var itemList = MenuItemMapper.mapMenu(context, drawer.menu!, theState.getMember(), currentPage);
        if (itemList != null) {
          return StyleRegistry.registry()
              .styleWithContext(context)
              .frontEndStyle()
              .drawer(context,
              drawerType: widget.drawerType,
              header1: drawerHeader1Attributes,
              header2: drawerHeader2Attributes,
              items: itemList,
              popupMenuBackgroundColorOverride: widget.drawer.popupMenuBackgroundColorOverride,
              backgroundOverride: widget.drawer.backgroundOverride);
        } else {
          return Text('Drawer ${drawer.documentID} has no items');
        }
      } else {
        return Text('Drawer ${drawer.documentID} has no menu defined');
      }
    } else {
      return Center(
        child: DelayedCircularProgressIndicator(),
      );
    }
  }
}
