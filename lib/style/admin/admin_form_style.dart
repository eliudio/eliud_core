import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:flutter/material.dart';

abstract class AdminFormStyle implements HasTexFormField, HasDivider, HasButton, HasAppBar {
  Widget groupTitle(BuildContext context, String title);
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue, String title, String subTitle, ValueChanged<T?>? valueChanged);
  Widget checkboxListTile(BuildContext context, String title, bool? value, ValueChanged<bool?>? onChanged);
  Widget container(BuildContext context, Widget child, FormAction formAction);
}
