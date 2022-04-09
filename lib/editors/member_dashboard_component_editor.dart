import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
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

import 'member_dashboard_bloc/member_dashboard_bloc.dart';

class MemberDashboardComponentEditorConstructor
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
        MemberDashboardModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var memberDashboard =
        await memberDashboardRepository(appId: app.documentID!)!.get(id);
    if (memberDashboard != null) {
      _openIt(app, context, false, memberDashboard, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find member dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      MemberDashboardModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/memberdashboard',
      title: create ? 'Create Member Dashboard' : 'Update Member Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<MemberDashboardBloc>(
          create: (context) => MemberDashboardBloc(
                app.documentID!,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<MemberDashboardModel>(model)),
          child: MemberDashboardComponentEditor(
            app: app,
          )),
    );
  }
}

class MemberDashboardComponentEditor extends StatefulWidget {
  final AppModel app;

  const MemberDashboardComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MemberDashboardComponentEditorState();
}

class _MemberDashboardComponentEditorState
    extends State<MemberDashboardComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<MemberDashboardBloc,
                EditorBaseState<MemberDashboardModel>>(
            builder: (ppContext, memberDashboardState) {
          if (memberDashboardState
              is EditorBaseInitialised<MemberDashboardModel>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'MemberDashboard',
                    okAction: () async {
                      await BlocProvider.of<MemberDashboardBloc>(context).save(
                          EditorBaseApplyChanges(
                              model: memberDashboardState.model));
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
                                memberDashboardState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                                  memberDashboardState.model.description,
                              valueChanged: (value) {
                                memberDashboardState.model.description = value;
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
                              value: memberDashboardState.model.conditions!,
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
