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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/model/member_component_bloc.dart';
import 'package:eliud_core/model/member_component_event.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/member_repository.dart';
import 'package:eliud_core/model/member_component_state.dart';

abstract class AbstractMemberComponent extends StatelessWidget {
  static String componentName = "members";
  final String memberID;

  AbstractMemberComponent({this.memberID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberBloc> (
          create: (context) => MemberBloc(
            memberRepository: getMemberRepository())
        ..add(FetchMember(id: memberID)),
      child: _memberBlockBuilder(context),
    );
  }

  Widget _memberBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberBloc, MemberState>(builder: (context, state) {
      if (state is MemberLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No member defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is MemberError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, MemberModel value);
  Widget alertWidget({ title: String, content: String});
  MemberRepository getMemberRepository();
}


