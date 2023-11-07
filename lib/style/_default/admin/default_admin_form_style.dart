import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultAdminFormStyle implements AdminFormStyle {
  @override
  Widget groupTitle(AppModel app, BuildContext context, String title) {
    return Text(title);
  }

  @override
  Widget radioListTile<T>(
      AppModel app,
      BuildContext context,
      T t,
      T? groupValue,
      String title,
      String subTitle,
      ValueChanged<T?>? valueChanged) {
    return RadioListTile(
        value: t,
        groupValue: groupValue,
        title: Text(
          title,
        ),
        subtitle: Text(subTitle),
        onChanged: valueChanged);
  }

  @override
  Widget checkboxListTile(AppModel app, BuildContext context, String title,
      bool? value, ValueChanged<bool?>? onChanged) {
    return CheckboxListTile(
        title: Text(
          title,
        ),
        value: value,
        onChanged: onChanged);
  }

  /*
   * This is the container for the entire form
   */
  @override
  Widget container(
      AppModel app, BuildContext context, Widget child, FormAction formAction) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: child);
  }

  @override
  PreferredSizeWidget appBarWithString(AppModel app, BuildContext context,
      {required String title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride}) {
    return appBarWithWidget(app, context,
        title: Text(
          title,
        ),
        actions: actions,
        iconTheme: iconTheme,
        backgroundOverride: backgroundOverride);
  }

  PreferredSizeWidget appBarWithWidget(AppModel app, BuildContext context,
      {required Widget title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride}) {
    var accessState = AccessBloc.getState(context);
    BackgroundModel? background;
    if (backgroundOverride != null) {
      background = backgroundOverride;
    }
    return AppBar(
      title: title,
      actions: actions,
      iconTheme: iconTheme,
      flexibleSpace: Container(
          clipBehavior: BoxDecorationHelper.determineClipBehaviour(
              app, accessState.getMember(), background),
          margin: BoxDecorationHelper.determineMargin(
              app, accessState.getMember(), background),
          padding: BoxDecorationHelper.determinePadding(
              app, accessState.getMember(), background),
          decoration: BoxDecorationHelper.boxDecoration(
              app, accessState.getMember(), background)),
    );
  }

  @override
  Widget button(AppModel app, BuildContext context,
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
    AppModel app,
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
              : Icon(
                  icon,
                ),
          labelText: labelText,
        ),
        keyboardType: TextInputType.text,
        validator: validator,
        initialValue: initialValue);
  }

  @override
  @override
  Widget divider(AppModel app, BuildContext context) {
    return Divider(
      height: 1.0,
      thickness: 1.0,
    );
  }
}
