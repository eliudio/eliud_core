import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_drawer.dart';
import 'package:eliud_core_main/apis/style/frontend/has_drawer.dart' as dr;
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/drawer/extended_drawer_component_bloc.dart';
import 'blocs/drawer/extended_drawer_component_event.dart';
import 'blocs/drawer/extended_drawer_component_state.dart';

class EliudDrawer extends StatefulWidget {
  final String currentPage;
  final AppModel app;
  final DrawerModel drawer;
  final DrawerType drawerType;
  final AccessState accessState;

  EliudDrawer(
      {super.key,
      required this.app,
      required this.accessState,
      required this.drawerType,
      required this.drawer,
      required this.currentPage});

  @override
  State<EliudDrawer> createState() {
    return _EliudDrawerState();
  }
}

class _EliudDrawerState extends State<EliudDrawer> {
  @override
  Widget build(BuildContext context) {
    var app = widget.app;
    return BlocProvider<ExtendedDrawerComponentBloc>(
        create: (context) => ExtendedDrawerComponentBloc()
          ..add(ExtendedDrawerInitEvent(value: widget.drawer)),
        child: BlocBuilder<ExtendedDrawerComponentBloc,
            ExtendedDrawerComponentState>(builder: (context, state) {
          if ((state is ExtendedDrawerComponentLoaded) &&
              (state.value != null)) {
            return EliudDrawerWithItems(
                app: app,
                accessState: widget.accessState,
                drawerType: widget.drawerType,
                drawer: widget.drawer,
                currentPage: widget.currentPage,
                state: state);
          } else {
            return progressIndicator(app, context);
          }
        }));
  }
}

class EliudDrawerWithItems extends StatefulWidget {
  final String currentPage;
  final AppModel app;
  final DrawerModel drawer;
  final DrawerType drawerType;
  final AccessState accessState;
  final ExtendedDrawerComponentLoaded state;

  EliudDrawerWithItems(
      {super.key,
      required this.app,
      required this.accessState,
      required this.drawerType,
      required this.drawer,
      required this.currentPage,
      required this.state});

  @override
  State<EliudDrawerWithItems> createState() {
    return _EliudDrawerWithItemsState();
  }
}

class _EliudDrawerWithItemsState extends State<EliudDrawerWithItems> {
  final GlobalKey _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var drawer = widget.state.value!;
    if (drawer.menu != null) {
      var app = widget.app;
      var currentPage = widget.currentPage;
      DrawerHeader1Attributes? drawerHeader1Attributes;
      if (((drawer.headerText != null) && (drawer.headerText!.isNotEmpty)) ||
          (drawer.headerBackgroundOverride != null)) {
        drawerHeader1Attributes = DrawerHeader1Attributes(drawer.headerHeight,
            drawer.headerText!, drawer.headerBackgroundOverride);
      }
      DrawerHeader2Attributes? drawerHeader2Attributes;
      if ((drawer.secondHeaderText != null) &&
          (drawer.secondHeaderText!.isNotEmpty)) {
        drawerHeader2Attributes = DrawerHeader2Attributes(drawer.headerHeight,
            processDoc(context, app, drawer.secondHeaderText!));
      }

      return FutureBuilder<List<AbstractMenuItemAttributes>?>(
          future: MenuItemMapper.mapMenu(context, drawer.menu!,
              widget.accessState.getMember(), currentPage),
          builder: (context, snapshot) {
            var itemList = <AbstractMenuItemAttributes>[];
            if (snapshot.hasData) {
              itemList = snapshot.data!;
              return Decorations.instance().createDecoratedDrawer(
                  app,
                  context,
                  widget.drawerType == DrawerType.left
                      ? DecorationDrawerType.left
                      : DecorationDrawerType.right,
                  _drawerKey, () {
                return dr.drawer(app, context,
                    key: _drawerKey,
                    member: widget.accessState.getMember(),
                    drawerType: widget.drawerType,
                    header1: drawerHeader1Attributes,
                    header2: drawerHeader2Attributes,
                    items: itemList,
                    popupMenuBackgroundColorOverride:
                        drawer.popupMenuBackgroundColorOverride,
                    backgroundOverride: drawer.backgroundOverride);
              }, drawer)();
            } else {
              return Decorations.instance().createDecoratedDrawer(
                  app,
                  context,
                  widget.drawerType == DrawerType.left
                      ? DecorationDrawerType.left
                      : DecorationDrawerType.right,
                  _drawerKey, () {
                return dr.drawer(app, context,
                    key: _drawerKey,
                    member: widget.accessState.getMember(),
                    drawerType: widget.drawerType,
                    header1: drawerHeader1Attributes,
                    header2: drawerHeader2Attributes,
                    items: [],
                    popupMenuBackgroundColorOverride:
                        drawer.popupMenuBackgroundColorOverride,
                    backgroundOverride: drawer.backgroundOverride);
              }, drawer)();
            }
          });
    } else {
      return Text('Drawer ${drawer.documentID} has no menu defined');
    }
  }
}
