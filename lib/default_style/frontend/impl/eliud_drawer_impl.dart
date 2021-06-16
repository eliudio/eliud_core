import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/has_drawer.dart';
import 'package:eliud_core/style/shared/types.dart';
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
                        _eliudStyle.frontEndStyle().h3(context, header1.text)),
                decoration:
                    BoxDecorationHelper.boxDecoration(theState, background))),
      );
    }

    if (header2 != null) {
      widgets.add(Container(
        height: header2.height == 0 ? null : header2.height,
        child: DrawerHeader(
            child: Center(
          child: _eliudStyle.frontEndStyle().h4(context, header2.text),
        )),
      ));
    }

    for (var item in items) {
      if (item is MenuItemAttributes) {
        var style = item.isActive
            ? _eliudStyle.frontEndStyle().styleH3(context)
            : _eliudStyle.frontEndStyle().styleH4(context);

        widgets.add(ListTile(
            leading: item.icon == null
                ? null
                : IconHelper.getIconFromModelWithFlutterColor(
                    iconModel: item.icon, color: style!.color),
            title: Text(item.label!, textAlign: TextAlign.center, style: style),
            onTap: () {
              if (item is MenuItemAttributes) {
                item.onTap();
              } else if (item is MenuItemWithMenuItems) {
                var theMenuItemWithMenuItems = item as MenuItemWithMenuItems;
                _eliudStyle.frontEndStyle().openMenu(context,
                    position: RelativeRect.fromLTRB(1000.0, 1000.0, 0.0, 0.0),
                    menuItems: theMenuItemWithMenuItems.items,
                    popupMenuBackgroundColorOverride:
                        popupMenuBackgroundColorOverride);
              }
            }));
      } else if (item is MenuItemWithMenuItems) {
        // todo
      }
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
