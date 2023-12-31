import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core_helpers/tools/has_fab.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_page_body.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/grid_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../registry.dart';

class ComponentInfo {
  final List<BodyComponentModel>? componentModels;
  final Map<String, dynamic>? parameters;
  final List<Widget> widgets;
  final HasFab? hasFab;
  final Layout layout;
  final BackgroundModel? backgroundOverride;
  final GridViewModel? gridView;

  ComponentInfo(this.componentModels, this.parameters, this.widgets,
      this.hasFab, this.layout, this.backgroundOverride, this.gridView);

  static HasFab? _getFab(List<Widget?> components) {
    HasFab? hasFab;
    for (var element in components) {
      if (element is HasFab) {
        hasFab = element as HasFab?;
      }
    }
    return hasFab;
  }

  static ComponentInfo getComponentInfo(
      BuildContext context,
      AppModel app,
      List<BodyComponentModel>? componentModels,
      Map<String, dynamic>? parameters,
/*
      AccessDetermined accessDetermined,
*/
      Layout layout,
      BackgroundModel? background,
      GridViewModel? gridView) {
    if (componentModels == null) throw Exception("componentModels is null");
    var widgets = <Widget>[];
    for (var model in componentModels) {
      var key = GlobalKey();
      var bodyComponent = Decorations.instance().createDecoratedBodyComponent(
          app,
          context,
          key,
          () => Registry.registry()!.component(context, app,
              /*accessDetermined,*/ model.componentName!, model.componentId!,
              key: key, parameters: parameters),
          model)();
      widgets.add(bodyComponent);
    }

    var hasFab = _getFab(widgets);
    return ComponentInfo(componentModels, parameters, widgets, hasFab, layout,
        background, gridView);
  }
}
