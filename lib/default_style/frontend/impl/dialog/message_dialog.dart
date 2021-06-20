import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class MessageDialog extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  MessageDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    this.buttonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: Text(widget.message),
        buttons: dialogHelper.getCloseButton(context,
            onPressed: widget.onPressed, buttonLabel: widget.buttonLabel));
  }
}
