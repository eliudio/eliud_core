import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/tools/grid_view_helper.dart';



import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/tools/registry.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../tools/etc.dart';

enum Layout {
  GridView, ListView, OnlyTheFirstComponent, Unknown
}

Layout fromPageLayout(PageLayout? pageLayout) {
  switch (pageLayout) {
    case PageLayout.GridView: return Layout.GridView;
    case PageLayout.ListView: return Layout.ListView;
    case PageLayout.OnlyTheFirstComponent: return Layout.OnlyTheFirstComponent;
    case PageLayout.Unknown: return Layout.Unknown;
  }
  return Layout.Unknown;
}

Layout fromDialogLayout(DialogLayout? dialogLayout) {
  switch (dialogLayout) {
    case DialogLayout.GridView: return Layout.GridView;
    case DialogLayout.ListView: return Layout.ListView;
    case DialogLayout.OnlyTheFirstComponent: return Layout.OnlyTheFirstComponent;
    case DialogLayout.Unknown: return Layout.Unknown;
  }
  return Layout.Unknown;
}

class PageBodyHelper {
  List<Widget> getComponents(List<BodyComponentModel>? componentModels, Map<String, dynamic>? parameters) {
    if (componentModels == null) return [ Text("No components to include") ];
    return componentModels
        .map((model) => Registry.registry()!.component(
        model.componentName ?? "", model.componentId ?? "ID", parameters: parameters))
        .toList();
  }

  Widget theBody(BuildContext context,
      AccessState accessState,
      {BackgroundModel? backgroundDecoration,
        required List<Widget> components,
        Layout? layout,
        GridViewModel? gridView
      }) {
    try {
      if (components.isNotEmpty) {
        if (backgroundDecoration == null) {
          return _container(context, components, layout, gridView);
        } else {
          return Stack(children: <Widget>[
              Container(
                decoration: BoxDecorationHelper.boxDecoration(accessState, backgroundDecoration),
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

  Widget _container(
      BuildContext context, List<Widget> components, Layout? layout, GridViewModel? gridView) {
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

  Widget _listView(
      BuildContext context, List<Widget?> components) {
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
