import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

enum FieldType { Double, Int, String }

abstract class AdminFormStyle {
  PreferredSizeWidget constructAppBar(BuildContext context, String title);
  Widget groupTitle(BuildContext context, String title);
  Widget divider(BuildContext context);
  Widget textFormField(
      BuildContext context, String labelText, IconData icon, bool readOnly, TextEditingController _controller, FieldType? fieldType,
      {FormFieldValidator<String>? validator, String? hintText});
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue, String title, String subTitle, ValueChanged<T?>? valueChanged);
  Widget checkboxListTile(BuildContext context, String title, bool? value, ValueChanged<bool?>? onChanged);
  Widget submitButton(BuildContext context, String text,
      {VoidCallback? onPressed});
  Widget container(BuildContext context, Widget child, FormAction formAction);
}
