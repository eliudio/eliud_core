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
  StreamSubscription? _posSizeSubscription;

  Stream<PosSizeComponentState> _mapLoadPosSizeComponentUpdateToState(String documentId) async* {
    _posSizeSubscription?.cancel();
    _posSizeSubscription = posSizeRepository!.listenTo(documentId, (value) {
      if (value != null) add(PosSizeComponentUpdated(value: value));
    });
  }

  PosSizeComponentBloc({ this.posSizeRepository }): super(PosSizeComponentUninitialized());

  @override
  Stream<PosSizeComponentState> mapEventToState(PosSizeComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPosSizeComponent) {
      yield* _mapLoadPosSizeComponentUpdateToState(event.id!);
    } else if (event is PosSizeComponentUpdated) {
      yield PosSizeComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _posSizeSubscription?.cancel();
    return super.close();
  }

}

