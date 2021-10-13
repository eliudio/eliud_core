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
  StreamSubscription? _appPolicySubscription;

  Stream<AppPolicyComponentState> _mapLoadAppPolicyComponentUpdateToState(String documentId) async* {
    _appPolicySubscription?.cancel();
    _appPolicySubscription = appPolicyRepository!.listenTo(documentId, (value) {
      if (value != null) add(AppPolicyComponentUpdated(value: value!));
    });
  }

  AppPolicyComponentBloc({ this.appPolicyRepository }): super(AppPolicyComponentUninitialized());

  @override
  Stream<AppPolicyComponentState> mapEventToState(AppPolicyComponentEvent event) async* {
    final currentState = state;
    if (event is FetchAppPolicyComponent) {
      yield* _mapLoadAppPolicyComponentUpdateToState(event.id!);
    } else if (event is AppPolicyComponentUpdated) {
      yield AppPolicyComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _appPolicySubscription?.cancel();
    return super.close();
  }

}

