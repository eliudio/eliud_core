import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:flutter/material.dart';
import 'dialog_helper.dart';

class FlexibleDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final Widget widget;
  final DialogButtonPosition dialogButtonPosition;
  final List<Widget> buttons;

  FlexibleDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    required this.widget,
    required this.dialogButtonPosition,
    required this.buttons,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper(frontEndStyle);
  }

  @override
  _FlexibleDialogState createState() => _FlexibleDialogState();
}

class _FlexibleDialogState extends State<FlexibleDialog> {

  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(context,
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: widget.widget,
        buttons: widget.buttons);
  }
}
