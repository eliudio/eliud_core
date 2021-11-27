import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_bottom_navigation_bar.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultBottomNavigationBarImpl implements HasBottomNavigationBar {
  final FrontEndStyle _frontEndStyle;

  DefaultBottomNavigationBarImpl(this._frontEndStyle);

  Widget getIconExcl(BuildContext context, AbstractMenuItemAttributes item) {
    if (item.icon != null) {
      return item.isActive
          ? _frontEndStyle
              .iconStyle()
              .h3Icon(context, icon: item.icon!)
          : _frontEndStyle
              .iconStyle()
              .h4Icon(context, icon: item.icon!);
    } else {
      return Icon(Icons.circle, );
    }
  }

  @override
  Widget bottomNavigationBar(
    BuildContext context, {
    required MemberModel? member,
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
    Key? key,
  }) {
    var background = backgroundOverride;

    return Container(
        decoration: backgroundOverride == null
            ? null
            : BoxDecorationHelper.boxDecoration(member, background),
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
                    _frontEndStyle.menuStyle().openMenu(context,
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
                }).toList()));
  }
}
