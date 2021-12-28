import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasListTile {
  Widget getListTile(AppModel app, BuildContext context,
      {Key? key,
      GestureTapCallback? onTap,
      Widget? leading,
      Widget? trailing,
      Widget? title,
      Widget? subtitle,
      bool? isThreeLine});
  Widget radioListTile<T>(AppModel app, BuildContext context, T t, T? groupValue,
      String title, String? subTitle, ValueChanged<T?>? valueChanged);
  Widget checkboxListTile(AppModel app, BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged);
}

Widget getListTile(BuildContext context,AppModel app,
        {Key? key,
        GestureTapCallback? onTap,
        Widget? leading,
        Widget? trailing,
        Widget? title,
        Widget? subtitle,
        bool? isThreeLine}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .listTileStyle()
        .getListTile(app, context,
            key: key,
            onTap: onTap,
            leading: leading,
            trailing: trailing,
            title: title,
            subtitle: subtitle,
            isThreeLine: isThreeLine);

Widget radioListTile<T>(AppModel app, BuildContext context, T t, T? groupValue, String title,
        String? subTitle, ValueChanged<T?>? valueChanged) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .listTileStyle()
        .radioListTile(app, context, t, groupValue, title, subTitle, valueChanged);

Widget checkboxListTile(AppModel app,BuildContext context, String title, bool? value,
        ValueChanged<bool?>? onChanged) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .listTileStyle()
        .checkboxListTile(app, context, title, value, onChanged);
