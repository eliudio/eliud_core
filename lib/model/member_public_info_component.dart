/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/member_public_info_component_bloc.dart';
import 'package:eliud_core/model/member_public_info_component_event.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core/model/member_public_info_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractMemberPublicInfoComponent extends StatelessWidget {
  static String componentName = "memberPublicInfos";
  final AppModel app;
  final String memberPublicInfoId;

  AbstractMemberPublicInfoComponent({Key? key, required this.app, required this.memberPublicInfoId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberPublicInfoComponentBloc> (
          create: (context) => MemberPublicInfoComponentBloc(
            memberPublicInfoRepository: memberPublicInfoRepository(appId: app.documentID)!)
        ..add(FetchMemberPublicInfoComponent(id: memberPublicInfoId)),
      child: _memberPublicInfoBlockBuilder(context),
    );
  }

  Widget _memberPublicInfoBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberPublicInfoComponentBloc, MemberPublicInfoComponentState>(builder: (context, state) {
      if (state is MemberPublicInfoComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is MemberPublicInfoComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is MemberPublicInfoComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, MemberPublicInfoModel value);
}

