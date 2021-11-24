/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/member_component_bloc.dart';
import 'package:eliud_core/model/member_component_event.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_repository.dart';
import 'package:eliud_core/model/member_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractMemberComponent extends StatelessWidget {
  static String componentName = "members";
  final String theAppId;
  final String memberId;

  AbstractMemberComponent({Key? key, required this.theAppId, required this.memberId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberComponentBloc> (
          create: (context) => MemberComponentBloc(
            memberRepository: memberRepository(appId: theAppId)!)
        ..add(FetchMemberComponent(id: memberId)),
      child: _memberBlockBuilder(context),
    );
  }

  Widget _memberBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberComponentBloc, MemberComponentState>(builder: (context, state) {
      if (state is MemberComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Member defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is MemberComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is MemberComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, MemberModel value);
}

