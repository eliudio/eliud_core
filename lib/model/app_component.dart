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

import 'app_component_bloc.dart';
import 'app_component_event.dart';
import 'app_model.dart';
import 'app_repository.dart';
import 'app_component_state.dart';

abstract class AbstractAppComponent extends StatelessWidget {
  static String componentName = "apps";
  final String appID;

  AbstractAppComponent({this.appID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc> (
          create: (context) => AppBloc(
            appRepository: getAppRepository())
        ..add(FetchApp(id: appID)),
      child: _appBlockBuilder(context),
    );
  }

  Widget _appBlockBuilder(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No app defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AppError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AppModel value);
  Widget alertWidget({ title: String, content: String});
  AppRepository getAppRepository();
}


