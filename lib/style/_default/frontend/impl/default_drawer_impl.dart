import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultDrawerImpl implements HasDrawer {
  final FrontEndStyle _frontEndStyle;

  DefaultDrawerImpl(this._frontEndStyle);

  @override
  Drawer drawer(BuildContext context,
      {required DrawerType drawerType,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items,
      Key? key}) {
    var theState = AccessBloc.getState(context);
    var widgets = <Widget>[];
    if (header1 != null) {
      widgets.add(
        Container(
            height: header1.height == 0 ? null : header1.height,
            child: DrawerHeader(
                child: Center(
                    child:
                    _frontEndStyle.textStyle().h3(context, header1.text)),
                decoration:
                    BoxDecorationHelper.boxDecoration(theState, header1.backgroundOverride))),
      );
    }

    if (header2 != null) {
      widgets.add(Container(
        height: header2.height == 0 ? null : header2.height,
        child: DrawerHeader(
            child: Center(
          child: _frontEndStyle.textStyle().h4(context, header2.text),
        )),
      ));
    }

    for (var item in items) {
      var theIcon = item.icon == null
              ? null
              : IconHelper.getIconFromModelWithFlutterColor(
              iconModel: item.icon, );
      var theText = item.isActive ? _frontEndStyle.textStyle().h3(context, item.label!, textAlign: TextAlign.center) : _frontEndStyle.textStyle().h4(context, item.label!, textAlign: TextAlign.center);
      widgets.add(ListTile(
          leading: theIcon,
          title: theText,
          onTap: () {
            if (item is MenuItemAttributes) {
              item.onTap();
            } else if (item is MenuItemWithMenuItems) {
              var theMenuItemWithMenuItems = item as MenuItemWithMenuItems;
              _frontEndStyle.menuStyle().openMenu(context,
                  position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                  menuItems: theMenuItemWithMenuItems.items,
                  popupMenuBackgroundColorOverride:
                      popupMenuBackgroundColorOverride);
            }
          }));
    }

    var background = backgroundOverride;
    return Drawer(
        key: key,
        child: Container(
            decoration: BoxDecorationHelper.boxDecoration(theState, background),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widgets,
            )));
  }
}
