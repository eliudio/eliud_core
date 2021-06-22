import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class ErrorDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final String message;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  ErrorDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    this.buttonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key);

  @override
  _ErrorDialogState createState() => _ErrorDialogState();

  static ErrorDialog errorDialog(      FrontEndStyle frontEndStyle,
      {
    required String title,
    required String message,
    String? buttonLabel,
    required VoidCallback onPressed,
    required DialogButtonPosition dialogButtonPosition,
  }) {
    return ErrorDialog(
      frontEndStyle,
      message: message,
      title: title,
      buttonLabel: buttonLabel,
      onPressed: onPressed,
      dialogButtonPosition: dialogButtonPosition,
    );
  }
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(context,
        title: widget.title,
        contents: widget.dialogHelper.frontEndStyle.textStyle().text(context, widget.message),
        dialogButtonPosition: widget.dialogButtonPosition,
        buttons: widget.dialogHelper.getCloseButton(context,
            buttonLabel: widget.buttonLabel,
            onPressed: () => Navigator.pop(context)));
  }
}
