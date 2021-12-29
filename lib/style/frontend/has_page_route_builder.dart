import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasPageRouteBuilder {
  PageRouteBuilder pageRoute(String name, Map<String, dynamic>? parameters, Widget page);
}

PageRouteBuilder pageRoute(AppModel app, String name, Map<String, dynamic>? parameters, Widget page) {
    return StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .pageRoutBuilder().pageRoute(name, parameters, page);
}
