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

import 'package:eliud_core/model/app_component_event.dart';
import 'package:eliud_core/model/app_component_state.dart';
import 'package:eliud_core/model/app_repository.dart';

class AppComponentBloc extends Bloc<AppComponentEvent, AppComponentState> {
  final AppRepository? appRepository;
  StreamSubscription? _appSubscription;

  void _mapLoadAppComponentUpdateToState(String documentId) {
    _appSubscription?.cancel();
    _appSubscription = appRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(AppComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct AppComponentBloc
   */
  AppComponentBloc({this.appRepository}) : super(AppComponentUninitialized()) {
    on<FetchAppComponent>((event, emit) {
      _mapLoadAppComponentUpdateToState(event.id!);
    });
    on<AppComponentUpdated>((event, emit) {
      emit(AppComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the AppComponentBloc
   */
  @override
  Future<void> close() {
    _appSubscription?.cancel();
    return super.close();
  }
}
