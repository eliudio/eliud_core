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

class AppComponentBloc extends Bloc<AppComponentEvent, AppComponentState> {
  final AppRepository appRepository;

  AppComponentBloc({ this.appRepository }): super(AppComponentUninitialized());
  @override
  Stream<AppComponentState> mapEventToState(AppComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppComponent) {
      try {
        if (currentState is AppComponentUninitialized) {
          final AppModel model = await _fetchApp(event.id);

          if (model != null) {
            yield AppComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield AppComponentError(message: "App with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AppComponentError(message: "Unknown error whilst retrieving App");
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


