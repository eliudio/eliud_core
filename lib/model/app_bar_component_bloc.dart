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
import 'package:flutter/services.dart';


class AppBarComponentBloc extends Bloc<AppBarComponentEvent, AppBarComponentState> {
  final AppBarRepository appBarRepository;

  AppBarComponentBloc({ this.appBarRepository }): super(AppBarComponentUninitialized());
  @override
  Stream<AppBarComponentState> mapEventToState(AppBarComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppBarComponent) {
      try {
        if (currentState is AppBarComponentUninitialized) {
          bool permissionDenied = false;
          final model = await appBarRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield AppBarComponentPermissionDenied();
          } else {
            if (model != null) {
              yield AppBarComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield AppBarComponentError(
                  message: "AppBar with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield AppBarComponentError(message: "Unknown error whilst retrieving AppBar");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

