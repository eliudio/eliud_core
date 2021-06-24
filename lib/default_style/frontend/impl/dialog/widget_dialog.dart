import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class WidgetDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final Widget widget;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  WidgetDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    required this.widget,
    this.buttonLabel,
    required this.onPressed,
    required this.dialogButtonPosition,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper();
  }

  @override
  _WidgetDialogState createState() => _WidgetDialogState();
}

class _WidgetDialogState extends State<WidgetDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(context,
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: widget.dialogHelper.getCloseButton(context,
            onPressed: widget.onPressed, buttonLabel: widget.buttonLabel));
  }
}
