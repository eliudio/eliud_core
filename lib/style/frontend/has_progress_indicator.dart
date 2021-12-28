import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasProgressIndicator {
  Widget progressIndicator(AppModel app, BuildContext context,
      {Animation<Color>? valueColor});
  Widget progressIndicatorWithValue(AppModel app, BuildContext context,
      {Animation<Color>? valueColor, required double value});
}

Widget progressIndicator(AppModel app, BuildContext context,
        {Animation<Color>? valueColor}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .progressIndicatorStyle()
        .progressIndicator(app, context, valueColor: valueColor);

Widget progressIndicatorWithValue(AppModel app, BuildContext context,
        {Animation<Color>? valueColor, required double value}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .progressIndicatorStyle()
        .progressIndicatorWithValue(app, context,
            valueColor: valueColor, value: value);
