import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasTexFormField {
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
  });

  Widget textField(
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
    TextAlign? textAlign,
    TextInputAction? textInputAction,
    ValueChanged<String>? onSubmitted,
    TextEditingController? controller,
  });
}

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
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .texFormFieldStyle()
        .textFormField(
          app,
          context,
          readOnly: readOnly,
          initialValue: initialValue,
          validator: validator,
          keyboardType: keyboardType,
          icon: icon,
          labelText: labelText,
          hintText: hintText,
          maxLines: maxLines,
          onChanged: onChanged,
          textEditingController: textEditingController,
        );

Widget textField(
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
  TextAlign? textAlign,
  TextInputAction? textInputAction,
  ValueChanged<String>? onSubmitted,
  TextEditingController? controller,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .texFormFieldStyle()
        .textField(app, context,
            readOnly: readOnly,
            initialValue: initialValue,
            validator: validator,
            keyboardType: keyboardType,
            icon: icon,
            labelText: labelText,
            hintText: hintText,
            maxLines: maxLines,
            onChanged: onChanged,
            textEditingController: textEditingController,
            textAlign: textAlign,
            textInputAction: textInputAction,
            onSubmitted: onSubmitted,
            controller: controller);
