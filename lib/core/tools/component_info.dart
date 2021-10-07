import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../registry.dart';

class ComponentInfo {
  final List<BodyComponentModel>? componentModels;
  final Map<String, dynamic>? parameters;
  final AppLoaded state;
  final List<Widget> widgets;
  final HasFab? hasFab;
  final Layout layout;
  final BackgroundModel? backgroundOverride;
  final GridViewModel? gridView;

  ComponentInfo(
      this.componentModels,
      this.parameters,
      this.widgets,
      this.hasFab,
      this.state,
      this.layout,
      this.backgroundOverride,
      this.gridView);

  static HasFab? _getFab(List<Widget?> components) {
    HasFab? hasFab;
    components.forEach((element) {
      if (element is HasFab) {
        hasFab = element as HasFab?;
      }
    });
    return hasFab;
  }

//  ComponentInfo(this.widgets, this.hasFab, this.state, this.layout, this.background, this.gridView);

  static ComponentInfo getComponentInfo(
      BuildContext context,
      List<BodyComponentModel>? componentModels,
      Map<String, dynamic>? parameters,
      AppLoaded state,
      Layout layout,
      BackgroundModel? background,
      GridViewModel? gridView) {
    if (componentModels == null) throw Exception("componentModels is null");
    var widgets = <Widget>[];
    componentModels.forEach((model) {
      var key = GlobalKey();
      var component = Registry.registry()!.component(
          state,
          model.componentName!, model.componentId!,
          key: key,
          parameters: parameters);
      var bodyComponent = Decorations.instance().createDecoratedBodyComponent(context, key,
              () => component,
          model)();
      widgets.add(bodyComponent);
    });

    var hasFab = _getFab(widgets);
    return ComponentInfo(componentModels, parameters, widgets, hasFab, state,
        layout, background, gridView);
  }
}
