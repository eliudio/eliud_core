import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class AckNackDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final VoidCallback ackFunction;
  final VoidCallback nackFunction;
  final String? ackButtonLabel;
  final String? nackButtonLabel;
  final DialogButtonPosition dialogButtonPosition;

  AckNackDialog({
    Key? key,
    this.title,
    this.message,
    required this.ackFunction,
    required this.nackFunction,
    this.ackButtonLabel,
    this.nackButtonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key);

  @override
  _AckNackState createState() => _AckNackState();

  static AckNackDialog confirmDialog(
      {String? title,
      String? message,
      required VoidCallback ackFunction,
      required VoidCallback nackFunction,
      required DialogButtonPosition dialogButtonPosition,
      String? ackButtonLabel,
      String? nackButtonLabel}) {
    return AckNackDialog(
      message: message,
      dialogButtonPosition: dialogButtonPosition,
      ackFunction: ackFunction,
      nackFunction: nackFunction,
      title: title ?? 'Confirm',
      ackButtonLabel: ackButtonLabel ?? 'Confirm',
      nackButtonLabel: nackButtonLabel ?? 'Cancel',
    );
  }
}

class _AckNackState extends State<AckNackDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        dialogButtonPosition: widget.dialogButtonPosition,
        title: widget.title!,
        contents: Text(widget.message!),
        buttons: dialogHelper.getAckNackButtons(context,
            ackFunction: widget.ackFunction,
            nackFunction: widget.nackFunction,
            ackButtonLabel: widget.ackButtonLabel,
            nackButtonLabel: widget.nackButtonLabel));
  }
}
