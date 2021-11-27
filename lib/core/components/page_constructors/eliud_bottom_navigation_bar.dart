import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/tools/menu_item_mapper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/home_menu_model.dart';
import 'package:eliud_core/style/frontend/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EliudBottomNavigationBar extends StatefulWidget {
  final String currentPage;
  final HomeMenuModel homeMenu;

  EliudBottomNavigationBar(
      {Key? key, required this.homeMenu, required this.currentPage})
      : super(key: key);

  @override
  _EliudBottomNavigationBarState createState() {
    return _EliudBottomNavigationBarState();
  }
}

class _EliudBottomNavigationBarState extends State<EliudBottomNavigationBar> {
  final GlobalKey _bottomNavigationBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var currentPage = widget.currentPage;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
        if (accessState is AccessDetermined) {
          return Decorations.instance().createDecoratedBottomNavigationBar(
              context, _bottomNavigationBarKey, () {
            var homeMenu = widget.homeMenu;
            var itemList = MenuItemMapper.mapMenu(
                context, homeMenu.menu!, accessState.getMember(), currentPage);
            if ((itemList != null) && (itemList.length > 2)) {
              return bottomNavigationBar(context,
                  key: _bottomNavigationBarKey,
                  member: accessState.getMember(),
                  items: itemList,
                  backgroundOverride: widget.homeMenu.backgroundOverride,
                  popupMenuBackgroundColorOverride:
                      widget.homeMenu.popupMenuBackgroundColorOverride);
            } else {
              return Container(height: 0);
            }
          }, widget.homeMenu)();
        } else {
          return progressIndicator(context);
        }
      });
  }
}
