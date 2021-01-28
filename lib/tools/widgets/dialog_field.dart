import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void ValueChanged(String value);

class DialogField extends StatefulWidget {
  final InputDecoration decoration;
  final ValueChanged valueChanged;
  final String initialValue;

  const DialogField({Key key, this.decoration, this.valueChanged, this.initialValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DialogFieldState();
  }
}

class _DialogFieldState extends State<DialogField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_fieldChanged);
    if (widget.initialValue != null) {
      myController.text = widget.initialValue;
    }
  }

  void _fieldChanged() {
    widget.valueChanged(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: widget.decoration, controller: myController);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
