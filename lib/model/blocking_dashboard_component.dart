/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/blocking_dashboard_component_bloc.dart';
import 'package:eliud_core/model/blocking_dashboard_component_event.dart';
import 'package:eliud_core/model/blocking_dashboard_model.dart';
import 'package:eliud_core/model/blocking_dashboard_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractBlockingDashboardComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractBlockingDashboardComponent extends StatelessWidget {
  static String componentName = "blockingDashboards";
  final AppModel app;
  final String blockingDashboardId;

  /*
   * Construct AbstractBlockingDashboardComponent
   */
  AbstractBlockingDashboardComponent(
      {super.key, required this.app, required this.blockingDashboardId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlockingDashboardComponentBloc>(
      create: (context) => BlockingDashboardComponentBloc(
          blockingDashboardRepository:
              blockingDashboardRepository(appId: app.documentID)!)
        ..add(FetchBlockingDashboardComponent(id: blockingDashboardId)),
      child: _blockingDashboardBlockBuilder(context),
    );
  }

  Widget _blockingDashboardBlockBuilder(BuildContext context) {
    return BlocBuilder<BlockingDashboardComponentBloc,
        BlockingDashboardComponentState>(builder: (context, state) {
      if (state is BlockingDashboardComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is BlockingDashboardComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is BlockingDashboardComponentError) {
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
  Widget yourWidget(BuildContext context, BlockingDashboardModel value);
}
