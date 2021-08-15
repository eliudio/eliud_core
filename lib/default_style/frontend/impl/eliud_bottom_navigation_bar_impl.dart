import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../eliud_style.dart';

class EliudBottomNavigationBarImpl implements HasBottomNavigationBar {
  final EliudStyle _eliudStyle;

  EliudBottomNavigationBarImpl(this._eliudStyle);

  Widget getIconExcl(BuildContext context, AbstractMenuItemAttributes item) {
    if (item.icon != null) {
      return item.isActive
          ? _eliudStyle
              .frontEndStyle()
              .iconStyle()
              .h3Icon(context, icon: item.icon!)
          : _eliudStyle
              .frontEndStyle()
              .iconStyle()
              .h4Icon(context, icon: item.icon!);
    } else {
      var color;
      var style;
      if (item.isActive) {
        style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h3);
      } else {
        style = FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h4);
      }
      color = style != null ? style.color : null;
      return Icon(Icons.circle, color: color);
    }
  }

  @override
  Widget bottomNavigationBar(
    BuildContext context, {
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
    Key? key,
  }) {
    var background = backgroundOverride ??=
        _eliudStyle.eliudStyleAttributesModel.bottomNavigationBarBG;

    var accessState = AccessBloc.getState(context);
    return Container(
        decoration: backgroundOverride == null
            ? null
            : BoxDecorationHelper.boxDecoration(accessState, background),
        child: Theme(
            data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.copyWith(
                bodyText2: FontTools.textStyle(_eliudStyle.eliudStyleAttributesModel.h1),
            )), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(
              key: key,
              selectedFontSize: 18,
                unselectedFontSize: 14,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                onTap: (item) {
                  var theItem = items[item];
                  if (theItem is MenuItemAttributes) {
                    theItem.onTap();
                  } else if (theItem is MenuItemWithMenuItems) {
                    _eliudStyle.frontEndStyle().menuStyle().openMenu(context,
                        position:
                            RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                        menuItems: theItem.items,
                        popupMenuBackgroundColorOverride:
                            popupMenuBackgroundColorOverride);
                  }
                },
                currentIndex: 0,
                fixedColor: Colors.teal,
                items: items.map((item) {
                  return BottomNavigationBarItem(
                    label: item.label,
                    icon: getIconExcl(context, item),
                  );
                }).toList())));
  }
}
