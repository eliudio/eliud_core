import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudBottomNavigationBarImpl implements HasBottomNavigationBar {
  final EliudStyle _eliudStyle;

  EliudBottomNavigationBarImpl(this._eliudStyle);

  Widget getIconExcl(BuildContext context, AbstractMenuItemAttributes item) {
    if (item.icon != null) {
      return item.isActive
          ? _eliudStyle.frontEndStyle().h3Icon(context, icon: item.icon!)
          : _eliudStyle.frontEndStyle().h4Icon(context, icon: item.icon!);
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
      }) {
    var background = backgroundOverride ??= _eliudStyle.eliudStyleAttributesModel.bottomNavigationBarBG;

    var accessState = AccessBloc.getState(context);
    return Container(
        decoration: backgroundOverride == null
            ? null
            : BoxDecorationHelper.boxDecoration(
            accessState, background),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            onTap: (item) {
              var theItem = items[item];
              if (theItem is MenuItemAttributes) {
                theItem.onTap();
              } else if (theItem is MenuItemWithMenuItems) {
                _eliudStyle.frontEndStyle().openMenu(context, position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                    menuItems: theItem.items,
                    popupMenuBackgroundColorOverride: popupMenuBackgroundColorOverride);
              }
            },
            currentIndex: 0,
            fixedColor: Colors.teal,
            items: items.map((item) {
              return BottomNavigationBarItem(
                label: item.label,
                icon: getIconExcl(context, item),
              );
            }).toList()));
  }
}
