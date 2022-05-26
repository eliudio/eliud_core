import 'package:eliud_core/model/app_model.dart';
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

  Widget getIconExcl(AppModel app, BuildContext context, AbstractMenuItemAttributes item) {
    if (item.icon != null) {
      return item.isActive
          ? _frontEndStyle
              .iconStyle()
              .h3Icon(app, context, icon: item.icon!)
          : _frontEndStyle
              .iconStyle()
              .h4Icon(app, context, icon: item.icon!);
    } else {
      return Icon(Icons.circle, );
    }
  }

  @override
  Widget bottomNavigationBar(AppModel app,
      BuildContext context, {
    required MemberModel? member,
    BackgroundModel? backgroundOverride,
    RgbModel? popupMenuBackgroundColorOverride,
    required List<AbstractMenuItemAttributes> items,
    Key? key,
  }) {
    var background = backgroundOverride;

    return Container(
        clipBehavior: BoxDecorationHelper.determineClipBehaviour(app, member, background),
        margin: BoxDecorationHelper.determineMargin(app, member, background),
        padding: BoxDecorationHelper.determinePadding(app, member, background),
        decoration: BoxDecorationHelper.boxDecoration(app, member, background),
        child: BottomNavigationBar(
              key: key,
              elevation: 0,
              selectedFontSize: 18,
                unselectedFontSize: 14,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                onTap: (item) {
                  var theItem = items[item];
                  if (theItem is MenuItemAttributes) {
                    theItem.onTap();
                  } else if (theItem is MenuItemWithMenuItems) {
                    _frontEndStyle.menuStyle().openMenu(app, context,
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
                    icon: getIconExcl(app, context, item),
                  );
                }).toList()));
  }
}
