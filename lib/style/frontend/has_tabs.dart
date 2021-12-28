import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasTabs {
  Widget tabBar(AppModel app, BuildContext context,
      {required List<String> items, required TabController tabController});
}

Widget tabBar(AppModel app, BuildContext context,
        {required List<String> items, required TabController tabController}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .tabsStyle()
        .tabBar(app, context, items: items, tabController: tabController);
