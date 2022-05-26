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
import 'package:eliud_core/model/grid_view_component_event.dart';
import 'package:eliud_core/model/grid_view_component_state.dart';
import 'package:eliud_core/model/grid_view_repository.dart';

class GridViewComponentBloc extends Bloc<GridViewComponentEvent, GridViewComponentState> {
  final GridViewRepository? gridViewRepository;
  StreamSubscription? _gridViewSubscription;

  void _mapLoadGridViewComponentUpdateToState(String documentId) {
    _gridViewSubscription?.cancel();
    _gridViewSubscription = gridViewRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(GridViewComponentUpdated(value: value));
      }
    });
  }

  GridViewComponentBloc({ this.gridViewRepository }): super(GridViewComponentUninitialized()) {
    on <FetchGridViewComponent> ((event, emit) {
      _mapLoadGridViewComponentUpdateToState(event.id!);
    });
    on <GridViewComponentUpdated> ((event, emit) {
      emit(GridViewComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _gridViewSubscription?.cancel();
    return super.close();
  }

}

