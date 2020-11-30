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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple(this.item1, this.item2);
}

class AppBloc extends Bloc<AppEvent, AppState> {
  final NavigatorBloc navigatorBloc;
  final AccessBloc accessBloc;
  final String playstoreAppId;
  AppModel _playstore;

  AppBloc(this.navigatorBloc, this.accessBloc, this.playstoreAppId): super(AppUninitialized());

  Future<void> _initPlaystore() async {
    if ((playstoreAppId != null) && (_playstore == null)) {
      _playstore = await _fetchApp(playstoreAppId);
    }
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is FetchApp) {
      var toYield = await yieldThis(event.id);
      accessBloc.add(InitApp(toYield.item2));
      yield toYield.item1;
    } else if (event is SwitchAppEvent) {
      var toYield = await yieldThis(event.id);
      navigatorBloc.add(GoHome());
      accessBloc.add(SwitchedApp(toYield.item2));
      yield toYield.item1;
    }
  }

  Future<Tuple<AppState, AppModel>> yieldThis(id) async {
    await _initPlaystore();
    try {
      var model = await _fetchApp(id);
      if (model != null) {
        return Tuple(AppLoaded(playStoreApp: _playstore, app: model), model);
      } else {
        return Tuple(AppError(message: "App with id = '$id' not found"), null);
      }
    } catch (_) {
      return Tuple(AppError(message: 'Unknown error whilst retrieving App'), null);
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
