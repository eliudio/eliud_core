/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_item_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_policy_item_form_event.dart';
import 'package:eliud_core/model/app_policy_item_form_state.dart';
import 'package:eliud_core/model/model_export.dart';

class AppPolicyItemFormBloc extends Bloc<AppPolicyItemFormEvent, AppPolicyItemFormState> {
  final String? appId;

  AppPolicyItemFormBloc(this.appId, ): super(AppPolicyItemFormUninitialized());
  @override
  Stream<AppPolicyItemFormState> mapEventToState(AppPolicyItemFormEvent event) async* {
    final currentState = state;
    if (currentState is AppPolicyItemFormUninitialized) {
      on <InitialiseNewAppPolicyItemFormEvent> ((event, emit) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: AppPolicyItemModel(
                                               documentID: "IDENTIFIER", 
                                 name: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseAppPolicyItemFormEvent) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseAppPolicyItemFormNoLoadEvent) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is AppPolicyItemFormInitialized) {
      AppPolicyItemModel? newValue = null;
      on <ChangedAppPolicyItemName> ((event, emit) async {
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableAppPolicyItemForm(value: newValue));

      });
      on <ChangedAppPolicyItemPolicy> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(policy: await publicMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppPolicyItemForm(value: newValue));

      });
    }
  }


}

