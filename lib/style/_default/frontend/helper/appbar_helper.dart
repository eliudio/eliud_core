import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_appbar.dart';
import 'package:eliud_core/style/frontend/has_menu.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../frontend/has_button.dart';

class AppBarHelper {
  final FrontEndStyle _frontEndStyle;
  final HasMenu _hasMenu;

  AppBarHelper(this._frontEndStyle, this._hasMenu);

  Widget title(AppModel app, BuildContext context, AppbarHeaderAttributes headerAttributes,
      String _pageName) {
    switch (headerAttributes.header) {
      case HeaderSelection.Title:
        if (headerAttributes.title != null) {
          return constructTitle(app,
              context,
              _frontEndStyle.textStyle().h1(app, context, headerAttributes.title!),
              null);
        }
        break;
      case HeaderSelection.Image:
        if ((headerAttributes.memberMediumModel != null) &&
            (headerAttributes.memberMediumModel!.url != null)) {
          return constructTitle(app,
              context,
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: headerAttributes.memberMediumModel!.url!,
                height: kToolbarHeight,
              ),
              null);
        }
        break;
      case HeaderSelection.Icon:
        if (headerAttributes.icon != null) {
          var icon =
              IconHelper.getIconFromModel(iconModel: headerAttributes.icon);
          if (icon != null) {
            return constructTitle(app, context, icon, _pageName);
          }
        }
        break;
    }
    return pageName(app, context, _pageName);
  }

  Widget pageName(AppModel app, BuildContext context, String pageName) {
    return _frontEndStyle.textStyle().h1(app, context, pageName);
  }

  Widget constructTitle(AppModel app,
      BuildContext context, Widget widget, String? _pageName) {
    return Row(children: [
      widget,
      Container(width: 20),
      if (_pageName != null) pageName(app, context, _pageName)
    ]);
  }

  Widget button(AppModel app,
      BuildContext context,
    AbstractMenuItemAttributes item,
    RgbModel? menuBackgroundColor,
    RgbModel? selectedIconColor,
    RgbModel? iconColor,
  ) {
    var _color = item.isActive
        ? RgbHelper.color(rgbo: selectedIconColor)
        : RgbHelper.color(rgbo: iconColor);

    var _rgbcolor = item.isActive ? selectedIconColor : iconColor;
    if (item is MenuItemAttributes) {
      if (item.icon != null) {
        return IconButton(
            icon: IconHelper.getIconFromModel(iconModel: item.icon)!,
            color: _color,
            onPressed: item.onTap);
      } else if (item.imageURL != null) {
        return IconButton(
            icon: Image.network(item.imageURL!),
            color: RgbHelper.color(rgbo: iconColor),
            onPressed: item.onTap);
      } else {
        return Center(
            child: _frontEndStyle.buttonStyle().button(app,
                  context,
                  label: item.label == null ? '?' : item.label!,
                  onPressed: item.onTap,
                ));
      }
    } else if (item is MenuItemWithMenuItems) {
      var icon =
          IconHelper.getIconFromModel(iconModel: item.icon, color: _rgbcolor);
      var text = _frontEndStyle.textStyle().text(app, context, (item.label!));
      var popupMenu = popupMenuButton<int>(
        app, context,
          icon: icon,
          child: icon == null ? text : null,
          onSelected: (int result) {
            var thisItem = item.items[result];
            if (thisItem is MenuItemWithMenuItems) {
              _hasMenu.openMenu(app, context,
                  position: RelativeRect.fromLTRB(1000.0, 0.0, 0.0, 0.0),
                  menuItems: thisItem.items,
                  popupMenuBackgroundColorOverride: menuBackgroundColor);
            } else if (thisItem is MenuItemAttributes) {
              thisItem.onTap();
            }
          },
          itemBuilder: (BuildContext context) {
            var entries = <PopupMenuEntry<int>>[];
            var index = 0;
            item.items.forEach((thisItem) {
              var style = thisItem.isActive
                  ? _frontEndStyle.textStyleStyle().styleH3(app, context)
                  : _frontEndStyle.textStyleStyle().styleH4(app, context);
              var label = thisItem.label!;
              var menuItem = popupMenuItem<int>(
                app, context,
                value: index,
                label: label,
              );
              entries.add(menuItem);
              index++;
            });

            return entries;
          });

      return Theme(
          data: Theme.of(context).copyWith(
            cardColor: RgbHelper.color(rgbo: menuBackgroundColor),
          ),
          child: popupMenu);
    } else {
      throw Exception("item $item not supported");
    }
  }
}
