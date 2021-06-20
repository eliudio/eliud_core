import 'package:eliud_core/style/shared/has_dialog_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../eliud_style.dart';
import 'dialog/dialog_field.dart';

class EliudDialogFieldImpl implements HasDialogField {
  final EliudStyle _eliudStyle;

  EliudDialogFieldImpl(this._eliudStyle);

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
