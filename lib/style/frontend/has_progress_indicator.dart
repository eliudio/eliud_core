import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasProgressIndicator {
  Widget progressIndicator(BuildContext context,
      {Animation<Color>? valueColor});
  Widget progressIndicatorWithValue(BuildContext context,
      {Animation<Color>? valueColor, required double value});
}

Widget progressIndicator(BuildContext context,
        {Animation<Color>? valueColor}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .progressIndicatorStyle()
        .progressIndicator(context, valueColor: valueColor);

Widget progressIndicatorWithValue(BuildContext context,
        {Animation<Color>? valueColor, required double value}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .progressIndicatorStyle()
        .progressIndicatorWithValue(context,
            valueColor: valueColor, value: value);
