import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import '../../eliud_style.dart';

class EliudListTileImpl implements HasListTile {
  final EliudStyle _eliudStyle;

  EliudListTileImpl(this._eliudStyle);

  @override
  Widget getListTile(BuildContext context, {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return ListTile(
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }
}
