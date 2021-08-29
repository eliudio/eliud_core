import 'package:eliud_core/style/frontend/has_table.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultTableImpl
    implements HasTable {
  @override
  Widget table(BuildContext context, {required List<TableRow> children}) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      children: children,
    );
  }

}
