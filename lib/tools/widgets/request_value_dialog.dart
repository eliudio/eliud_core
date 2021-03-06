import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_field.dart';
import 'dialog_helper.dart';

class RequestValueDialog extends StatefulWidget {
  final String title;
  final String yesButtonText;
  final String noButtonText;
  final String hintText;
  final Function(String response) yesFunction;
  final Function noFunction;
  final String initialValue;

  RequestValueDialog({
    Key key,
    this.title,
    this.yesButtonText,
    this.noButtonText,
    this.hintText,
    this.yesFunction,
    this.noFunction,
    this.initialValue,
  }) : super(key: key);

  @override
  _RequestValueDialogState createState() => _RequestValueDialogState();
}

class _RequestValueDialogState extends State<RequestValueDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    String feedback;
    return dialogHelper.build(
        title: widget.title,
        contents: DialogStateHelper().getListTile(
            leading: Icon(Icons.message),
            title: DialogField(
              valueChanged: (value) => feedback = value,
              initialValue: widget.initialValue,
              decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.hintText,
              ),
            )),
        buttons: <TextButton>[
          TextButton(
              onPressed: widget.noFunction, child: Text(widget.noButtonText)),
          TextButton(
              onPressed: () => widget.yesFunction(feedback),
              child: Text(widget.yesButtonText)),
        ]);
  }
}
