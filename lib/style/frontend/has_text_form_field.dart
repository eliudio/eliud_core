import 'package:flutter/material.dart';

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
