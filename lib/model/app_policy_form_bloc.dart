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

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/app_policy_form_event.dart';
import 'package:eliud_core/model/app_policy_form_state.dart';

class AppPolicyFormBloc extends Bloc<AppPolicyFormEvent, AppPolicyFormState> {
  final FormAction? formAction;
  final String? appId;

  AppPolicyFormBloc(this.appId, {this.formAction})
      : super(AppPolicyFormUninitialized()) {
    on<InitialiseNewAppPolicyFormEvent>((event, emit) {
      AppPolicyFormLoaded loaded = AppPolicyFormLoaded(
          value: AppPolicyModel(
        documentID: "",
        appId: "",
        name: "",
      ));
      emit(loaded);
    });

    on<InitialiseAppPolicyFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      AppPolicyFormLoaded loaded = AppPolicyFormLoaded(
          value: await appPolicyRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseAppPolicyFormNoLoadEvent>((event, emit) async {
      AppPolicyFormLoaded loaded = AppPolicyFormLoaded(value: event.value);
      emit(loaded);
    });
    AppPolicyModel? newValue;
    on<ChangedAppPolicyDocumentID>((event, emit) async {
      if (state is AppPolicyFormInitialized) {
        final currentState = state as AppPolicyFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableAppPolicyForm(value: newValue));
        }
      }
    });
    on<ChangedAppPolicyName>((event, emit) async {
      if (state is AppPolicyFormInitialized) {
        final currentState = state as AppPolicyFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableAppPolicyForm(value: newValue));
      }
    });
    on<ChangedAppPolicyPolicy>((event, emit) async {
      if (state is AppPolicyFormInitialized) {
        final currentState = state as AppPolicyFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              policy: await platformMediumRepository(appId: appId)!
                  .get(event.value));
        }
        emit(SubmittableAppPolicyForm(value: newValue));
      }
    });
    on<ChangedAppPolicyConditions>((event, emit) async {
      if (state is AppPolicyFormInitialized) {
        final currentState = state as AppPolicyFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableAppPolicyForm(value: newValue));
      }
    });
  }

  DocumentIDAppPolicyFormError error(String message, AppPolicyModel newValue) =>
      DocumentIDAppPolicyFormError(message: message, value: newValue);

  Future<AppPolicyFormState> _isDocumentIDValid(
      String? value, AppPolicyModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<AppPolicyModel?> findDocument =
        appPolicyRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppPolicyForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
