import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class AckNackDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String? title;
  final String? message;
  final VoidCallback ackFunction;
  final VoidCallback nackFunction;
  final String? ackButtonLabel;
  final String? nackButtonLabel;
  final DialogButtonPosition dialogButtonPosition;

  AckNackDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    this.title,
    this.message,
    required this.ackFunction,
    required this.nackFunction,
    this.ackButtonLabel,
    this.nackButtonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper(frontEndStyle);
  }

  @override
  _AckNackState createState() => _AckNackState();

  static AckNackDialog confirmDialog(
      FrontEndStyle frontEndStyle,
      {String? title,
      String? message,
      required VoidCallback ackFunction,
      required VoidCallback nackFunction,
      required DialogButtonPosition dialogButtonPosition,
      String? ackButtonLabel,
      String? nackButtonLabel}) {
    return AckNackDialog(
      frontEndStyle,
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
  _AckNackState();

  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(context,
        dialogButtonPosition: widget.dialogButtonPosition,
        title: widget.title!,
        contents: widget.dialogHelper.frontEndStyle.textStyle().text(context, widget.message!),
        buttons: widget.dialogHelper.getAckNackButtons(context,
            ackFunction: widget.ackFunction,
            nackFunction: widget.nackFunction,
            ackButtonLabel: widget.ackButtonLabel,
            nackButtonLabel: widget.nackButtonLabel));
  }
}
