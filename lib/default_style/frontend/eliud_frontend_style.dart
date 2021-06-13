import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/default_style/shared/tools.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:flutter/material.dart';
import '../eliud_style.dart';
import 'impl/eliud_page_body_impl.dart';

class EliudFrontEndStyle extends EliudSharedImplementation
    implements FrontEndStyle {
  final EliudStyle _eliudStyle;
  late EliudPageBodyImpl eliudPageBodyImpl;

  EliudFrontEndStyle(this._eliudStyle) : super(_eliudStyle) {
    eliudPageBodyImpl = EliudPageBodyImpl(_eliudStyle);
  }

  @override
  Widget container(BuildContext context, {Widget? child}) {
    var accessState = AccessBloc.getState(context);
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecorationHelper.boxDecoration(accessState,
            _eliudStyle.eliudStyleAttributesModel.formAppBarBackground),
        child: child);
  }

  @override
  Widget bottomNavigatorBar(BuildContext context,
      {required List<BottomNavigationBarItemAttributes> items,
      BackgroundModel? background,
      ValueChanged<int>? onTap}) {
    var accessState = AccessBloc.getState(context);
    return Container(
        decoration: background == null
            ? null
            : BoxDecorationHelper.boxDecoration(accessState, background),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            onTap: onTap,
            currentIndex: 0,
            fixedColor: Colors.teal,
            items: items.map((item) {
              var text = item.isActive
                  ? _eliudStyle
                      .frontEndStyle()
                      .h3(context, item.label)
                  : _eliudStyle
                      .frontEndStyle()
                      .h4(context, item.label);
              var icon = item.isActive
                  ? _eliudStyle
                      .frontEndStyle()
                      .h3Icon(context, item.icon)
                  : _eliudStyle
                      .frontEndStyle()
                      .h4Icon(context, item.icon);
              return BottomNavigationBarItem(
                title: text,
                icon: icon,
              );
            }).toList()));
  }

  @override
  Widget pageBody(BuildContext context, {BackgroundModel? backgroundOverride, required List<Widget> components, Layout? layout, GridViewModel? gridView}) {
    return eliudPageBodyImpl.pageBody(context, backgroundOverride: backgroundOverride, components: components, layout: layout, gridView: gridView);
  }
}

