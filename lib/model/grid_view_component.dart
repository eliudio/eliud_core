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

import 'package:eliud_core/model/grid_view_component_bloc.dart';
import 'package:eliud_core/model/grid_view_component_event.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/grid_view_repository.dart';
import 'package:eliud_core/model/grid_view_component_state.dart';

abstract class AbstractGridViewComponent extends StatelessWidget {
  static String componentName = "gridViews";
  final String gridViewID;

  AbstractGridViewComponent({this.gridViewID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridViewBloc> (
          create: (context) => GridViewBloc(
            gridViewRepository: getGridViewRepository())
        ..add(FetchGridView(id: gridViewID)),
      child: _gridViewBlockBuilder(context),
    );
  }

  Widget _gridViewBlockBuilder(BuildContext context) {
    return BlocBuilder<GridViewBloc, GridViewState>(builder: (context, state) {
      if (state is GridViewLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No gridView defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is GridViewError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, GridViewModel value);
  Widget alertWidget({ title: String, content: String});
  GridViewRepository getGridViewRepository();
}


