import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDivider {
  Widget divider(BuildContext context);
  Widget verticalDivider(BuildContext context, double height);
}

Widget divider(BuildContext context) => StyleRegistry.registry()
    .styleWithContext(context)
    .frontEndStyle()
    .dividerStyle()
    .divider(context);

Widget verticalDivider(BuildContext context, double height) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dividerStyle()
        .verticalDivider(context, height);
