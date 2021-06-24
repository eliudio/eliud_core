import 'dart:math';
import 'dart:ui';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_field.dart';
import 'dialog_helper.dart';

class RequestValueDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final String? ackButtonLabel;
  final String? nackButtonLabel;
  final String? hintText;
  final Function(String? response) onPressed;
  final String? initialValue;
  final DialogButtonPosition dialogButtonPosition;

  RequestValueDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    this.ackButtonLabel,
    this.nackButtonLabel,
    this.hintText,
    required this.onPressed,
    this.initialValue,
    required this.dialogButtonPosition,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper();
  }

  @override
  _RequestValueDialogState createState() => _RequestValueDialogState();
}

class _RequestValueDialogState extends State<RequestValueDialog> {

  @override
  Widget build(BuildContext context) {
    String? feedback;
    return widget.dialogHelper.build(context,
        dialogButtonPosition: widget.dialogButtonPosition,
        title: widget.title,
        contents: widget.dialogHelper.getListTile(
            leading: Icon(Icons.message),
            title: DialogField(
              valueChanged: (value) => feedback = value,
              initialValue: widget.initialValue,
              decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.hintText,
              ),
            )),
        buttons: widget.dialogHelper.getAckNackButtons(
          context,
          ackFunction: () => widget.onPressed(feedback),
          nackFunction: () => widget.onPressed(null),
          ackButtonLabel: widget.ackButtonLabel,
          nackButtonLabel: widget.nackButtonLabel,
        ));
  }
}
