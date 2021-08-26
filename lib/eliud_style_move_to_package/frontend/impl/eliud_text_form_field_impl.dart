import 'package:eliud_core/style/frontend/has_text_form_field.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudTextFormFieldImpl implements HasTexFormField {
  final EliudStyle _eliudStyle;

  EliudTextFormFieldImpl(this._eliudStyle);

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
        style: TextStyle(
            color: RgbHelper.color(
                rgbo:
                    _eliudStyle.eliudStyleAttributesModel.formFieldTextColor)),
        readOnly: readOnly,
        onChanged: onChanged,
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldTextColor))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldFocusColor))),
          icon: icon == null
              ? null
              : Icon(icon,
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldHeaderColor)),
          labelText: labelText,
        ),
        keyboardType: TextInputType.text,
        validator: validator,
        initialValue: initialValue);
  }

  @override
  Widget textField(BuildContext context,
      {required bool readOnly,
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
      }) {
    return TextField(
      textAlign: TextAlign.left,
      textInputAction: TextInputAction.go,
      controller: controller,
      style:
        _eliudStyle.frontEndStyle().textStyleStyle().styleText(context),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            _eliudStyle.frontEndStyle().textStyleStyle().styleText(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.only(left: 8),
        fillColor: Colors.grey,
      ),
    );
  }
}
