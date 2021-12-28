import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDivider {
  Widget divider(AppModel app, BuildContext context);
  Widget verticalDivider(AppModel app, BuildContext context, double height);
}

Widget divider(AppModel app, BuildContext context) => StyleRegistry.registry()
    .styleWithApp(app)
    .frontEndStyle()
    .dividerStyle()
    .divider(app, context);

Widget verticalDivider(AppModel app, BuildContext context, double height) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dividerStyle()
        .verticalDivider(app, context, height);
