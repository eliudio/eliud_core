/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_component_event.dart';
import 'package:eliud_core/model/pos_size_component_state.dart';
import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:flutter/services.dart';

class PosSizeComponentBloc extends Bloc<PosSizeComponentEvent, PosSizeComponentState> {
  final PosSizeRepository? posSizeRepository;

  PosSizeComponentBloc({ this.posSizeRepository }): super(PosSizeComponentUninitialized());
  @override
  Stream<PosSizeComponentState> mapEventToState(PosSizeComponentEvent event) async* {
    final PosSizeComponentState currentState = state;
    if (event is FetchPosSizeComponent) {
      try {
        if (currentState is PosSizeComponentUninitialized) {
          bool permissionDenied = false;
          final model = await posSizeRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PosSizeComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PosSizeComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PosSizeComponentError(
                  message: "PosSize with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PosSizeComponentError(message: "Unknown error whilst retrieving PosSize");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

