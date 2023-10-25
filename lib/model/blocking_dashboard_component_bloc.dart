/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/blocking_dashboard_model.dart';
import 'package:eliud_core/model/blocking_dashboard_component_event.dart';
import 'package:eliud_core/model/blocking_dashboard_component_state.dart';
import 'package:eliud_core/model/blocking_dashboard_repository.dart';
import 'package:flutter/services.dart';

class BlockingDashboardComponentBloc extends Bloc<BlockingDashboardComponentEvent, BlockingDashboardComponentState> {
  final BlockingDashboardRepository? blockingDashboardRepository;
  StreamSubscription? _blockingDashboardSubscription;

  void _mapLoadBlockingDashboardComponentUpdateToState(String documentId) {
    _blockingDashboardSubscription?.cancel();
    _blockingDashboardSubscription = blockingDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(BlockingDashboardComponentUpdated(value: value));
      }
    });
  }

  BlockingDashboardComponentBloc({ this.blockingDashboardRepository }): super(BlockingDashboardComponentUninitialized()) {
    on <FetchBlockingDashboardComponent> ((event, emit) {
      _mapLoadBlockingDashboardComponentUpdateToState(event.id!);
    });
    on <BlockingDashboardComponentUpdated> ((event, emit) {
      emit(BlockingDashboardComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _blockingDashboardSubscription?.cancel();
    return super.close();
  }

}

