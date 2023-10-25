/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/model/blocking_component_bloc.dart';
import 'package:eliud_core/model/blocking_component_event.dart';
import 'package:eliud_core/model/blocking_model.dart';
import 'package:eliud_core/model/blocking_repository.dart';
import 'package:eliud_core/model/blocking_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractBlockingComponent extends StatelessWidget {
  static String componentName = "blockings";
  final AppModel app;
  final String blockingId;

  AbstractBlockingComponent({Key? key, required this.app, required this.blockingId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlockingComponentBloc> (
          create: (context) => BlockingComponentBloc(
            blockingRepository: blockingRepository(appId: app.documentID)!)
        ..add(FetchBlockingComponent(id: blockingId)),
      child: _blockingBlockBuilder(context),
    );
  }

  Widget _blockingBlockBuilder(BuildContext context) {
    return BlocBuilder<BlockingComponentBloc, BlockingComponentState>(builder: (context, state) {
      if (state is BlockingComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No Blocking defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is BlockingComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is BlockingComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, BlockingModel value);
}

