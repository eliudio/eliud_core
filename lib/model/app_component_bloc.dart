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

import 'app_model.dart';
import 'app_component_event.dart';
import 'app_component_state.dart';
import 'app_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository appRepository;

  AppBloc({ this.appRepository }): super(AppUninitialized());
  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    final currentState = state;
    if (event is FetchApp) {
      try {
        if (currentState is AppUninitialized) {
          final AppModel model = await _fetchApp(event.id);

          if (model != null) {
            yield AppLoaded(value: model);
          } else {
            String id = event.id;
            yield AppError(message: "App with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AppError(message: "Unknown error whilst retrieving App");
      }
    }
  }

  Future<AppModel> _fetchApp(String id) async {
    return appRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


