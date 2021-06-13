import 'package:eliud_core/tools/widgets/dialog_field.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void MessageFeedback(String? message);

class QuickMessageDialog extends StatefulWidget {
  final String value;
  final MessageFeedback yesFunction;

  QuickMessageDialog({
    Key? key,
    required this.value,
    required this.yesFunction,
  }) : super(key: key);

  @override
  _QuickMessageDialogState createState() => _QuickMessageDialogState();
}

class _QuickMessageDialogState extends State<QuickMessageDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();
  String? messageValue;

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: 'Message',
        contents: contents(context),
        buttons: dialogHelper.getButtons(context, [
          'Cancel',
          'Continue'
        ], [
          () {
            Navigator.pop(context);
          },
          () {
            widget.yesFunction(messageValue);
            Navigator.pop(context);
          }
        ]));
  }

  Widget contents(BuildContext context) {
    return DialogStateHelper().getListTile(
        leading: Icon(Icons.payment),
        title: DialogField(
          valueChanged: (value) => messageValue = value,
          decoration: const InputDecoration(
            hintText: 'Message',
            labelText: 'Message',
          ),
        ));
  }
}
