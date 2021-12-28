/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/app_bar_component_bloc.dart';
import 'package:eliud_core/model/app_bar_component_event.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_bar_repository.dart';
import 'package:eliud_core/model/app_bar_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractAppBarComponent extends StatelessWidget {
  static String componentName = "appBars";
  final AppModel app;
  final String appBarId;

  AbstractAppBarComponent({Key? key, required this.app, required this.appBarId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarComponentBloc> (
          create: (context) => AppBarComponentBloc(
            appBarRepository: appBarRepository(appId: app.documentID!)!)
        ..add(FetchAppBarComponent(id: appBarId)),
      child: _appBarBlockBuilder(context),
    );
  }

  Widget _appBarBlockBuilder(BuildContext context) {
    return BlocBuilder<AppBarComponentBloc, AppBarComponentState>(builder: (context, state) {
      if (state is AppBarComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No AppBar defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AppBarComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppBarComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AppBarModel value);
}

