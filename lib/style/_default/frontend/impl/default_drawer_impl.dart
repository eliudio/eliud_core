import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
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
  Drawer drawer(AppModel app, BuildContext context,
      {required DrawerType drawerType,
      required MemberModel? member,
      DrawerHeader1Attributes? header1,
      DrawerHeader2Attributes? header2,
      BackgroundModel? backgroundOverride,
      RgbModel? popupMenuBackgroundColorOverride,
      required List<AbstractMenuItemAttributes> items,
      Key? key}) {
    var widgets = <Widget>[];
    if (header1 != null) {
      var child = Center(
          child: _frontEndStyle.textStyle().h3(app, context, header1.text));
      var padding = BoxDecorationHelper.determinePadding(
          app, member, header1.backgroundOverride);
      if (padding != null) {
        widgets.add(
          Container(
              clipBehavior: Clip.none,
              height: header1.height == 0 ? null : header1.height,
              child: DrawerHeader(
                  child: child,
                  margin: BoxDecorationHelper.determineMargin(
                      app, member, header1.backgroundOverride),
                  padding: padding,
                  decoration: BoxDecorationHelper.boxDecoration(
                      app, member, header1.backgroundOverride))),
        );
      } else {
        widgets.add(
          Container(
              clipBehavior: Clip.none,
              height: header1.height == 0 ? null : header1.height,
              child: DrawerHeader(
                  child: child,
                  margin: BoxDecorationHelper.determineMargin(
                      app, member, header1.backgroundOverride),
                  decoration: BoxDecorationHelper.boxDecoration(
                      app, member, header1.backgroundOverride))),
        );
      }
    }

    if (header2 != null) {
      widgets.add(Container(
        height: header2.height == 0 ? null : header2.height,
        child: DrawerHeader(
            child: Center(
          child: _frontEndStyle.textStyle().h4(app, context, header2.text),
        )),
      ));
    }

    for (var item in items) {
      var theIcon = item.icon == null
          ? null
          : IconHelper.getIconFromModelWithFlutterColor(
              iconModel: item.icon,
            );
      var theText = item.isActive
          ? _frontEndStyle
              .textStyle()
              .h3(app, context, item.label!, textAlign: TextAlign.center)
          : _frontEndStyle
              .textStyle()
              .h4(app, context, item.label!, textAlign: TextAlign.center);
      widgets.add(ListTile(
          leading: theIcon,
          title: theText,
          onTap: () {
            if (item is MenuItemAttributes) {
              item.onTap();
            } else if (item is MenuItemWithMenuItems) {
              var theMenuItemWithMenuItems = item;
              _frontEndStyle.menuStyle().openMenu(app, context,
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
            clipBehavior: (background == null) ? Clip.none : Clip.hardEdge,
            margin:
                BoxDecorationHelper.determineMargin(app, member, background),
            padding:
                BoxDecorationHelper.determinePadding(app, member, background),
            decoration:
                BoxDecorationHelper.boxDecoration(app, member, background),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widgets,
            )));
  }
}
