import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasTable {
  Widget table(BuildContext context, {required List<TableRow> children});
}

Widget table(BuildContext context, {required List<TableRow> children}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .tableStyle()
        .table(context, children: children);
