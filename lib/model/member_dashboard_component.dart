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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_core/model/member_dashboard_component_bloc.dart';
import 'package:eliud_core/model/member_dashboard_component_event.dart';
import 'package:eliud_core/model/member_dashboard_model.dart';
import 'package:eliud_core/model/member_dashboard_repository.dart';
import 'package:eliud_core/model/member_dashboard_component_state.dart';

abstract class AbstractMemberDashboardComponent extends StatelessWidget {
  static String componentName = "memberDashboards";
  final String memberDashboardID;

  AbstractMemberDashboardComponent({this.memberDashboardID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberDashboardComponentBloc> (
          create: (context) => MemberDashboardComponentBloc(
            memberDashboardRepository: getMemberDashboardRepository(context))
        ..add(FetchMemberDashboardComponent(id: memberDashboardID)),
      child: _memberDashboardBlockBuilder(context),
    );
  }

  Widget _memberDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberDashboardComponentBloc, MemberDashboardComponentState>(builder: (context, state) {
      if (state is MemberDashboardComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No MemberDashboard defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is MemberDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is MemberDashboardComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, MemberDashboardModel value);
  Widget alertWidget({ title: String, content: String});
  MemberDashboardRepository getMemberDashboardRepository(BuildContext context);
}

