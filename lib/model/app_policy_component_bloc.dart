/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/app_policy_model.dart';
import 'package:eliud_core/model/app_policy_component_event.dart';
import 'package:eliud_core/model/app_policy_component_state.dart';
import 'package:eliud_core/model/app_policy_repository.dart';
import 'package:flutter/services.dart';

class AppPolicyComponentBloc extends Bloc<AppPolicyComponentEvent, AppPolicyComponentState> {
  final AppPolicyRepository? appPolicyRepository;

  AppPolicyComponentBloc({ this.appPolicyRepository }): super(AppPolicyComponentUninitialized());
  @override
  Stream<AppPolicyComponentState> mapEventToState(AppPolicyComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppPolicyComponent) {
      try {
        if (currentState is AppPolicyComponentUninitialized) {
          bool permissionDenied = false;
          final model = await appPolicyRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield AppPolicyComponentPermissionDenied();
          } else {
            if (model != null) {
              yield AppPolicyComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield AppPolicyComponentError(
                  message: "AppPolicy with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield AppPolicyComponentError(message: "Unknown error whilst retrieving AppPolicy");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

