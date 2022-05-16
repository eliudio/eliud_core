import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

class ComponentTitleHelper {
  static Widget title(BuildContext context, AppModel app, String componentName, String componentId) {
    var componentConstructor =
    Registry.registry()!.registryMap()[componentName];
    if (componentConstructor != null) {
      return FutureBuilder<dynamic>(
          future:
          componentConstructor.getModel(app: app, id: componentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var model = snapshot.data;
              return text(app, context, componentName + '-' + (model.description ?? componentId));
            } else {
              return Container();
            }
          });
    } else {
      return text(app, context, '?');
    }
  }
}
