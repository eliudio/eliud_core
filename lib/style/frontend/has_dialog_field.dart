import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style_registry.dart';

abstract class HasDialogField {
  Widget dialogField(AppModel app,
      BuildContext context, {
    InputDecoration? decoration,
    required ValueChanged<String> valueChanged,
    String? initialValue,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatters,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextDirection? textDirection,
    bool? readOnly,
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    bool? autocorrect,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    int? maxLength,
  });
}

Widget dialogField(AppModel app,
  BuildContext context, {
  InputDecoration? decoration,
  required ValueChanged<String> valueChanged,
  String? initialValue,
  TextInputType? keyboardType,
  TextCapitalization? textCapitalization,
  List<TextInputFormatter>? inputFormatters,
  TextAlign? textAlign,
  TextAlignVertical? textAlignVertical,
  TextDirection? textDirection,
  bool? readOnly,
  ToolbarOptions? toolbarOptions,
  bool? showCursor,
  bool? autocorrect,
  bool? enableSuggestions,
  int? maxLines,
  int? minLines,
  bool? expands,
  int? maxLength,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogFieldStyle()
        .dialogField(app,
          context,
          decoration: decoration,
          valueChanged: valueChanged,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          readOnly: readOnly,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
        );
