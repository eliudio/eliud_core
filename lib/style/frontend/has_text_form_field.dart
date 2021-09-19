import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasTexFormField {
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
  });

  Widget textField(
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
        .styleWithContext(context)
        .frontEndStyle()
        .texFormFieldStyle()
        .textFormField(
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
        .styleWithContext(context)
        .frontEndStyle()
        .texFormFieldStyle()
        .textField(context,
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
