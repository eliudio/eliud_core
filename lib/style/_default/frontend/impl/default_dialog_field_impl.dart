import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/dialog/dialog_field.dart';

class DefaultDialogFieldImpl implements HasDialogField {
  @override
  Widget dialogField(
    AppModel app,
    BuildContext context, {
    InputDecoration? decoration,
    required ValueChanged<String> valueChanged,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? readOnly,
//    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    bool? autocorrect,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    int? maxLength,
  }) {
    return DialogField(
      app: app,
      decoration: decoration,
      valueChanged: valueChanged,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      //toolbarOptions: toolbarOptions,
      showCursor: showCursor,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
    );
  }
}
