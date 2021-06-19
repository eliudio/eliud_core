import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class ErrorDialog extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  ErrorDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    this.buttonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key);

  @override
  _ErrorDialogState createState() => _ErrorDialogState();

  static ErrorDialog errorDialog({
    required String title,
    required String message,
    String? buttonLabel,
    required VoidCallback onPressed,
    required DialogButtonPosition dialogButtonPosition,
  }) {
    return ErrorDialog(
      message: message,
      title: title,
      buttonLabel: buttonLabel,
      onPressed: onPressed,
      dialogButtonPosition: dialogButtonPosition,
    );
  }
}

class _ErrorDialogState extends State<ErrorDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: Text(widget.message),
        dialogButtonPosition: widget.dialogButtonPosition,
        buttons: dialogHelper.getCloseButton(context,
            buttonLabel: widget.buttonLabel,
            onPressed: () => Navigator.pop(context)));
  }
}
