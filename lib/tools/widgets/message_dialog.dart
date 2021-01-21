import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class MessageDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function yesFunction;

  MessageDialog({
    Key key,
    this.title,
    this.message,
    this.yesFunction,
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
        contents: Text(widget.message),
        buttons: dialogHelper.getCloseButton(context, widget.yesFunction));
  }
}
