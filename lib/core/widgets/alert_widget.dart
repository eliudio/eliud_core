import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String title;
  final String content;

  AlertWidget({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
    );
  }
}
