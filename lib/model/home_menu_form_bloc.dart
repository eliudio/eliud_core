/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
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

import 'package:eliud_core/model/home_menu_form_event.dart';
import 'package:eliud_core/model/home_menu_form_state.dart';
import 'package:eliud_core/model/home_menu_repository.dart';

class HomeMenuFormBloc extends Bloc<HomeMenuFormEvent, HomeMenuFormState> {
  final FormAction? formAction;
  final String? appId;

  HomeMenuFormBloc(this.appId, { this.formAction }): super(HomeMenuFormUninitialized());
  @override
  Stream<HomeMenuFormState> mapEventToState(HomeMenuFormEvent event) async* {
    final currentState = state;
    if (currentState is HomeMenuFormUninitialized) {
      if (event is InitialiseNewHomeMenuFormEvent) {
        HomeMenuFormLoaded loaded = HomeMenuFormLoaded(value: HomeMenuModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 name: "Name", 
                                 iconColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 
                                 popupMenuBackgroundColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00), 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseHomeMenuFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        HomeMenuFormLoaded loaded = HomeMenuFormLoaded(value: await homeMenuRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseHomeMenuFormNoLoadEvent) {
        HomeMenuFormLoaded loaded = HomeMenuFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is HomeMenuFormInitialized) {
      HomeMenuModel? newValue = null;
      if (event is ChangedHomeMenuDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableHomeMenuForm(value: newValue);
        }

        return;
      }
      if (event is ChangedHomeMenuName) {
        newValue = currentState.value!.copyWith(name: event.value);
        if (!_isNameValid(event.value)) {
          yield NameHomeMenuFormError(message: "Invalid value", value: newValue);
        } else {
          yield SubmittableHomeMenuForm(value: newValue);
        }

        return;
      }
      if (event is ChangedHomeMenuMenu) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(menu: await menuDefRepository(appId: appId)!.get(event.value));
        else
          newValue = new HomeMenuModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 name: currentState.value!.name,
                                 menu: null,
                                 iconColorOverride: currentState.value!.iconColorOverride,
                                 backgroundOverride: currentState.value!.backgroundOverride,
                                 popupMenuBackgroundColorOverride: currentState.value!.popupMenuBackgroundColorOverride,
          );
        yield SubmittableHomeMenuForm(value: newValue);

        return;
      }
      if (event is ChangedHomeMenuIconColorOverride) {
        newValue = currentState.value!.copyWith(iconColorOverride: event.value);
        yield SubmittableHomeMenuForm(value: newValue);

        return;
      }
      if (event is ChangedHomeMenuBackgroundOverride) {
        newValue = currentState.value!.copyWith(backgroundOverride: event.value);
        yield SubmittableHomeMenuForm(value: newValue);

        return;
      }
      if (event is ChangedHomeMenuPopupMenuBackgroundColorOverride) {
        newValue = currentState.value!.copyWith(popupMenuBackgroundColorOverride: event.value);
        yield SubmittableHomeMenuForm(value: newValue);

        return;
      }
    }
  }

  bool _isNameValid(String? value) {
    // This could be written in 1 line. However, this is to illustrate how to write multiple lines of code
    if (value!.length == 0) {
      return false;
    } else {
      return true;
    }

  }

  DocumentIDHomeMenuFormError error(String message, HomeMenuModel newValue) => DocumentIDHomeMenuFormError(message: message, value: newValue);

  Future<HomeMenuFormState> _isDocumentIDValid(String? value, HomeMenuModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<HomeMenuModel?> findDocument = homeMenuRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableHomeMenuForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

