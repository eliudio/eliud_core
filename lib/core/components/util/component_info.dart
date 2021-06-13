import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ComponentInfo {
  final List<BodyComponentModel>? componentModels;
  final Map<String, dynamic>? parameters;
  final AppLoaded state;
  final List<Widget> widgets;
  final HasFab? hasFab;
  final Layout layout;
  final BackgroundModel? background;
  final GridViewModel? gridView;

  ComponentInfo(this.componentModels, this.parameters, this.widgets, this.hasFab, this.state, this.layout, this.background, this.gridView);

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

  static ComponentInfo getComponentInfo(List<BodyComponentModel>? componentModels, Map<String, dynamic>? parameters, AppLoaded state, Layout layout, BackgroundModel? background, GridViewModel? gridView) {
    if (componentModels == null) throw Exception("componentModels is null");
    var widgets = componentModels
        .map((model) => Registry.registry()!.component(
        model.componentName!, model.componentId!, parameters: parameters))
        .toList();
    var hasFab = _getFab(widgets);
    return ComponentInfo(componentModels, parameters, widgets, hasFab, state, layout, background, gridView);
  }
}
