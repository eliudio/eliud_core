/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/model/dialog_component_event.dart';
import 'package:eliud_core/model/dialog_component_state.dart';
import 'package:eliud_core/model/dialog_repository.dart';
import 'package:flutter/services.dart';


class DialogComponentBloc extends Bloc<DialogComponentEvent, DialogComponentState> {
  final DialogRepository? dialogRepository;

  DialogComponentBloc({ this.dialogRepository }): super(DialogComponentUninitialized());
  @override
  Stream<DialogComponentState> mapEventToState(DialogComponentEvent event) async* {
    final DialogComponentState currentState = state;
    if (event is FetchDialogComponent) {
      try {
        if (currentState is DialogComponentUninitialized) {
          bool permissionDenied = false;
          final model = await dialogRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield DialogComponentPermissionDenied();
          } else {
            if (model != null) {
              yield DialogComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield DialogComponentError(
                  message: "Dialog with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield DialogComponentError(message: "Unknown error whilst retrieving Dialog");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

