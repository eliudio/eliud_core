import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasListTile {
  Widget getListTile(BuildContext context,
      {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine});
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue,
      String title, String? subTitle, ValueChanged<T?>? valueChanged);
  Widget checkboxListTile(BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged);
}

Widget getListTile(BuildContext context,
        {Widget? leading,
        Widget? title,
        Widget? subtitle,
        bool? isThreeLine}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .listTileStyle()
        .getListTile(context,
            leading: leading,
            title: title,
            subtitle: subtitle,
            isThreeLine: isThreeLine);

Widget radioListTile<T>(BuildContext context, T t, T? groupValue, String title,
        String? subTitle, ValueChanged<T?>? valueChanged) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .listTileStyle()
        .radioListTile(context, t, groupValue, title, subTitle, valueChanged);

Widget checkboxListTile(BuildContext context, String title, bool? value,
        ValueChanged<bool?>? onChanged) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .listTileStyle()
        .checkboxListTile(context, title, value, onChanged);
