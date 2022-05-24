/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/dialog_component_bloc.dart';
import 'package:eliud_core/model/dialog_component_event.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/dialog_repository.dart';
import 'package:eliud_core/model/dialog_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractDialogComponent extends StatelessWidget {
  static String componentName = "dialogs";
  final AppModel app;
  final String dialogId;

  AbstractDialogComponent({Key? key, required this.app, required this.dialogId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogComponentBloc> (
          create: (context) => DialogComponentBloc(
            dialogRepository: dialogRepository(appId: app.documentID)!)
        ..add(FetchDialogComponent(id: dialogId)),
      child: _dialogBlockBuilder(context),
    );
  }

  Widget _dialogBlockBuilder(BuildContext context) {
    return BlocBuilder<DialogComponentBloc, DialogComponentState>(builder: (context, state) {
      if (state is DialogComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No Dialog defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DialogComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DialogComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DialogModel value);
}

