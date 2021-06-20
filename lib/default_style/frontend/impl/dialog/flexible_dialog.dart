import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class FlexibleDialog extends StatefulWidget {
  final String title;
  final Widget widget;
  final DialogButtonPosition dialogButtonPosition;
  final List<Widget> buttons;

  FlexibleDialog({
    Key? key,
    required this.title,
    required this.widget,
    required this.dialogButtonPosition,
    required this.buttons,
  }) : super(key: key);

  @override
  _FlexibleDialogState createState() => _FlexibleDialogState();
}

class _FlexibleDialogState extends State<FlexibleDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: widget.buttons);
  }
}
