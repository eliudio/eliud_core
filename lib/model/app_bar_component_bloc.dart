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

import 'app_bar_model.dart';
import 'app_bar_component_event.dart';
import 'app_bar_component_state.dart';
import 'app_bar_repository.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  final AppBarRepository appBarRepository;

  AppBarBloc({ this.appBarRepository }): super(AppBarUninitialized());
  @override
  Stream<AppBarState> mapEventToState(AppBarEvent event) async* {
    final currentState = state;
    if (event is FetchAppBar) {
      try {
        if (currentState is AppBarUninitialized) {
          final AppBarModel model = await _fetchAppBar(event.id);

          if (model != null) {
            yield AppBarLoaded(value: model);
          } else {
            String id = event.id;
            yield AppBarError(message: "AppBar with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AppBarError(message: "Unknown error whilst retrieving AppBar");
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


