/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_component_event.dart';
import 'package:eliud_core/model/app_component_state.dart';
import 'package:eliud_core/model/app_repository.dart';
import 'package:flutter/services.dart';


class AppComponentBloc extends Bloc<AppComponentEvent, AppComponentState> {
  final AppRepository? appRepository;
  StreamSubscription? _appSubscription;

  Stream<AppComponentState> _mapLoadAppComponentUpdateToState(String documentId) async* {
    _appSubscription?.cancel();
    _appSubscription = appRepository!.listenTo(documentId, (value) {
      if (value != null) add(AppComponentUpdated(value: value));
    });
  }

  AppComponentBloc({ this.appRepository }): super(AppComponentUninitialized());

  @override
  Stream<AppComponentState> mapEventToState(AppComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppComponent) {
      yield* _mapLoadAppComponentUpdateToState(event.id!);
    } else if (event is AppComponentUpdated) {
      yield AppComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _appSubscription?.cancel();
    return super.close();
  }

}

