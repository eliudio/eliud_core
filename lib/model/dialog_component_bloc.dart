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
  StreamSubscription? _dialogSubscription;

  Stream<DialogComponentState> _mapLoadDialogComponentUpdateToState(String documentId) async* {
    _dialogSubscription?.cancel();
    _dialogSubscription = dialogRepository!.listenTo(documentId, (value) {
      if (value != null) add(DialogComponentUpdated(value: value));
    });
  }

  DialogComponentBloc({ this.dialogRepository }): super(DialogComponentUninitialized());

  @override
  Stream<DialogComponentState> mapEventToState(DialogComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDialogComponent) {
      yield* _mapLoadDialogComponentUpdateToState(event.id!);
    } else if (event is DialogComponentUpdated) {
      yield DialogComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _dialogSubscription?.cancel();
    return super.close();
  }

}

