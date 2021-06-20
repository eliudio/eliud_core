import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:flutter/material.dart';

abstract class AdminFormStyle /*implements HasTexFormField, HasDivider, HasButton, HasSimpleAppBar */ {
  PreferredSizeWidget appBarWithString(BuildContext context,
      {required String title,
        List<Widget>? actions,
        IconThemeData? iconTheme,
        BackgroundModel? backgroundOverride});

  Widget groupTitle(BuildContext context, String title);

  Widget radioListTile<T>(BuildContext context, T t, T? groupValue,
      String title, String subTitle, ValueChanged<T?>? valueChanged);

  Widget checkboxListTile(BuildContext context, String title, bool? value,
      ValueChanged<bool?>? onChanged);

  Widget container(BuildContext context, Widget child, FormAction formAction);

  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});

  Widget textFormField(BuildContext context, {
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

  Widget divider(BuildContext context);
}