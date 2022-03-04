import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/style/frontend/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/appbar/extended_app_bar_component_state.dart';
import 'blocs/home_menu/extended_home_menu_component_bloc.dart';
import 'blocs/home_menu/extended_home_menu_component_event.dart';
import 'blocs/home_menu/extended_home_menu_component_state.dart';

class EliudBottomNavigationBar extends StatefulWidget {
  final AppModel app;
  final String currentPage;
  final HomeMenuModel homeMenu;
  final AccessState accessState;

  EliudBottomNavigationBar(
      {Key? key,
      required this.app,
      required this.accessState,
      required this.homeMenu,
      required this.currentPage})
      : super(key: key);

  @override
  _EliudBottomNavigationBarState createState() {
    return _EliudBottomNavigationBarState();
  }
}

class _EliudBottomNavigationBarState extends State<EliudBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var app = widget.app;
    return BlocProvider<ExtendedHomeMenuComponentBloc>(
        create: (context) => ExtendedHomeMenuComponentBloc()
          ..add(ExtendedHomeMenuInitEvent(value: widget.homeMenu)),
        child: BlocBuilder<ExtendedHomeMenuComponentBloc,
            ExtendedHomeMenuComponentState>(builder: (context, state) {
          if ((state is ExtendedHomeMenuComponentLoaded) &&
              (state.value != null)) {
            return EliudBottomNavigationBarWithItems(
                app: app,
                accessState: widget.accessState,
                homeMenu: widget.homeMenu,
                currentPage: widget.currentPage,
                state: state);
          } else {
            return progressIndicator(app, context);
          }
        }));
  }
}

class EliudBottomNavigationBarWithItems extends StatefulWidget {
  final AppModel app;
  final String currentPage;
  final HomeMenuModel homeMenu;
  final AccessState accessState;
  final ExtendedHomeMenuComponentLoaded state;

  EliudBottomNavigationBarWithItems(
      {Key? key,
      required this.app,
      required this.accessState,
      required this.homeMenu,
      required this.currentPage,
      required this.state})
      : super(key: key);

  @override
  _EliudBottomNavigationBarWithItemsState createState() {
    return _EliudBottomNavigationBarWithItemsState();
  }
}

class _EliudBottomNavigationBarWithItemsState
    extends State<EliudBottomNavigationBarWithItems> {
  final GlobalKey _bottomNavigationBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var homeMenu = widget.state.value!;
    var app = widget.app;
    var currentPage = widget.currentPage;
    return FutureBuilder<List<AbstractMenuItemAttributes>?>(
        future: MenuItemMapper.mapMenu(context, homeMenu.menu!,
            widget.accessState.getMember(), currentPage),
        builder: (context, snapshot) {
          var itemList = <AbstractMenuItemAttributes>[];
          if (snapshot.hasData) {
            itemList = snapshot.data!;
          }
          return Decorations.instance().createDecoratedBottomNavigationBar(
              app, context, _bottomNavigationBarKey, () {
            if ((itemList != null) && (itemList.length > 2)) {
              return bottomNavigationBar(app, context,
                  key: _bottomNavigationBarKey,
                  member: widget.accessState.getMember(),
                  items: itemList,
                  backgroundOverride: widget.homeMenu.backgroundOverride,
                  popupMenuBackgroundColorOverride:
                      widget.homeMenu.popupMenuBackgroundColorOverride);
            } else {
              return Container(height: 0);
            }
          }, widget.homeMenu)();
        });
  }
}
