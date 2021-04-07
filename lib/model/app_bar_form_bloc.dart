/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_form_bloc.dart
                       
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

import 'package:eliud_core/model/app_bar_form_event.dart';
import 'package:eliud_core/model/app_bar_form_state.dart';
import 'package:eliud_core/model/app_bar_repository.dart';

class AppBarFormBloc extends Bloc<AppBarFormEvent, AppBarFormState> {
  final FormAction? formAction;
  final String? appId;

  AppBarFormBloc(this.appId, { this.formAction }): super(AppBarFormUninitialized());
  @override
  Stream<AppBarFormState> mapEventToState(AppBarFormEvent event) async* {
    final AppBarFormState currentState = state;
    if (currentState is AppBarFormUninitialized) {
      if (event is InitialiseNewAppBarFormEvent) {
        AppBarFormLoaded loaded = AppBarFormLoaded(value: AppBarModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 iconColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 selectedIconColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 menuBackgroundColor: RgbModel(r: 64, g: 6, b: 64, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseAppBarFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        AppBarFormLoaded loaded = AppBarFormLoaded(value: await appBarRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseAppBarFormNoLoadEvent) {
        AppBarFormLoaded loaded = AppBarFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is AppBarFormInitialized) {
      AppBarModel? newValue = null;
      if (event is ChangedAppBarDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableAppBarForm(value: newValue);
        }

        return;
      }
      if (event is ChangedAppBarTitle) {
        newValue = currentState.value!.copyWith(title: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarHeader) {
        newValue = currentState.value!.copyWith(header: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarIcon) {
        newValue = currentState.value!.copyWith(icon: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarImage) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await memberMediumRepository(appId: appId)!.get(event.value));
        else
          newValue = new AppBarModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 header: currentState.value!.header,
                                 icon: currentState.value!.icon,
                                 image: null,
                                 iconMenu: currentState.value!.iconMenu,
                                 background: currentState.value!.background,
                                 iconColor: currentState.value!.iconColor,
                                 selectedIconColor: currentState.value!.selectedIconColor,
                                 menuBackgroundColor: currentState.value!.menuBackgroundColor,
          );
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarIconMenu) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(iconMenu: await menuDefRepository(appId: appId)!.get(event.value));
        else
          newValue = new AppBarModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 header: currentState.value!.header,
                                 icon: currentState.value!.icon,
                                 image: currentState.value!.image,
                                 iconMenu: null,
                                 background: currentState.value!.background,
                                 iconColor: currentState.value!.iconColor,
                                 selectedIconColor: currentState.value!.selectedIconColor,
                                 menuBackgroundColor: currentState.value!.menuBackgroundColor,
          );
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarBackground) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(background: await backgroundRepository(appId: appId)!.get(event.value));
        else
          newValue = new AppBarModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 header: currentState.value!.header,
                                 icon: currentState.value!.icon,
                                 image: currentState.value!.image,
                                 iconMenu: currentState.value!.iconMenu,
                                 background: null,
                                 iconColor: currentState.value!.iconColor,
                                 selectedIconColor: currentState.value!.selectedIconColor,
                                 menuBackgroundColor: currentState.value!.menuBackgroundColor,
          );
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarIconColor) {
        newValue = currentState.value!.copyWith(iconColor: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarSelectedIconColor) {
        newValue = currentState.value!.copyWith(selectedIconColor: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
      if (event is ChangedAppBarMenuBackgroundColor) {
        newValue = currentState.value!.copyWith(menuBackgroundColor: event.value);
        yield SubmittableAppBarForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDAppBarFormError error(String message, AppBarModel newValue) => DocumentIDAppBarFormError(message: message, value: newValue);

  Future<AppBarFormState> _isDocumentIDValid(String? value, AppBarModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<AppBarModel?> findDocument = appBarRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAppBarForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

