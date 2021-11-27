import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart' as dr;
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
  final GlobalKey _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var drawer = widget.drawer;
    var currentPage = widget.currentPage;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
        if (accessState is AccessDetermined) {
          return Decorations.instance().createDecoratedDrawer(
              context,
              widget.drawerType == DrawerType.Left
                  ? DecorationDrawerType.Left
                  : DecorationDrawerType.Left,
              _drawerKey, () {
            if (drawer.menu != null) {
              var drawerHeader1Attributes;
              if (((drawer.headerText != null) &&
                      (drawer.headerText!.isNotEmpty)) ||
                  (drawer.headerBackgroundOverride != null)) {
                drawerHeader1Attributes = DrawerHeader1Attributes(
                    drawer.headerHeight,
                    drawer.headerText!,
                    drawer.headerBackgroundOverride);
              }
              var drawerHeader2Attributes;
              if ((drawer.secondHeaderText != null) &&
                  (drawer.secondHeaderText!.isNotEmpty)) {
                drawerHeader2Attributes = DrawerHeader2Attributes(
                    drawer.headerHeight,
                    processDoc(context, drawer.secondHeaderText!));
              }

              var itemList = MenuItemMapper.mapMenu(
                  context, drawer.menu!, accessState.getMember(), currentPage);
              if (itemList != null) {
                return dr.drawer(context,
                    key: _drawerKey,
                    member: accessState.getMember(),
                    drawerType: widget.drawerType,
                    header1: drawerHeader1Attributes,
                    header2: drawerHeader2Attributes,
                    items: itemList,
                    popupMenuBackgroundColorOverride:
                        widget.drawer.popupMenuBackgroundColorOverride,
                    backgroundOverride: widget.drawer.backgroundOverride);
              } else {
                return Text('Drawer ${drawer.documentID} has no items');
              }
            } else {
              return Text('Drawer ${drawer.documentID} has no menu defined');
            }
          }, widget.drawer)();
        } else {
          return progressIndicator(context);
        }
      });
  }
}
