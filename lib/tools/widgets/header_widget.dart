import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef VoidCallbackFutureSuccess = Future<bool> Function();

class HeaderWidget extends StatefulWidget {
  final String title;
  final VoidCallbackFutureSuccess? cancelAction;
  final VoidCallbackFutureSuccess? okAction;

  HeaderWidget({
    Key? key,
    required this.title,
    this.cancelAction,
    this.okAction,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeaderWidgetState();
  }
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      Row(children: [
        text(context, widget.title),
        Spacer(),
        if (widget.cancelAction != null) iconButton(context, onPressed: () {
          widget.cancelAction!();
          Navigator.of(context).pop();
        }, icon: Icon(Icons.cancel), tooltip: 'Cancel'),
        if (widget.okAction != null) iconButton(context, onPressed: () async {
          // apply and save
          if (await widget.okAction!())
            Navigator.of(context).pop();
        }, icon: Icon(Icons.check), tooltip: 'Ok'),
      ]),
      divider(context)
    ]);
  }
}
