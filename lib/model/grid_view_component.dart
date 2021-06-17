/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/grid_view_component_bloc.dart';
import 'package:eliud_core/model/grid_view_component_event.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/grid_view_repository.dart';
import 'package:eliud_core/model/grid_view_component_state.dart';

abstract class AbstractGridViewComponent extends StatelessWidget {
  static String componentName = "gridViews";
  final String? gridViewID;

  AbstractGridViewComponent({this.gridViewID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridViewComponentBloc> (
          create: (context) => GridViewComponentBloc(
            gridViewRepository: getGridViewRepository(context))
        ..add(FetchGridViewComponent(id: gridViewID)),
      child: _gridViewBlockBuilder(context),
    );
  }

  Widget _gridViewBlockBuilder(BuildContext context) {
    return BlocBuilder<GridViewComponentBloc, GridViewComponentState>(builder: (context, state) {
      if (state is GridViewComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No GridView defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is GridViewComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is GridViewComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, GridViewModel? value);
  Widget alertWidget({ title: String, content: String});
  GridViewRepository getGridViewRepository(BuildContext context);
}

