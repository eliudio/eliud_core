import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final AppModel app;
  final String? title;
  final String? content;

  AlertWidget({required this.app, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: <Widget>[
        button(app, context, label: 'Close',onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
