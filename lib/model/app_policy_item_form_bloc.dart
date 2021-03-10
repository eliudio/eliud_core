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
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/app_policy_item_form_event.dart';
import 'package:eliud_core/model/app_policy_item_form_state.dart';
import 'package:eliud_core/model/app_policy_item_repository.dart';

class AppPolicyItemFormBloc extends Bloc<AppPolicyItemFormEvent, AppPolicyItemFormState> {
  final String appId;

  AppPolicyItemFormBloc(this.appId, ): super(AppPolicyItemFormUninitialized());
  @override
  Stream<AppPolicyItemFormState> mapEventToState(AppPolicyItemFormEvent event) async* {
    final currentState = state;
    if (currentState is AppPolicyItemFormUninitialized) {
      if (event is InitialiseNewAppPolicyItemFormEvent) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: AppPolicyItemModel(
                                               documentID: "IDENTIFIER", 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppPolicyItemFormEvent) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseAppPolicyItemFormNoLoadEvent) {
        AppPolicyItemFormLoaded loaded = AppPolicyItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppPolicyItemFormInitialized) {
      AppPolicyItemModel newValue = null;
      if (event is ChangedAppPolicyItemPolicy) {
        if (event.value != null)
          newValue = currentState.value.copyWith(policy: await policyRepository(appId: appId).get(event.value));
        else
          newValue = new AppPolicyItemModel(
                                 documentID: currentState.value.documentID,
                                 policy: null,
          );
        yield SubmittableAppPolicyItemForm(value: newValue);

        return;
      }
    }
  }


}

