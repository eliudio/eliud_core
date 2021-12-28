import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:flutter/material.dart';

abstract class AdminFormStyle /*implements HasTexFormField, HasDivider, HasButton, HasSimpleAppBar */ {
  PreferredSizeWidget appBarWithString(AppModel app, BuildContext context,
      {required String title,
        List<Widget>? actions,
        IconThemeData? iconTheme,
        BackgroundModel? backgroundOverride});

  Widget groupTitle(AppModel app, BuildContext context, String title);

  Widget radioListTile<T>(AppModel app, BuildContext context, T t, T? groupValue,
      String title, String subTitle, ValueChanged<T?>? valueChanged);

  Widget checkboxListTile(AppModel app, BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged);

  Widget container(AppModel app, BuildContext context, Widget child, FormAction formAction);

  Widget button(AppModel app, BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});

  Widget textFormField(AppModel app, BuildContext context, {
    required bool readOnly,
    String? initialValue,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    IconData? icon,
    String? labelText,
    String? hintText,
    int? maxLines,
    ValueChanged<String>? onChanged,
    TextEditingController? textEditingController,
  });

  Widget divider(AppModel app, BuildContext context);
}