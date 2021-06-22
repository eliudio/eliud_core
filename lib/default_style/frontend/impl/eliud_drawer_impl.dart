import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_drawer.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import '../../eliud_style.dart';

class EliudDrawerImpl implements HasDrawer {
  final EliudStyle _eliudStyle;

  EliudDrawerImpl(this._eliudStyle);

  @override
  Drawer drawer(BuildContext context,
      {required DrawerType drawerType,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items}) {
    var theState = AccessBloc.getState(context);
    var widgets = <Widget>[];
    if (header1 != null) {
      var background = header1.backgroundOverride;
      if (background == null) {
        if (drawerType == DrawerType.Left) {
          background = _eliudStyle.eliudStyleAttributesModel.drawerHeaderBG;
        } else {
          background =
              _eliudStyle.eliudStyleAttributesModel.profileDrawerHeaderBG;
        }
      }
      widgets.add(
        Container(
            height: header1.height == 0 ? null : header1.height,
            child: DrawerHeader(
                child: Center(
                    child:
                        _eliudStyle.frontEndStyle().textStyle().h3(context, header1.text)),
                decoration:
                    BoxDecorationHelper.boxDecoration(theState, background))),
      );
    }

    if (header2 != null) {
      widgets.add(Container(
        height: header2.height == 0 ? null : header2.height,
        child: DrawerHeader(
            child: Center(
          child: _eliudStyle.frontEndStyle().textStyle().h4(context, header2.text),
        )),
      ));
    }

    for (var item in items) {
      var style = item.isActive
          ? _eliudStyle.frontEndStyle().textStyleStyle().styleH3(context)
          : _eliudStyle.frontEndStyle().textStyleStyle().styleH4(context);

      var theIcon = item.icon == null
              ? null
              : IconHelper.getIconFromModelWithFlutterColor(
              iconModel: item.icon, color: style!.color);
      var theText = item.isActive ? _eliudStyle.frontEndStyle().textStyle().h3(context, item.label!, textAlign: TextAlign.center) : _eliudStyle.frontEndStyle().textStyle().h4(context, item.label!, textAlign: TextAlign.center);
      widgets.add(ListTile(
          leading: theIcon,
          title: theText,
          onTap: () {
            if (item is MenuItemAttributes) {
              item.onTap();
            } else if (item is MenuItemWithMenuItems) {
              var theMenuItemWithMenuItems = item as MenuItemWithMenuItems;
              _eliudStyle.frontEndStyle().menuStyle().openMenu(context,
                  position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                  menuItems: theMenuItemWithMenuItems.items,
                  popupMenuBackgroundColorOverride:
                      popupMenuBackgroundColorOverride);
            }
          }));
    }

    var background = backgroundOverride;
    if (background == null) {
      if (drawerType == DrawerType.Left) {
        background = _eliudStyle.eliudStyleAttributesModel.drawerBG;
      } else {
        background = _eliudStyle.eliudStyleAttributesModel.profileDrawerBG;
      }
    }
    return Drawer(
        child: Container(
            decoration: BoxDecorationHelper.boxDecoration(theState, background),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widgets,
            )));
  }
}
