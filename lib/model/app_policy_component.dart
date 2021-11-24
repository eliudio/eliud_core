/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/app_policy_component_bloc.dart';
import 'package:eliud_core/model/app_policy_component_event.dart';
import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/app_policy_repository.dart';
import 'package:eliud_core/model/app_policy_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractAppPolicyComponent extends StatelessWidget {
  static String componentName = "appPolicys";
  final String theAppId;
  final String appPolicyId;

  AbstractAppPolicyComponent({Key? key, required this.theAppId, required this.appPolicyId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppPolicyComponentBloc> (
          create: (context) => AppPolicyComponentBloc(
            appPolicyRepository: appPolicyRepository(appId: theAppId)!)
        ..add(FetchAppPolicyComponent(id: appPolicyId)),
      child: _appPolicyBlockBuilder(context),
    );
  }

  Widget _appPolicyBlockBuilder(BuildContext context) {
    return BlocBuilder<AppPolicyComponentBloc, AppPolicyComponentState>(builder: (context, state) {
      if (state is AppPolicyComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No AppPolicy defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AppPolicyComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppPolicyComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AppPolicyModel value);
}

