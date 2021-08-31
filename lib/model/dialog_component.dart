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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/dialog_component_bloc.dart';
import 'package:eliud_core/model/dialog_component_event.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/dialog_repository.dart';
import 'package:eliud_core/model/dialog_component_state.dart';

abstract class AbstractDialogComponent extends StatelessWidget {
  static String componentName = "dialogs";
  final String? dialogID;

  AbstractDialogComponent({Key? key, this.dialogID}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DialogComponentBloc> (
          create: (context) => DialogComponentBloc(
            dialogRepository: getDialogRepository(context))
        ..add(FetchDialogComponent(id: dialogID)),
      child: _dialogBlockBuilder(context),
    );
  }

  Widget _dialogBlockBuilder(BuildContext context) {
    return BlocBuilder<DialogComponentBloc, DialogComponentState>(builder: (context, state) {
      if (state is DialogComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No Dialog defined');
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
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DialogModel? value);
  Widget alertWidget({ title: String, content: String});
  DialogRepository getDialogRepository(BuildContext context);
}

