import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDialogField {
  Widget dialogField(
    BuildContext context, {
    InputDecoration? decoration,
    required ValueChanged<String> valueChanged,
    String? initialValue,
    TextInputType? keyboardType,
    TextCapitalization? textCapitalization,
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

Widget dialogField(
  BuildContext context, {
  InputDecoration? decoration,
  required ValueChanged<String> valueChanged,
  String? initialValue,
  TextInputType? keyboardType,
  TextCapitalization? textCapitalization,
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
        .styleWithContext(context)
        .frontEndStyle()
        .dialogFieldStyle()
        .dialogField(
          context,
          decoration: decoration,
          valueChanged: valueChanged,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
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
