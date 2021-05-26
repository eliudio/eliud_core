import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class ErrorDialog extends StatefulWidget {
  final String? title;
  final String? message;

  ErrorDialog({
    Key? key,
    this.title,
    this.message,
  }) : super(key: key);

  @override
  _ErrorDialogState createState() => _ErrorDialogState();

  static ErrorDialog errorDialog({
    String? title,
    String? message,
  }) {
    return ErrorDialog(
      message: message,
      title: title ?? 'Error',
    );
  }
}

class _ErrorDialogState extends State<ErrorDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title!,
        contents: Text(widget.message!),
        buttons:
            dialogHelper.getCloseButton(context, () => Navigator.pop(context)));
  }
}
