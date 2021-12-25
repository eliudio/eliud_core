import 'dart:ui';

import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_helper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/dialog_component_bloc.dart';
import 'package:eliud_core/model/dialog_component_event.dart';
import 'package:eliud_core/model/dialog_component_state.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/has_page_body.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registry.dart';

class DialogComponent extends StatefulWidget {
  final String appId;
  final String dialogId;
  final Map<String, dynamic>? parameters;

  DialogComponent(
      {Key? key, required this.appId, required this.dialogId, this.parameters})
      : super(key: key);

  @override
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  final GlobalKey _dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogComponentBloc> (
        create: (context) => DialogComponentBloc(
        dialogRepository: dialogRepository(appId: widget.appId))
      ..add(FetchDialogComponent(id: widget.dialogId)),
    child: BlocBuilder<DialogComponentBloc, DialogComponentState>(builder: (context, state) {
    if (state is DialogComponentLoaded) {
      var dialog = state.value;
      return Decorations.instance().createDecoratedDialog(
          context,
          _dialogKey,
              () =>
              flexibleDialog(context,
                  key: _dialogKey,
                  title: dialog.title!,
                  child: BlocBuilder<AccessBloc, AccessState>(
                      builder: (context, accessState) {
                        if (accessState is AccessDetermined) {
                            var componentInfo = ComponentInfo.getComponentInfo(
                                context,
                                dialog.bodyComponents!,
                                widget.parameters,
                                fromDialogLayout(dialog.layout),
                                null,
                                dialog.gridView);

                            return simpleTopicContainer(
                                context, children: <Widget>[pageBody(context,
                                backgroundOverride: componentInfo
                                    .backgroundOverride,
                                components: componentInfo.widgets,
                                layout: componentInfo.layout,
                                gridView: componentInfo.gridView)
                            ]);
                        } else {
                          return progressIndicator(context);
                        }
                      }),
                  includeHeading: dialog.includeHeading ?? true,
                  buttons: [
                    dialogButton(context,
                        label: 'Close', onPressed: () => pressed(true)),
                  ]),
          dialog)();
    } else {
      return progressIndicator(context);
    }
    }));
  }

  void pressed(bool success) {
    Navigator.pop(context);
  }
}
