/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 cart_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(): super(AppUninitialized());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    final currentState = state;
    if (event is FetchApp) {
      try {
        if (currentState is AppUninitialized) {
          var model = await _fetchApp(event.id);
          if (model != null) {
            var asPlaystore = event.asPlaystore;
            if (asPlaystore) {
              yield AppLoaded(playStoreApp: model, app: model);
            } else {
              yield AppLoaded(app: model);
            }
          } else {
            var id = event.id;
            yield AppError(message: "App with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield AppError(message: 'Unknown error whilst retrieving Cart');
      }
    }
  }

  Future<AppModel> _fetchApp(String id) async {
    return await AbstractMainRepositorySingleton.singleton.appRepository().get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  /* Helper functions to get details from the AppState */
  static AppBloc getBloc(BuildContext context) {
    return BlocProvider.of<AppBloc>(context);
  }

  static AppState getState(BuildContext context) {
    return BlocProvider.of<AppBloc>(context).state;
  }

  static String appId(BuildContext context) {
    var appState = BlocProvider.of<AppBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.app.documentID;
    }
    return null;
  }

  static AppModel app(BuildContext context) {
    var appState = BlocProvider.of<AppBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.app;
    }
    return null;
  }

  static String addPlayStoreApp(BuildContext context) {
    var appState = BlocProvider.of<AppBloc>(context).state;
    if (appState is AppLoaded) {
      if (appState.playStoreApp == null) return null;
      if (appState.app.documentID == appState.playStoreApp.documentID) {
        return null;
      }
      return appState.playStoreApp.documentID;
    }
    return null;
  }

  static bool isPlayStoreApp(BuildContext context, String documentID) {
    var appState = BlocProvider.of<AppBloc>(context).state;
    if (appState is AppLoaded) {
      return appState.playStoreApp.documentID == documentID;
    }
    return false;
  }
}
