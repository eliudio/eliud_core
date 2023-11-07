import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasSplit {
  Widget splitView(AppModel app, BuildContext context, Widget container1,
      Widget container2, double ratio, double minRatio, double maxRatio);
}

Widget splitView(AppModel app, BuildContext context, Widget container1,
        Widget container2, double ratio, double minRatio, double maxRatio) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .splitStyle()
        .splitView(
            app, context, container1, container2, ratio, minRatio, maxRatio);
