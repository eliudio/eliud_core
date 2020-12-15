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

class DialogComponentBloc extends Bloc<DialogComponentEvent, DialogComponentState> {
  final DialogRepository dialogRepository;

  DialogComponentBloc({ this.dialogRepository }): super(DialogComponentUninitialized());
  @override
  Stream<DialogComponentState> mapEventToState(DialogComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDialogComponent) {
      try {
        if (currentState is DialogComponentUninitialized) {
          final DialogModel model = await _fetchDialog(event.id);

          if (model != null) {
            yield DialogComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield DialogComponentError(message: "Dialog with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield DialogComponentError(message: "Unknown error whilst retrieving Dialog");
      }
    }
  }

  Future<DialogModel> _fetchDialog(String id) async {
    return dialogRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


