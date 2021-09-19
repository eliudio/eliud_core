import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String? title;
  final String? content;

  AlertWidget({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: <Widget>[
        button(context, label: 'Close',onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
