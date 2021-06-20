import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_body.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../registry.dart';

class DialogComponent extends StatefulWidget {
  final DialogModel? dialog;
  final Map<String, dynamic>? parameters;

  DialogComponent({
    Key? key,
    this.dialog,
    this.parameters,
  }) : super(key: key);

  @override
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  @override
  Widget build(BuildContext context) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().flexibleDialog(context, title: widget.dialog!.title!, child: getContents(context), buttons: getButtons(context));
  }

  List<TextButton> getButtons(BuildContext context) {
    return <TextButton>[
      TextButton(onPressed: () => pressed(true), child: Text('Close')),
    ];
  }

  Widget getContents(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      var componentInfo = ComponentInfo.getComponentInfo(
          widget.dialog!.bodyComponents!, widget.parameters, accessState,
          fromDialogLayout(widget.dialog!.layout), null,
          widget.dialog!.gridView);
      var theBody;
      if (widget.dialog!.widgetWrapper != null) {
        theBody = Registry.registry()!.wrapWidgetInBloc(widget.dialog!.widgetWrapper!, context, componentInfo);
      } else {
        theBody = PageBody(componentInfo: componentInfo,);
      }

      return StyleRegistry.registry().styleWithContext(context).frontEndStyle().simpleTopicContainer(context, children: <Widget>[
        theBody]);
    } else {
      return Text('App not loaded');
    }
  }

  void pressed(bool success) {
    Navigator.pop(context);
  }
}
