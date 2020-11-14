/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/grid_view_component_event.dart';
import 'package:eliud_core/model/grid_view_component_state.dart';
import 'package:eliud_core/model/grid_view_repository.dart';
class GridViewComponentBloc extends Bloc<GridViewComponentEvent, GridViewComponentState> {
  final GridViewRepository gridViewRepository;

  GridViewComponentBloc({ this.gridViewRepository }): super(GridViewComponentUninitialized());
  @override
  Stream<GridViewComponentState> mapEventToState(GridViewComponentEvent event) async* {
    final currentState = state;
    if (event is FetchGridViewComponent) {
      try {
        if (currentState is GridViewComponentUninitialized) {
          final GridViewModel model = await _fetchGridView(event.id);

          if (model != null) {
            yield GridViewComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield GridViewComponentError(message: "GridView with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield GridViewComponentError(message: "Unknown error whilst retrieving GridView");
      }
    }
  }

  Future<GridViewModel> _fetchGridView(String id) async {
    return gridViewRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


