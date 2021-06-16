/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_form_bloc.dart
                       
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

import 'package:eliud_core/model/eliud_style_attributes_form_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_form_state.dart';
import 'package:eliud_core/model/eliud_style_attributes_repository.dart';

class EliudStyleAttributesFormBloc extends Bloc<EliudStyleAttributesFormEvent, EliudStyleAttributesFormState> {
  final FormAction? formAction;
  final String? appId;

  EliudStyleAttributesFormBloc(this.appId, { this.formAction }): super(EliudStyleAttributesFormUninitialized());
  @override
  Stream<EliudStyleAttributesFormState> mapEventToState(EliudStyleAttributesFormEvent event) async* {
    final currentState = state;
    if (currentState is EliudStyleAttributesFormUninitialized) {
      if (event is InitialiseNewEliudStyleAttributesFormEvent) {
        EliudStyleAttributesFormLoaded loaded = EliudStyleAttributesFormLoaded(value: EliudStyleAttributesModel(
                                               documentID: "",
                                 description: "",
                                 formSubmitButtonColor: RgbModel(r: 255, g: 0, b: 255, opacity: 1.00), 
                                 formSubmitButtonTextColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 formGroupTitleColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 formFieldTextColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 formFieldHeaderColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 formFieldFocusColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 listTextItemColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 floatingButtonForegroundColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 floatingButtonBackgroundColor: RgbModel(r: 255, g: 0, b: 255, opacity: 1.00), 
                                 dividerColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 appBarIconColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 appBarSelectedIconColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 appBarMenuBackgroundColor: RgbModel(r: 64, g: 6, b: 64, opacity: 1.00), 
                                 iconColor: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 backgroundColorHomeMenu: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 iconColorHomeMenu: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseEliudStyleAttributesFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        EliudStyleAttributesFormLoaded loaded = EliudStyleAttributesFormLoaded(value: await eliudStyleAttributesRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseEliudStyleAttributesFormNoLoadEvent) {
        EliudStyleAttributesFormLoaded loaded = EliudStyleAttributesFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is EliudStyleAttributesFormInitialized) {
      EliudStyleAttributesModel? newValue = null;
      if (event is ChangedEliudStyleAttributesDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableEliudStyleAttributesForm(value: newValue);
        }

        return;
      }
      if (event is ChangedEliudStyleAttributesDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormSubmitButtonColor) {
        newValue = currentState.value!.copyWith(formSubmitButtonColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormBackground) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(formBackground: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: null,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesAppBackground) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(appBackground: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: null,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormSubmitButtonTextColor) {
        newValue = currentState.value!.copyWith(formSubmitButtonTextColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormGroupTitleColor) {
        newValue = currentState.value!.copyWith(formGroupTitleColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormFieldTextColor) {
        newValue = currentState.value!.copyWith(formFieldTextColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormFieldHeaderColor) {
        newValue = currentState.value!.copyWith(formFieldHeaderColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFormFieldFocusColor) {
        newValue = currentState.value!.copyWith(formFieldFocusColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesListBackground) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(listBackground: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: null,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesListTextItemColor) {
        newValue = currentState.value!.copyWith(listTextItemColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFloatingButtonForegroundColor) {
        newValue = currentState.value!.copyWith(floatingButtonForegroundColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFloatingButtonBackgroundColor) {
        newValue = currentState.value!.copyWith(floatingButtonBackgroundColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesDividerColor) {
        newValue = currentState.value!.copyWith(dividerColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesAppBarBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(appBarBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: null,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesAppBarIconColor) {
        newValue = currentState.value!.copyWith(appBarIconColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesAppBarSelectedIconColor) {
        newValue = currentState.value!.copyWith(appBarSelectedIconColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesAppBarMenuBackgroundColor) {
        newValue = currentState.value!.copyWith(appBarMenuBackgroundColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesBottomNavigationBarBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(bottomNavigationBarBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: null,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesDrawerBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(drawerBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: null,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesDrawerHeaderBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(drawerHeaderBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: null,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesProfileDrawerBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(profileDrawerBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: null,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesProfileDrawerHeaderBG) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(profileDrawerHeaderBG: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: null,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesIconColor) {
        newValue = currentState.value!.copyWith(iconColor: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesBackgroundHomeMenu) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(backgroundHomeMenu: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: null,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesBackgroundColorHomeMenu) {
        newValue = currentState.value!.copyWith(backgroundColorHomeMenu: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesIconColorHomeMenu) {
        newValue = currentState.value!.copyWith(iconColorHomeMenu: event.value);
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesH1) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(h1: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: null,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesH2) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(h2: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: null,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesH3) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(h3: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: null,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesH4) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(h4: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: null,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesH5) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(h5: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: null,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFontText) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(fontText: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: null,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFontHighlight1) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(fontHighlight1: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: null,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFontHighlight2) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(fontHighlight2: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: null,
                                 fontLink: currentState.value!.fontLink,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
      if (event is ChangedEliudStyleAttributesFontLink) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(fontLink: await fontRepository(appId: appId)!.get(event.value));
        else
          newValue = new EliudStyleAttributesModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 formSubmitButtonColor: currentState.value!.formSubmitButtonColor,
                                 formBackground: currentState.value!.formBackground,
                                 appBackground: currentState.value!.appBackground,
                                 formSubmitButtonTextColor: currentState.value!.formSubmitButtonTextColor,
                                 formGroupTitleColor: currentState.value!.formGroupTitleColor,
                                 formFieldTextColor: currentState.value!.formFieldTextColor,
                                 formFieldHeaderColor: currentState.value!.formFieldHeaderColor,
                                 formFieldFocusColor: currentState.value!.formFieldFocusColor,
                                 listBackground: currentState.value!.listBackground,
                                 listTextItemColor: currentState.value!.listTextItemColor,
                                 floatingButtonForegroundColor: currentState.value!.floatingButtonForegroundColor,
                                 floatingButtonBackgroundColor: currentState.value!.floatingButtonBackgroundColor,
                                 dividerColor: currentState.value!.dividerColor,
                                 appBarBG: currentState.value!.appBarBG,
                                 appBarIconColor: currentState.value!.appBarIconColor,
                                 appBarSelectedIconColor: currentState.value!.appBarSelectedIconColor,
                                 appBarMenuBackgroundColor: currentState.value!.appBarMenuBackgroundColor,
                                 bottomNavigationBarBG: currentState.value!.bottomNavigationBarBG,
                                 drawerBG: currentState.value!.drawerBG,
                                 drawerHeaderBG: currentState.value!.drawerHeaderBG,
                                 profileDrawerBG: currentState.value!.profileDrawerBG,
                                 profileDrawerHeaderBG: currentState.value!.profileDrawerHeaderBG,
                                 iconColor: currentState.value!.iconColor,
                                 backgroundHomeMenu: currentState.value!.backgroundHomeMenu,
                                 backgroundColorHomeMenu: currentState.value!.backgroundColorHomeMenu,
                                 iconColorHomeMenu: currentState.value!.iconColorHomeMenu,
                                 h1: currentState.value!.h1,
                                 h2: currentState.value!.h2,
                                 h3: currentState.value!.h3,
                                 h4: currentState.value!.h4,
                                 h5: currentState.value!.h5,
                                 fontText: currentState.value!.fontText,
                                 fontHighlight1: currentState.value!.fontHighlight1,
                                 fontHighlight2: currentState.value!.fontHighlight2,
                                 fontLink: null,
          );
        yield SubmittableEliudStyleAttributesForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDEliudStyleAttributesFormError error(String message, EliudStyleAttributesModel newValue) => DocumentIDEliudStyleAttributesFormError(message: message, value: newValue);

  Future<EliudStyleAttributesFormState> _isDocumentIDValid(String? value, EliudStyleAttributesModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<EliudStyleAttributesModel?> findDocument = eliudStyleAttributesRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableEliudStyleAttributesForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

