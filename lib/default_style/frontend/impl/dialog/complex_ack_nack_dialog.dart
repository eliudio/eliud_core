import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class ComplexAckNackDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final Widget widget;
  final DialogButtonPosition dialogButtonPosition;
  final VoidCallback ackFunction;
  final VoidCallback nackFunction;
  final String? ackButtonLabel;
  final String? nackButtonLabel;


  ComplexAckNackDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    required this.widget,
    required this.dialogButtonPosition,
    required this.ackFunction,
    required this.nackFunction,
    this.ackButtonLabel,
    this.nackButtonLabel,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper(frontEndStyle);
  }

  @override
  _ComplexAckNackDialogState createState() => _ComplexAckNackDialogState();
}

class _ComplexAckNackDialogState extends State<ComplexAckNackDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: widget.dialogHelper.getAckNackButtons(context,
            ackFunction: widget.ackFunction,
            nackFunction: widget.nackFunction,
            ackButtonLabel: widget.ackButtonLabel,
            nackButtonLabel: widget.nackButtonLabel));
  }
}
