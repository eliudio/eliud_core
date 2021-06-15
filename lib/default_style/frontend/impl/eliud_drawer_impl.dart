import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/menu_helper.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/default_style/shared/tools.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudDrawerImpl implements HasDrawer {
  final EliudStyle _eliudStyle;

  EliudDrawerImpl(this._eliudStyle);

  @override
  Drawer drawer(BuildContext context,
      {String? currentPage, required DrawerType drawerType, DrawerHeader1Attributes? header1, DrawerHeader2Attributes? header2, BackgroundModel? backgroundOverride, required List<DrawerItemAttributes> items}) {
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
            height: header1.height == 0
                ? null
                : header1.height,
            child: DrawerHeader(
                child: Center(
                    child: _eliudStyle.frontEndStyle().h3(
                        context, header1.text)),
                decoration: BoxDecorationHelper.boxDecoration(
                    theState, background))),
      );
    }

    if (header2 != null) {
      widgets.add(Container(
        height: header2.height == 0 ? null : header2.height,
        child: DrawerHeader(
            child: Center(
              child: _eliudStyle.frontEndStyle()
                  .h4(context, header2.text!),
            )),
      ));
    }

    var member = theState is LoggedIn ? theState.member : null;

    for (var item in items) {
      var style = item.isActive
          ? _eliudStyle.frontEndStyle()
          .styleH3(context)
          : _eliudStyle.frontEndStyle()
          .styleH4(context);
      MenuHelper.addWidget(
          context, widgets, item.menuItemModel, style, member, currentPage);
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
            decoration: BoxDecorationHelper.boxDecoration(
                theState, background),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widgets,
            )));
  }
}

