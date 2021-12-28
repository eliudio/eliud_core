import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

enum Layout { GridView, ListView, OnlyTheFirstComponent, Unknown }

abstract class HasPageBody {
  Widget pageBody(AppModel app, BuildContext context,
      {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView});
}

Widget pageBody(AppModel app,BuildContext context,
        {BackgroundModel? backgroundOverride,
        required List<Widget> components,
        Layout? layout,
        GridViewModel? gridView}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .pageBodyStyle()
        .pageBody(app, context,
            backgroundOverride: backgroundOverride,
            components: components,
            layout: layout,
            gridView: gridView);

Widget pageBody2(AppModel app, BuildContext context,
    {BackgroundModel? backgroundOverride,
      required List<Widget> components,
      Layout? layout,
      GridViewModel? gridView}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .pageBodyStyle()
        .pageBody(app, context,
        backgroundOverride: backgroundOverride,
        components: components,
        layout: layout,
        gridView: gridView);
