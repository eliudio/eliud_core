import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class HasDialogField {
  Widget dialogField(BuildContext context,
      {InputDecoration? decoration,
      required ValueChanged<String> valueChanged,
      String? initialValue});
}
