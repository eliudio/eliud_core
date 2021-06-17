import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EliudBottomNavigationBar extends StatefulWidget {
  final String currentPage;
  final HomeMenuModel homeMenu;

  EliudBottomNavigationBar(
      {Key? key,
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
    var currentPage = widget.currentPage;
    var theState = AccessBloc.getState(context);
    if (theState is AppLoaded) {
      var homeMenu = widget.homeMenu;
      var itemList = MenuItemMapper.mapMenu(
          context, homeMenu.menu!, theState.getMember(), currentPage);
      if ((itemList != null) && (itemList.length > 2)) {
        return StyleRegistry.registry()
            .styleWithContext(context)
            .frontEndStyle()
            .bottomNavigationBar(context,
                items: itemList,
                backgroundOverride: widget.homeMenu.backgroundOverride,
                popupMenuBackgroundColorOverride:
                    widget.homeMenu.popupMenuBackgroundColorOverride);
      } else {
        return Container(height:0);
      }
    } else {
      return StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context);
    }
  }
}
