import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/registry.dart';
import '../../model/abstract_repository_singleton.dart';
import '../../model/platform_medium_model.dart';
import '../../model/storage_conditions_model.dart';
import '../../package/access_rights.dart';
import 'app_policy_bloc/app_policy_dashboard_bloc.dart';
import 'app_policy_bloc/app_policy_dashboard_event.dart';
import 'app_policy_bloc/app_policy_dashboard_state.dart';

class AppPolicyDashboard {
  static void updateAppPolicy(AppModel app, BuildContext context, model) {
    _openIt(app, context, false, model.copyWith());
  }

  static void deleteAppPolicy(AppModel app, BuildContext context, model) {
    appPolicyRepository(appId: app.documentID)!.delete(model);
  }

  static void addAppPolicy(AppModel app, BuildContext context) {
    _openIt(
      app,
      context,
      true,
      AppPolicyModel(
        appId: app.documentID,
        documentID: newRandomKey(),
      ),
    );
  }

  static void _openIt(
      AppModel app, BuildContext context, bool create, AppPolicyModel model) {
    openComplexDialog(
      app,
      context,
      app.documentID + '/app_policy',
      title: create ? 'Create Policy' : 'Update Policy',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<AppPolicyDashboardBloc>(
          create: (context) => AppPolicyDashboardBloc(
                app.documentID,
                (_, __) {},
              )..add(AppPolicyDashboardInitialise(model)),
          child: AppPolicyDashboardWidget(
            app: app,
          )),
    );
  }
}

class AppPolicyDashboardWidget extends StatefulWidget {
  final AppModel app;

  const AppPolicyDashboardWidget({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPolicyDashboardWidgetState();
}

class _AppPolicyDashboardWidgetState extends State<AppPolicyDashboardWidget> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<AppPolicyDashboardBloc, AppPolicyDashboardBaseState>(
            builder: (ppContext, appPolicyState) {
          if (appPolicyState is AppPolicyDashboardInitialised) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Policy',
                    okAction: () async {
                      await BlocProvider.of<AppPolicyDashboardBloc>(context)
                          .save(AppPolicyDashboardApplyChanges(
                              model: appPolicyState.appPolicy));
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
                                appPolicyState.appPolicy.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: appPolicyState.appPolicy.name,
                              valueChanged: (value) {
                                appPolicyState.appPolicy.name = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Pages',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _pages(appPolicyState),
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
                              readOnly: appPolicyState.values != null &&
                                  appPolicyState.values!.isNotEmpty,
                              value: appPolicyState.appPolicy.conditions ?? StorageConditionsModel(
                                  privilegeLevelRequired:
                                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
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

  Widget _pages(AppPolicyDashboardInitialised state) {
    var widgets = <Widget>[];
    if (state.values != null) {
      var items = state.values!;
      for (var medium in items) {
        widgets.add(GestureDetector(
            onTap: () {
              openAckNackDialog(widget.app, context,
                  widget.app.documentID + '/policy_delete_image',
                  title: 'Confirm',
                  message: 'Delete page?', onSelection: (value) async {
                if (value == 0) {
                  BlocProvider.of<AppPolicyDashboardBloc>(context)
                      .add(AppPolicyDashboardDeleteItem(item: medium));
                }
              });
            },
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.network(
                  medium.url!,
                  //            height: height,
                ))));
      }
    }
    widgets.add(_addButton(state));

    return GridView.extent(
        maxCrossAxisExtent: 200,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        children: widgets);
  }

  Widget _addButton(AppPolicyDashboardInitialised state) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return popupMenuButton<int>(widget.app, context,
          child: Icon(Icons.add),
          itemBuilder: (context) => [
                if (Registry.registry()!.getMediumApi().hasCamera())
                  popupMenuItem(
                    widget.app,
                    context,
                    value: 0,
                    label: 'Take photo',
                  ),
                popupMenuItem(
                  widget.app,
                  context,
                  value: 1,
                  label: 'Upload image',
                ),
              ],
          onSelected: (value) async {
            if (value == 0) {
              Registry.registry()!.getMediumApi().takePhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      state.appPolicy.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              Registry.registry()!.getMediumApi().uploadPhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      state.appPolicy.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            }
          });
    }
  }

  void _photoFeedbackFunction(PlatformMediumModel? platformMediumModel) {
    setState(() {
      _progress = null;
      if (platformMediumModel != null) {
        BlocProvider.of<AppPolicyDashboardBloc>(context)
            .add(AppPolicyDashboardAddItem(item: platformMediumModel));
      }
    });
  }

  void _photoUploading(dynamic progress) {
    if (progress != null) {}
    setState(() {
      _progress = progress;
    });
  }
}
