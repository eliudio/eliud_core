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
import 'package:flutter/services.dart';

class GridViewComponentBloc extends Bloc<GridViewComponentEvent, GridViewComponentState> {
  final GridViewRepository? gridViewRepository;

  GridViewComponentBloc({ this.gridViewRepository }): super(GridViewComponentUninitialized());
  @override
  Stream<GridViewComponentState> mapEventToState(GridViewComponentEvent event) async* {
    final GridViewComponentState currentState = state;
    if (event is FetchGridViewComponent) {
      try {
        if (currentState is GridViewComponentUninitialized) {
          bool permissionDenied = false;
          final model = await gridViewRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield GridViewComponentPermissionDenied();
          } else {
            if (model != null) {
              yield GridViewComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield GridViewComponentError(
                  message: "GridView with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield GridViewComponentError(message: "Unknown error whilst retrieving GridView");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

