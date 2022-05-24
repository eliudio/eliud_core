/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_form_bloc.dart
                       
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

import 'package:eliud_core/model/menu_def_form_event.dart';
import 'package:eliud_core/model/menu_def_form_state.dart';
import 'package:eliud_core/model/menu_def_repository.dart';

class MenuDefFormBloc extends Bloc<MenuDefFormEvent, MenuDefFormState> {
  final FormAction? formAction;
  final String? appId;

  MenuDefFormBloc(this.appId, { this.formAction }): super(MenuDefFormUninitialized());
  @override
  Stream<MenuDefFormState> mapEventToState(MenuDefFormEvent event) async* {
    final currentState = state;
    if (currentState is MenuDefFormUninitialized) {
      on <InitialiseNewMenuDefFormEvent> ((event, emit) {
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: MenuDefModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 name: "Name", 
                                 menuItems: [],

        ));
        emit(loaded);
      });


      if (event is InitialiseMenuDefFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: await menuDefRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseMenuDefFormNoLoadEvent) {
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is MenuDefFormInitialized) {
      MenuDefModel? newValue = null;
      on <ChangedMenuDefDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMenuDefForm(value: newValue));
        }

      });
      on <ChangedMenuDefName> ((event, emit) async {
        newValue = currentState.value!.copyWith(name: event.value);
        if (!_isNameValid(event.value)) {
          emit(NameMenuDefFormError(message: "Invalid value", value: newValue));
        } else {
          emit(SubmittableMenuDefForm(value: newValue));
        }

      });
      on <ChangedMenuDefMenuItems> ((event, emit) async {
        newValue = currentState.value!.copyWith(menuItems: event.value);
        emit(SubmittableMenuDefForm(value: newValue));

      });
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

  DocumentIDMenuDefFormError error(String message, MenuDefModel newValue) => DocumentIDMenuDefFormError(message: message, value: newValue);

  Future<MenuDefFormState> _isDocumentIDValid(String? value, MenuDefModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<MenuDefModel?> findDocument = menuDefRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMenuDefForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

