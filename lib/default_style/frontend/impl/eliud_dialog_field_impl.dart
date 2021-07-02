import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dialog/dialog_field.dart';

class EliudDialogFieldImpl implements HasDialogField {
  final Style _style;

  EliudDialogFieldImpl(this._style);

  @override
  Widget dialogField(BuildContext context,
      {InputDecoration? decoration,
      required ValueChanged<String> valueChanged,
      String? initialValue}) {
    return DialogField(
        decoration: decoration,
        valueChanged: valueChanged,
        initialValue: initialValue);
  }
}
