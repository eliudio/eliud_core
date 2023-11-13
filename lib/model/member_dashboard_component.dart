/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/member_dashboard_component_bloc.dart';
import 'package:eliud_core/model/member_dashboard_component_event.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractMemberDashboardComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractMemberDashboardComponent extends StatelessWidget {
  static String componentName = "memberDashboards";
  final AppModel app;
  final String memberDashboardId;

  /*
   * Construct AbstractMemberDashboardComponent
   */
  AbstractMemberDashboardComponent(
      {super.key, required this.app, required this.memberDashboardId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberDashboardComponentBloc>(
      create: (context) => MemberDashboardComponentBloc(
          memberDashboardRepository:
              memberDashboardRepository(appId: app.documentID)!)
        ..add(FetchMemberDashboardComponent(id: memberDashboardId)),
      child: _memberDashboardBlockBuilder(context),
    );
  }

  Widget _memberDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberDashboardComponentBloc,
        MemberDashboardComponentState>(builder: (context, state) {
      if (state is MemberDashboardComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is MemberDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is MemberDashboardComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, MemberDashboardModel value);
}
