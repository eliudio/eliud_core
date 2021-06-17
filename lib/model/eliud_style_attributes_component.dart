/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/eliud_style_attributes_component_bloc.dart';
import 'package:eliud_core/model/eliud_style_attributes_component_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_repository.dart';
import 'package:eliud_core/model/eliud_style_attributes_component_state.dart';

abstract class AbstractEliudStyleAttributesComponent extends StatelessWidget {
  static String componentName = "eliudStyleAttributess";
  final String? eliudStyleAttributesID;

  AbstractEliudStyleAttributesComponent({this.eliudStyleAttributesID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EliudStyleAttributesComponentBloc> (
          create: (context) => EliudStyleAttributesComponentBloc(
            eliudStyleAttributesRepository: getEliudStyleAttributesRepository(context))
        ..add(FetchEliudStyleAttributesComponent(id: eliudStyleAttributesID)),
      child: _eliudStyleAttributesBlockBuilder(context),
    );
  }

  Widget _eliudStyleAttributesBlockBuilder(BuildContext context) {
    return BlocBuilder<EliudStyleAttributesComponentBloc, EliudStyleAttributesComponentState>(builder: (context, state) {
      if (state is EliudStyleAttributesComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No EliudStyleAttributes defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is EliudStyleAttributesComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is EliudStyleAttributesComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, EliudStyleAttributesModel? value);
  Widget alertWidget({ title: String, content: String});
  EliudStyleAttributesRepository getEliudStyleAttributesRepository(BuildContext context);
}

