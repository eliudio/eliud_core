import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocking_dashboard_bloc.dart';

class BlockingDashboardComponentEditorConstructor
    extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        BlockingDashboardModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'Blocked members',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var blockingDashboard =
    await blockingDashboardRepository(appId: app.documentID)!.get(id);
    if (blockingDashboard != null) {
      _openIt(app, context, false, blockingDashboard, feedback);
    } else {
      openErrorDialog(app, context, app.documentID + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find blocking dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      BlockingDashboardModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/blockingdashboard',
      title: create ? 'Create Blocking Dashboard' : 'Update Blocking Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<BlockingDashboardBloc>(
          create: (context) => BlockingDashboardBloc(
            app.documentID,
            /*create,
            */
            feedback,
          )..add(EditorBaseInitialise<BlockingDashboardModel>(model)),
          child: BlockingDashboardComponentEditor(
            app: app,
          )),
    );
  }
}

class BlockingDashboardComponentEditor extends StatefulWidget {
  final AppModel app;

  const BlockingDashboardComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlockingDashboardComponentEditorState();
}

class _BlockingDashboardComponentEditorState
    extends State<BlockingDashboardComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
          if (accessState is AccessDetermined) {
            return BlocBuilder<BlockingDashboardBloc,
                EditorBaseState<BlockingDashboardModel>>(
                builder: (ppContext, blockingDashboardState) {
                  if (blockingDashboardState
                  is EditorBaseInitialised<BlockingDashboardModel>) {
                    return ListView(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: [
                          HeaderWidget(
                            app: widget.app,
                            title: 'BlockingDashboard',
                            okAction: () async {
                              await BlocProvider.of<BlockingDashboardBloc>(context).save(
                                  EditorBaseApplyChanges(
                                      model: blockingDashboardState.model));
                              return true;
                            },
                            cancelAction: () async {
                              return true;
                            },
                          ),
                          topicContainer(widget.app, context,
                              title: 'General',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.vpn_key),
                                    title: text(widget.app, context,
                                        blockingDashboardState.model.documentID)),
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.description),
                                    title: dialogField(
                                      widget.app,
                                      context,
                                      initialValue:
                                      blockingDashboardState.model.description,
                                      valueChanged: (value) {
                                        blockingDashboardState.model.description = value;
                                      },
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        hintText: 'Description',
                                        labelText: 'Description',
                                      ),
                                    )),
                              ]),
                          topicContainer(widget.app, context,
                              title: 'Condition',
                              collapsible: true,
                              collapsed: true,
                              children: [
                                getListTile(context, widget.app,
                                    leading: Icon(Icons.security),
                                    title: ConditionsSimpleWidget(
                                      app: widget.app,
                                      value: blockingDashboardState.model.conditions!,
                                    )),
                              ]),
                        ]);
                  } else {
                    return progressIndicator(widget.app, context);
                  }
                });
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }
}
