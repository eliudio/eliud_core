import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/material.dart';

class DefaultListTileImpl implements HasListTile {
  @override
  Widget getListTile(BuildContext context, {Key? key, GestureTapCallback? onTap, Widget? leading, Widget? trailing, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return ListTile(
      key: key,
      onTap: onTap,
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      trailing: trailing,
      title: title,
      subtitle: subtitle,
    );
  }

  @override
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue,
      String title, String? subTitle, ValueChanged<T?>? valueChanged) {
    return RadioListTile(
        value: t,
        groupValue: groupValue,
        title: Text(title,),
        subtitle: subTitle != null ? Text(subTitle) : null,
        onChanged: valueChanged);
  }

  @override
  Widget checkboxListTile(BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged) {
    return CheckboxListTile(
        title: Text(title,),
        value: value,
        onChanged: onChanged);
  }
}
