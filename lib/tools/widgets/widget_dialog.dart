import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class WidgetDialog extends StatefulWidget {
  final String title;
  final Widget widget;
  final Function yesFunction;

  WidgetDialog({
    Key key,
    this.title,
    this.widget,
    this.yesFunction,
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
        contents: widget.widget,
        buttons: dialogHelper.getCloseButton(context, widget.yesFunction));
  }
}
