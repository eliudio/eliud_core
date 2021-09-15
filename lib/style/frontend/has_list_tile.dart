import 'package:flutter/material.dart';

abstract class HasListTile {
  Widget getListTile(BuildContext context,
      {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine});
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue,
      String title, String? subTitle, ValueChanged<T?>? valueChanged);
  Widget checkboxListTile(BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged);
}
