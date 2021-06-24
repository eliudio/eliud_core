import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class MessageDialog extends StatefulWidget {
  late DialogStateHelper dialogHelper;

  final String title;
  final String message;
  final VoidCallback onPressed;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  MessageDialog(FrontEndStyle frontEndStyle, {
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    this.buttonLabel,
    required this.dialogButtonPosition,
  }) : super(key: key) {
    dialogHelper = DialogStateHelper();
  }

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageDialog> {

  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(context,
        title: widget.title,
        dialogButtonPosition: widget.dialogButtonPosition,
        contents: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, widget.message),
        buttons: widget.dialogHelper.getCloseButton(context,
            onPressed: widget.onPressed, buttonLabel: widget.buttonLabel));
  }
}
