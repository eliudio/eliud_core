import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudPageBodyImpl implements HasPageBody {
  final EliudStyle _eliudStyle;

  EliudPageBodyImpl(this._eliudStyle);

  @override
  Widget pageBody(BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) {
    BackgroundModel? background;
    if (backgroundOverride == null) {
      background = _eliudStyle.eliudStyleAttributesModel.appBackground;
    } else {
      background = backgroundOverride;
    }

    var accessState = AccessBloc.getState(context);
    try {
      if (components.isNotEmpty) {
        if (background == null) {
          return _container(context, components, layout, gridView);
        } else {
          return Stack(children: <Widget>[
            Container(
              decoration:
                  BoxDecorationHelper.boxDecoration(accessState, background),
            ),
            _container(context, components, layout, gridView)
          ]);
        }
      }
      return Container(color: Colors.white);
    } catch (_) {
      return Text("Error whilst constructing the body");
    }
  }

  Widget _container(BuildContext context, List<Widget> components,
      Layout? layout, GridViewModel? gridView) {
    if (components.length == 1) return _justTheFirst(components);
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
