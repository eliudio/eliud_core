/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_form_bloc.dart
                       
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

import 'package:eliud_core/model/app_policy_form_event.dart';
import 'package:eliud_core/model/app_policy_form_state.dart';
import 'package:eliud_core/model/app_policy_repository.dart';

class AppPolicyFormBloc extends Bloc<AppPolicyFormEvent, AppPolicyFormState> {
  final FormAction? formAction;
  final String? appId;

  AppPolicyFormBloc(this.appId, { this.formAction }): super(AppPolicyFormUninitialized());
  @override
  Stream<AppPolicyFormState> mapEventToState(AppPolicyFormEvent event) async* {
    final AppPolicyFormState currentState = state;
    if (currentState is AppPolicyFormUninitialized) {
      if (event is InitialiseNewAppPolicyFormEvent) {
        AppPolicyFormLoaded loaded = AppPolicyFormLoaded(value: AppPolicyModel(
                                               documentID: "",
                                 appId: "",
                                 comments: "",
                                 policies: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppPolicyFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppPolicyFormLoaded loaded = AppPolicyFormLoaded(value: await appPolicyRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAppPolicyFormNoLoadEvent) {
        AppPolicyFormLoaded loaded = AppPolicyFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppPolicyFormInitialized) {
      AppPolicyModel? newValue = null;
      if (event is ChangedAppPolicyDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableAppPolicyForm(value: newValue);
        }

        return;
      }
      if (event is ChangedAppPolicyComments) {
        newValue = currentState.value!.copyWith(comments: event.value);
        yield SubmittableAppPolicyForm(value: newValue);

        return;
      }
      if (event is ChangedAppPolicyPolicies) {
        newValue = currentState.value!.copyWith(policies: event.value);
        yield SubmittableAppPolicyForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDAppPolicyFormError error(String message, AppPolicyModel newValue) => DocumentIDAppPolicyFormError(message: message, value: newValue);

  Future<AppPolicyFormState> _isDocumentIDValid(String? value, AppPolicyModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AppPolicyModel?> findDocument = appPolicyRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppPolicyForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

