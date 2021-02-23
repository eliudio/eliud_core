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
  final FormAction formAction;
  final String appId;

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
                                 formSubmitButtonColor: RgbModel(r: 255, g: 0, b: 255, opacity: 1.00), 
                                 formSubmitButtonTextColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 formGroupTitleColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 formFieldTextColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 formFieldHeaderColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 formFieldFocusColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 formAppBarTextColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 listTextItemColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 floatingButtonForegroundColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 floatingButtonBackgroundColor: RgbModel(r: 255, g: 0, b: 255, opacity: 1.00), 
                                 dividerColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 iconColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 routeAnimationDuration: 1000, 
                                 logoURL: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppFormLoaded loaded = AppFormLoaded(value: await appRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAppFormNoLoadEvent) {
        AppFormLoaded loaded = AppFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppFormInitialized) {
      AppModel newValue = null;
      if (event is ChangedAppDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableAppForm(value: newValue);
        }

        return;
      }
      if (event is ChangedAppTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppEmail) {
        newValue = currentState.value.copyWith(email: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppAppStatus) {
        newValue = currentState.value.copyWith(appStatus: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppDarkOrLight) {
        newValue = currentState.value.copyWith(darkOrLight: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppHomePages) {
        newValue = currentState.value.copyWith(homePages: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppLogo) {
        if (event.value != null)
          newValue = currentState.value.copyWith(logo: await memberMediumRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: null,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormSubmitButtonColor) {
        newValue = currentState.value.copyWith(formSubmitButtonColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(formBackground: await backgroundRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: null,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormSubmitButtonTextColor) {
        newValue = currentState.value.copyWith(formSubmitButtonTextColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormGroupTitleColor) {
        newValue = currentState.value.copyWith(formGroupTitleColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormFieldTextColor) {
        newValue = currentState.value.copyWith(formFieldTextColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormFieldHeaderColor) {
        newValue = currentState.value.copyWith(formFieldHeaderColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormFieldFocusColor) {
        newValue = currentState.value.copyWith(formFieldFocusColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormAppBarBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(formAppBarBackground: await backgroundRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: null,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFormAppBarTextColor) {
        newValue = currentState.value.copyWith(formAppBarTextColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppListBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(listBackground: await backgroundRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: null,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppListTextItemColor) {
        newValue = currentState.value.copyWith(listTextItemColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFloatingButtonForegroundColor) {
        newValue = currentState.value.copyWith(floatingButtonForegroundColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFloatingButtonBackgroundColor) {
        newValue = currentState.value.copyWith(floatingButtonBackgroundColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppDividerColor) {
        newValue = currentState.value.copyWith(dividerColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppIconColor) {
        newValue = currentState.value.copyWith(iconColor: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppRouteBuilder) {
        newValue = currentState.value.copyWith(routeBuilder: event.value);
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppRouteAnimationDuration) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(routeAnimationDuration: int.parse(event.value));
          yield SubmittableAppForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(routeAnimationDuration: 0);
          yield RouteAnimationDurationAppFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedAppH1) {
        if (event.value != null)
          newValue = currentState.value.copyWith(h1: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: null,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppH2) {
        if (event.value != null)
          newValue = currentState.value.copyWith(h2: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: null,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppH3) {
        if (event.value != null)
          newValue = currentState.value.copyWith(h3: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: null,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppH4) {
        if (event.value != null)
          newValue = currentState.value.copyWith(h4: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: null,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppH5) {
        if (event.value != null)
          newValue = currentState.value.copyWith(h5: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: null,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFontText) {
        if (event.value != null)
          newValue = currentState.value.copyWith(fontText: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: null,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFontHighlight1) {
        if (event.value != null)
          newValue = currentState.value.copyWith(fontHighlight1: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: null,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFontHighlight2) {
        if (event.value != null)
          newValue = currentState.value.copyWith(fontHighlight2: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: null,
                                 fontLink: currentState.value.fontLink,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
      if (event is ChangedAppFontLink) {
        if (event.value != null)
          newValue = currentState.value.copyWith(fontLink: await fontRepository(appId: appId).get(event.value));
        else
          newValue = new AppModel(
                                 documentID: currentState.value.documentID,
                                 ownerID: currentState.value.ownerID,
                                 title: currentState.value.title,
                                 email: currentState.value.email,
                                 description: currentState.value.description,
                                 appStatus: currentState.value.appStatus,
                                 darkOrLight: currentState.value.darkOrLight,
                                 homePages: currentState.value.homePages,
                                 logo: currentState.value.logo,
                                 formSubmitButtonColor: currentState.value.formSubmitButtonColor,
                                 formBackground: currentState.value.formBackground,
                                 formSubmitButtonTextColor: currentState.value.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value.formGroupTitleColor,
                                 formFieldTextColor: currentState.value.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value.formFieldFocusColor,
                                 formAppBarBackground: currentState.value.formAppBarBackground,
                                 formAppBarTextColor: currentState.value.formAppBarTextColor,
                                 listBackground: currentState.value.listBackground,
                                 listTextItemColor: currentState.value.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value.dividerColor,
                                 iconColor: currentState.value.iconColor,
                                 routeBuilder: currentState.value.routeBuilder,
                                 routeAnimationDuration: currentState.value.routeAnimationDuration,
                                 logoURL: currentState.value.logoURL,
                                 h1: currentState.value.h1,
                                 h2: currentState.value.h2,
                                 h3: currentState.value.h3,
                                 h4: currentState.value.h4,
                                 h5: currentState.value.h5,
                                 fontText: currentState.value.fontText,
                                 fontHighlight1: currentState.value.fontHighlight1,
                                 fontHighlight2: currentState.value.fontHighlight2,
                                 fontLink: null,
          );
        yield SubmittableAppForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDAppFormError error(String message, AppModel newValue) => DocumentIDAppFormError(message: message, value: newValue);

  Future<AppFormState> _isDocumentIDValid(String value, AppModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AppModel> findDocument = appRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

