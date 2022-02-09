import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:flutter/material.dart';

class PageBodyHelper {
  final FrontEndStyle _frontEndStyle;

  PageBodyHelper(this._frontEndStyle);

  Widget pageBody(AppModel app, BuildContext context,
      {BackgroundModel? background,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    var accessState = AccessBloc.getState(context);
    try {
      if (components.isNotEmpty) {
        if (background == null) {
          return _container(context, components, layout, gridView);
        } else {
          return Stack(children: <Widget>[
            Container(
              decoration:
                  BoxDecorationHelper.boxDecoration(accessState.getMember(), background),
            ),
            _container(context, components, layout, gridView)
          ]);
        }
      }
      return Container(color: Colors.white);
    } catch (_) {
      return _frontEndStyle.textStyle().text(app, context, "Error whilst constructing the body");
    }
  }

  Widget _container(BuildContext context, List<Widget> components,
      Layout? layout, GridViewModel? gridView) {
    // for PolicyPresentation /
//    if (components.length == 1) return _justTheFirst(components);
    switch (layout) {
      case Layout.GridView:
        return _gridView(context, components, gridView);
      case Layout.ListView:
        return _listView(context, components);
      case Layout.OnlyTheFirstComponent:
        return _justTheFirst(components);
      case Layout.Unknown:
        return _listView(context, components);
    }
    return _listView(context, components);
  }

  Widget _listView(BuildContext context, List<Widget?> components) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: components.length,
      itemBuilder: (BuildContext context, int index) {
        return components[index]!;
      },
    );
  }

  Widget _justTheFirst(List<Widget> components) {
    return components[0];
  }

  Widget _gridView(
      BuildContext context, List<Widget> components, GridViewModel? model) {
    return GridViewHelper.container(context, components, model);
  }
}
