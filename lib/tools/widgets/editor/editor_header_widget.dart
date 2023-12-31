import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:flutter/material.dart';

typedef VoidCallbackFutureSuccess = Future<bool> Function();

class EditorHeaderWidget extends StatefulWidget {
  final AppModel app;
  final VoidCallback cancelAction;
  final VoidCallbackFutureSuccess okAction;

  EditorHeaderWidget({
    super.key,
    required this.app,
    required this.cancelAction,
    required this.okAction,
  });

  @override
  State<StatefulWidget> createState() {
    return _EditorHeaderWidgetState();
  }
}

class _EditorHeaderWidgetState extends State<EditorHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        iconButton(widget.app, context, onPressed: () {
          widget.cancelAction();
          Navigator.of(context).pop();
        }, icon: Icon(Icons.cancel), tooltip: 'Cancel'),
        iconButton(widget.app, context, onPressed: () async {
          // apply and save
          var success = await widget.okAction();
          if (success) Navigator.of(context).pop();
        }, icon: Icon(Icons.check), tooltip: 'Ok'),
      ]),
      divider(widget.app, context)
    ]);
  }
}
