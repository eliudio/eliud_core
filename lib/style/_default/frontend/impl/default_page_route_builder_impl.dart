import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_page_route_builder.dart';
import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

class DefaultPageRouteBuilderImpl
    implements HasPageRouteBuilder {

  DefaultPageRouteBuilderImpl();

  @override
  PageRouteBuilder pageRoute(String name, Map<String, dynamic>? parameters, Widget page) {
    return FadeRoute(name: name, parameters: parameters, page: page, milliseconds: 1000);
  }
}
