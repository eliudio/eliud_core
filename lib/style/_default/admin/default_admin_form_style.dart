import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultAdminFormStyle implements AdminFormStyle {
  @override
  Widget groupTitle(BuildContext context, String title) {
    return Text(title);
  }

  @override
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue,
      String title, String subTitle, ValueChanged<T?>? valueChanged) {
    return RadioListTile(
        value: t,
        groupValue: groupValue,
        title: Text(title,),
        subtitle: Text(subTitle),
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

  /*
   * This is the container for the entire form
   */
  @override
  Widget container(BuildContext context, Widget child, FormAction formAction) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: child);
  }

  @override
  PreferredSizeWidget appBarWithString(BuildContext context,
      {required String title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride}) {
    return appBarWithWidget(context,
        title: Text(title,),
        actions: actions,
        iconTheme: iconTheme,
        backgroundOverride: backgroundOverride);
  }

  PreferredSizeWidget appBarWithWidget(BuildContext context,
      {required Widget title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride}) {
    var accessState = AccessBloc.getState(context);
    var background;
    if (backgroundOverride != null) {
      background = backgroundOverride;
    }
    return AppBar(
      title: title,
      actions: actions,
      iconTheme: iconTheme,
      flexibleSpace: Container(
          decoration:
              BoxDecorationHelper.boxDecoration(accessState, background)),
    );
  }

  @override
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      );
    }
  }

  @override
  Widget textFormField(
    BuildContext context, {
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
  }) {
    return TextFormField(
        readOnly: readOnly,
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          icon: icon == null
              ? null
              : Icon(icon,),
          labelText: labelText,
        ),
        keyboardType: TextInputType.text,
        validator: validator,
        initialValue: initialValue);
  }

  @override
  @override
  Widget divider(BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,);
  }
}