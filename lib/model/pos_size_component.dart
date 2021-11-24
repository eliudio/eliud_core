/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/pos_size_component_bloc.dart';
import 'package:eliud_core/model/pos_size_component_event.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:eliud_core/model/pos_size_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractPosSizeComponent extends StatelessWidget {
  static String componentName = "posSizes";
  final String theAppId;
  final String posSizeId;

  AbstractPosSizeComponent({Key? key, required this.theAppId, required this.posSizeId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PosSizeComponentBloc> (
          create: (context) => PosSizeComponentBloc(
            posSizeRepository: posSizeRepository(appId: theAppId)!)
        ..add(FetchPosSizeComponent(id: posSizeId)),
      child: _posSizeBlockBuilder(context),
    );
  }

  Widget _posSizeBlockBuilder(BuildContext context) {
    return BlocBuilder<PosSizeComponentBloc, PosSizeComponentState>(builder: (context, state) {
      if (state is PosSizeComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No PosSize defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PosSizeComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PosSizeComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PosSizeModel value);
}

