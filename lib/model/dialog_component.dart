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
import 'package:eliud_core/model/dialog_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractDialogComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractDialogComponent extends StatelessWidget {
  static String componentName = "dialogs";
  final AppModel app;
  final String dialogId;

  /*
   * Construct AbstractDialogComponent
   */
  AbstractDialogComponent(
      {super.key, required this.app, required this.dialogId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogComponentBloc>(
      create: (context) => DialogComponentBloc(
          dialogRepository: dialogRepository(appId: app.documentID)!)
        ..add(FetchDialogComponent(id: dialogId)),
      child: _dialogBlockBuilder(context),
    );
  }

  Widget _dialogBlockBuilder(BuildContext context) {
    return BlocBuilder<DialogComponentBloc, DialogComponentState>(
        builder: (context, state) {
      if (state is DialogComponentLoaded) {
        return yourWidget(context, state.value);
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
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, DialogModel value);
}
