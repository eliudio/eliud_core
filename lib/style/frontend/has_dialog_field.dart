import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDialogField {
  Widget dialogField(BuildContext context,
      {InputDecoration? decoration,
      required ValueChanged<String> valueChanged,
      String? initialValue});
}

Widget dialogField(BuildContext context,
        {InputDecoration? decoration,
        required ValueChanged<String> valueChanged,
        String? initialValue}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogFieldStyle()
        .dialogField(context,
            decoration: decoration,
            valueChanged: valueChanged,
            initialValue: initialValue);
