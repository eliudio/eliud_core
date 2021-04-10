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

  AppComponentBloc({ this.appRepository }): super(AppComponentUninitialized());
  @override
  Stream<AppComponentState> mapEventToState(AppComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppComponent) {
      try {
        if (currentState is AppComponentUninitialized) {
          bool permissionDenied = false;
          final model = await appRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield AppComponentPermissionDenied();
          } else {
            if (model != null) {
              yield AppComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield AppComponentError(
                  message: "App with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield AppComponentError(message: "Unknown error whilst retrieving App");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

