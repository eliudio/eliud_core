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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bar_component_bloc.dart';
import 'app_bar_component_event.dart';
import 'app_bar_model.dart';
import 'app_bar_repository.dart';
import 'app_bar_component_state.dart';

abstract class AbstractAppBarComponent extends StatelessWidget {
  static String componentName = "appBars";
  final String appBarID;

  AbstractAppBarComponent({this.appBarID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarBloc> (
          create: (context) => AppBarBloc(
            appBarRepository: getAppBarRepository())
        ..add(FetchAppBar(id: appBarID)),
      child: _appBarBlockBuilder(context),
    );
  }

  Widget _appBarBlockBuilder(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarState>(builder: (context, state) {
      if (state is AppBarLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No appBar defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is AppBarError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, AppBarModel value);
  Widget alertWidget({ title: String, content: String});
  AppBarRepository getAppBarRepository();
}


