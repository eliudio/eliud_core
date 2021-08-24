import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/style/frontend/has_table.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudTableImpl
    implements HasTable {
  final EliudStyle _eliudStyle;

  EliudTableImpl(this._eliudStyle);

  @override
  Widget table(BuildContext context, {required List<TableRow> children}) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      border: TableBorder.symmetric(inside: BorderSide(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.dividerColor))),
      children: children,
    );
  }

}
