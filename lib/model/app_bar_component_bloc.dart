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

import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/app_bar_component_event.dart';
import 'package:eliud_core/model/app_bar_component_state.dart';
import 'package:eliud_core/model/app_bar_repository.dart';

class AppBarComponentBloc extends Bloc<AppBarComponentEvent, AppBarComponentState> {
  final AppBarRepository appBarRepository;

  AppBarComponentBloc({ this.appBarRepository }): super(AppBarComponentUninitialized());
  @override
  Stream<AppBarComponentState> mapEventToState(AppBarComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppBarComponent) {
      try {
        if (currentState is AppBarComponentUninitialized) {
          final AppBarModel model = await _fetchAppBar(event.id);

          if (model != null) {
            yield AppBarComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield AppBarComponentError(message: "AppBar with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AppBarComponentError(message: "Unknown error whilst retrieving AppBar");
      }
    }
  }

  Future<AppBarModel> _fetchAppBar(String id) async {
    return appBarRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


