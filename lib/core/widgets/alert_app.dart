import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertApp extends StatelessWidget {
  final String title;
  final String content;
  
  AlertApp({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(content),
        ),
      ),
    );
  }
}
