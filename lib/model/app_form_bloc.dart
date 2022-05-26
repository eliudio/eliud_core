/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_form_event.dart';
import 'package:eliud_core/model/app_form_state.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

class AppFormBloc extends Bloc<AppFormEvent, AppFormState> {
  final FormAction? formAction;
  final String? appId;

  AppFormBloc(this.appId, { this.formAction }): super(AppFormUninitialized());
  @override
  Stream<AppFormState> mapEventToState(AppFormEvent event) async* {
    final currentState = state;
    if (currentState is AppFormUninitialized) {
      on <InitialiseNewAppFormEvent> ((event, emit) {
        AppFormLoaded loaded = AppFormLoaded(value: AppModel(
                                               documentID: "",
                                 ownerID: "",
                                 title: "",
                                 email: "",
                                 description: "",
                                 styleFamily: "",
                                 styleName: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseAppFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppFormLoaded loaded = AppFormLoaded(value: await appRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseAppFormNoLoadEvent) {
        AppFormLoaded loaded = AppFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is AppFormInitialized) {
      AppModel? newValue = null;
      on <ChangedAppDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableAppForm(value: newValue));
        }

      });
      on <ChangedAppTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppEmail> ((event, emit) async {
        newValue = currentState.value!.copyWith(email: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppAppStatus> ((event, emit) async {
        newValue = currentState.value!.copyWith(appStatus: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppAnonymousProfilePhoto> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(anonymousProfilePhoto: await publicMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppHomePages> ((event, emit) async {
        newValue = currentState.value!.copyWith(homePages: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppLogo> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(logo: await publicMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppPolicies> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(policies: await appPolicyRepository(appId: appId)!.get(event.value));
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppStyleFamily> ((event, emit) async {
        newValue = currentState.value!.copyWith(styleFamily: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppStyleName> ((event, emit) async {
        newValue = currentState.value!.copyWith(styleName: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppAutoPrivileged1> ((event, emit) async {
        newValue = currentState.value!.copyWith(autoPrivileged1: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
      on <ChangedAppIsFeatured> ((event, emit) async {
        newValue = currentState.value!.copyWith(isFeatured: event.value);
        emit(SubmittableAppForm(value: newValue));

      });
    }
  }


  DocumentIDAppFormError error(String message, AppModel newValue) => DocumentIDAppFormError(message: message, value: newValue);

  Future<AppFormState> _isDocumentIDValid(String? value, AppModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AppModel?> findDocument = appRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

