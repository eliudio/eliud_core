/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/blocking_model.dart';
import 'package:eliud_core/model/blocking_component_event.dart';
import 'package:eliud_core/model/blocking_component_state.dart';
import 'package:eliud_core/model/blocking_repository.dart';
import 'package:flutter/services.dart';

class BlockingComponentBloc extends Bloc<BlockingComponentEvent, BlockingComponentState> {
  final BlockingRepository? blockingRepository;
  StreamSubscription? _blockingSubscription;

  void _mapLoadBlockingComponentUpdateToState(String documentId) {
    _blockingSubscription?.cancel();
    _blockingSubscription = blockingRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(BlockingComponentUpdated(value: value));
      }
    });
  }

  BlockingComponentBloc({ this.blockingRepository }): super(BlockingComponentUninitialized()) {
    on <FetchBlockingComponent> ((event, emit) {
      _mapLoadBlockingComponentUpdateToState(event.id!);
    });
    on <BlockingComponentUpdated> ((event, emit) {
      emit(BlockingComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _blockingSubscription?.cancel();
    return super.close();
  }

}

