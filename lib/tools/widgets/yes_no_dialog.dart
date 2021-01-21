import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

class YesNoDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function yesFunction;
  final Function noFunction;
  final String yesButtonLabel;
  final String noButtonLabel;

  YesNoDialog({
    Key key,
    this.title,
    this.message,
    this.yesFunction,
    this.noFunction,
    this.yesButtonLabel,
    this.noButtonLabel,
  }) : super(key: key);

  @override
  _YesNoState createState() => _YesNoState();
}

class _YesNoState extends State<YesNoDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: Text(widget.message),
        buttons: dialogHelper.getYesNoButtons(
            context, widget.yesFunction, widget.noFunction,
            yesButtonLabel: widget.yesButtonLabel,
            noButtonLabel: widget.noButtonLabel));
  }
}
