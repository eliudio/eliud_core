import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:eliud_core/core/tools/page_helper.dart';
import 'package:eliud_core/decoration/decorations.dart';
import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/dialog_component_bloc.dart';
import 'package:eliud_core_main/model/dialog_component_event.dart';
import 'package:eliud_core_main/model/dialog_component_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core_main/apis/style/frontend/has_page_body.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogComponent extends StatefulWidget {
  final AppModel app;
  final String dialogId;
  final Map<String, dynamic>? parameters;
  final bool? includeHeading;

  DialogComponent(
      {super.key,
      required this.app,
      required this.dialogId,
      this.parameters,
      this.includeHeading = true});

  @override
  State<DialogComponent> createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  final GlobalKey _dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogComponentBloc>(
        create: (context) => DialogComponentBloc(
            dialogRepository: dialogRepository(appId: widget.app.documentID))
          ..add(FetchDialogComponent(id: widget.dialogId)),
        child: BlocBuilder<DialogComponentBloc, DialogComponentState>(
            builder: (context, state) {
          if (state is DialogComponentLoaded) {
            var dialog = state.value;
            return Decorations.instance().createDecoratedDialog(
                widget.app,
                context,
                _dialogKey,
                () => flexibleDialog(widget.app, context,
                        key: _dialogKey, title: dialog.title!, child:
                            BlocBuilder<AccessBloc, AccessState>(
                                builder: (context, accessState) {
                      if (accessState is AccessDetermined) {
                        var componentInfo = ComponentInfo.getComponentInfo(
                            context,
                            widget.app,
                            dialog.bodyComponents!,
                            widget.parameters,
                            fromDialogLayout(dialog.layout),
                            null,
                            dialog.gridView);

                        return simpleTopicContainer(widget.app, context,
                            children: <Widget>[
                              pageBody(widget.app, context,
                                  backgroundOverride:
                                      componentInfo.backgroundOverride,
                                  components: componentInfo.widgets,
                                  layout: componentInfo.layout,
                                  gridView: componentInfo.gridView)
                            ]);
                      } else {
                        return progressIndicator(widget.app, context);
                      }
                    }),
                        includeHeading: widget.includeHeading ??
                            dialog.includeHeading ??
                            true,
                        buttons: [
                          dialogButton(widget.app, context,
                              label: 'Close', onPressed: () => pressed(true)),
                        ]),
                dialog)();
          } else {
            return progressIndicator(widget.app, context);
          }
        }));
  }

  void pressed(bool success) {
    Navigator.pop(context);
  }
}
