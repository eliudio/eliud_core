/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/app_component_bloc.dart';
import 'package:eliud_core/model/app_component_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/app_component_state.dart';

abstract class AbstractAppComponent extends StatelessWidget {
  static String componentName = "apps";
  final String? appID;

  AbstractAppComponent({Key? key, this.appID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppComponentBloc> (
          create: (context) => AppComponentBloc(
            appRepository: getAppRepository(context))
        ..add(FetchAppComponent(id: appID)),
      child: _appBlockBuilder(context),
    );
  }

  Widget _appBlockBuilder(BuildContext context) {
    return BlocBuilder<AppComponentBloc, AppComponentState>(builder: (context, state) {
      if (state is AppComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No App defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AppComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AppModel? value);
  Widget alertWidget({ title: String, content: String});
  AppRepository getAppRepository(BuildContext context);
}

