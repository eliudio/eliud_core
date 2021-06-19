import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class ComplexAckNackDialog extends StatefulWidget {
  final String title;
  final Widget widget;
  final DialogButtonPosition dialogButtonPosition;
  final VoidCallback ackFunction;
  final VoidCallback nackFunction;
  final String? ackButtonLabel;
  final String? nackButtonLabel;


  ComplexAckNackDialog({
    Key? key,
    required this.title,
    required this.widget,
    required this.dialogButtonPosition,
    required this.ackFunction,
    required this.nackFunction,
    this.ackButtonLabel,
    this.nackButtonLabel,
  }) : super(key: key);

  @override
  _ComplexAckNackDialogState createState() => _ComplexAckNackDialogState();
}

class _ComplexAckNackDialogState extends State<ComplexAckNackDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: dialogHelper.getAckNackButtons(context,
            ackFunction: widget.ackFunction,
            nackFunction: widget.nackFunction,
            ackButtonLabel: widget.ackButtonLabel,
            nackButtonLabel: widget.nackButtonLabel));
  }
}
