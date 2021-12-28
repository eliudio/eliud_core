import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasTable {
  Widget table(AppModel app, BuildContext context, {required List<TableRow> children});
}

Widget table(AppModel app, BuildContext context, {required List<TableRow> children}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .tableStyle()
        .table(app, context, children: children);
