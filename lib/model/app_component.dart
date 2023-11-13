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

import 'package:eliud_core/model/app_component_bloc.dart';
import 'package:eliud_core/model/app_component_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

/*
 * AbstractAppComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractAppComponent extends StatelessWidget {
  static String componentName = "apps";
  final AppModel app;
  final String appId;

  /*
   * Construct AbstractAppComponent
   */
  AbstractAppComponent({super.key, required this.app, required this.appId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppComponentBloc>(
      create: (context) =>
          AppComponentBloc(appRepository: appRepository(appId: app.documentID)!)
            ..add(FetchAppComponent(id: appId)),
      child: _appBlockBuilder(context),
    );
  }

  Widget _appBlockBuilder(BuildContext context) {
    return BlocBuilder<AppComponentBloc, AppComponentState>(
        builder: (context, state) {
      if (state is AppComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is AppComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is AppComponentError) {
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
  Widget yourWidget(BuildContext context, AppModel value);
}
