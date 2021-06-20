import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class WidgetDialog extends StatefulWidget {
  final String title;
  final Widget widget;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  WidgetDialog({
    Key? key,
    required this.title,
    required this.widget,
    this.buttonLabel,
    required this.onPressed,
    required this.dialogButtonPosition,
  }) : super(key: key);

  @override
  _WidgetDialogState createState() => _WidgetDialogState();
}

class _WidgetDialogState extends State<WidgetDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: dialogHelper.getCloseButton(context,
            onPressed: widget.onPressed, buttonLabel: widget.buttonLabel));
  }
}
