/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/app_bar_component_event.dart';
import 'package:eliud_core/model/app_bar_component_state.dart';
import 'package:eliud_core/model/app_bar_repository.dart';


class AppBarComponentBloc extends Bloc<AppBarComponentEvent, AppBarComponentState> {
  final AppBarRepository? appBarRepository;
  StreamSubscription? _appBarSubscription;

  void _mapLoadAppBarComponentUpdateToState(String documentId) {
    _appBarSubscription?.cancel();
    _appBarSubscription = appBarRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(AppBarComponentUpdated(value: value));
      }
    });
  }

  AppBarComponentBloc({ this.appBarRepository }): super(AppBarComponentUninitialized()) {
    on <FetchAppBarComponent> ((event, emit) {
      _mapLoadAppBarComponentUpdateToState(event.id!);
    });
    on <AppBarComponentUpdated> ((event, emit) {
      emit(AppBarComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _appBarSubscription?.cancel();
    return super.close();
  }

}

