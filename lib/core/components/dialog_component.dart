import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_body.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class DialogComponent extends StatefulWidget {
  final DialogModel? dialog;
  final Map<String, dynamic>? parameters;
  final bool? includeHeading;

  DialogComponent(
      {Key? key, this.dialog, this.parameters, this.includeHeading = true})
      : super(key: key);

  @override
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  final GlobalKey _dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Decorations.instance().createDecoratedDialog(
        context,
        _dialogKey,
        () => flexibleDialog(context,
                key: _dialogKey,
                title: widget.dialog!.title!,
                child: getContents(context),
                includeHeading: widget.includeHeading ?? true,
                buttons: [
                  dialogButton(context,
                      label: 'Close', onPressed: () => pressed(true)),
                ]),
        widget.dialog!)();
  }

  Widget getContents(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
        if (accessState is AccessDetermined) {
          var componentInfo = ComponentInfo.getComponentInfo(
              context,
              widget.dialog!.bodyComponents!,
              widget.parameters,
              accessState,
              fromDialogLayout(widget.dialog!.layout),
              null,
              widget.dialog!.gridView);
          var theBody;

          theBody = PageBody(
            componentInfo: componentInfo,
          );
          return simpleTopicContainer(context, children: <Widget>[theBody]);
        } else {
          return progressIndicator(context);
        }
    });
  }

  void pressed(bool success) {
    Navigator.pop(context);
  }
}
