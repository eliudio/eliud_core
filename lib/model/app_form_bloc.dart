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

import 'package:eliud_core/model/app_form_event.dart';
import 'package:eliud_core/model/app_form_state.dart';
import 'package:eliud_core/model/app_repository.dart';

class AppFormBloc extends Bloc<AppFormEvent, AppFormState> {
  final FormAction? formAction;
  final String? appId;

  AppFormBloc(this.appId, { this.formAction }): super(AppFormUninitialized());
  @override
  Stream<AppFormState> mapEventToState(AppFormEvent event) async* {
    final currentState = state;
    if (currentState is AppFormUninitialized) {
      if (event is InitialiseNewAppFormEvent) {
        AppFormLoaded loaded = AppFormLoaded(value: AppModel(
                                               documentID: "",
                                 ownerID: "",
                                 title: "",
                                 email: "",
                                 description: "",
                                 routeAnimationDuration: 1000, 
                                 logoURL: "",
                                 styleFamily: "",
                                 styleName: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppFormLoaded loaded = AppFormLoaded(value: await appRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAppFormNoLoadEvent) {
        AppFormLoaded loaded = AppFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppFormInitialized) {
      AppModel? newValue = null;
      if (event is ChangedAppDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableAppForm(value: newValue);
        }

        return;
      }
      if (event is ChangedAppTitle) {
        newValue = currentState.value!.copyWith(title: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppEmail) {
        newValue = currentState.value!.copyWith(email: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppAppStatus) {
        newValue = currentState.value!.copyWith(appStatus: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppHomePages) {
        newValue = currentState.value!.copyWith(homePages: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppLogo) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(logo: await memberMediumRepository(appId: appId)!.get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value!.documentID,
                                 ownerID: currentState.value!.ownerID,
                                 title: currentState.value!.title,
                                 email: currentState.value!.email,
                                 description: currentState.value!.description,
                                 appStatus: currentState.value!.appStatus,
                                 homePages: currentState.value!.homePages,
                                 logo: null,
                                 routeBuilder: currentState.value!.routeBuilder,
                                 routeAnimationDuration: currentState.value!.routeAnimationDuration,
                                 logoURL: currentState.value!.logoURL,
                                 policies: currentState.value!.policies,
                                 styleFamily: currentState.value!.styleFamily,
                                 styleName: currentState.value!.styleName,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppRouteBuilder) {
        newValue = currentState.value!.copyWith(routeBuilder: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppRouteAnimationDuration) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(routeAnimationDuration: int.parse(event.value!));
          yield SubmittableAppForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(routeAnimationDuration: 0);
          yield RouteAnimationDurationAppFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedAppPolicies) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(policies: await appPolicyRepository(appId: appId)!.get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value!.documentID,
                                 ownerID: currentState.value!.ownerID,
                                 title: currentState.value!.title,
                                 email: currentState.value!.email,
                                 description: currentState.value!.description,
                                 appStatus: currentState.value!.appStatus,
                                 homePages: currentState.value!.homePages,
                                 logo: currentState.value!.logo,
                                 routeBuilder: currentState.value!.routeBuilder,
                                 routeAnimationDuration: currentState.value!.routeAnimationDuration,
                                 logoURL: currentState.value!.logoURL,
                                 policies: null,
                                 styleFamily: currentState.value!.styleFamily,
                                 styleName: currentState.value!.styleName,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppStyleFamily) {
        newValue = currentState.value!.copyWith(styleFamily: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppStyleName) {
        newValue = currentState.value!.copyWith(styleName: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
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

