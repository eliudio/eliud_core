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

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/menu_def_form_event.dart';
import 'package:eliud_core/model/menu_def_form_state.dart';

class MenuDefFormBloc extends Bloc<MenuDefFormEvent, MenuDefFormState> {
  final FormAction? formAction;
  final String? appId;

  MenuDefFormBloc(this.appId, { this.formAction }): super(MenuDefFormUninitialized()) {
      on <InitialiseNewMenuDefFormEvent> ((event, emit) {
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: MenuDefModel(
                                               documentID: "IDENTIFIER", 
                                 appId: "",
                                 name: "Name", 
                                 menuItems: [],

        ));
        emit(loaded);
      });


      on <InitialiseMenuDefFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: await menuDefRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseMenuDefFormNoLoadEvent> ((event, emit) async {
        MenuDefFormLoaded loaded = MenuDefFormLoaded(value: event.value);
        emit(loaded);
      });
      MenuDefModel? newValue = null;
      on <ChangedMenuDefDocumentID> ((event, emit) async {
      if (state is MenuDefFormInitialized) {
        final currentState = state as MenuDefFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMenuDefForm(value: newValue));
        }

      }
      });
      on <ChangedMenuDefName> ((event, emit) async {
      if (state is MenuDefFormInitialized) {
        final currentState = state as MenuDefFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        if (!_isNameValid(event.value)) {
          emit(NameMenuDefFormError(message: "Invalid value", value: newValue));
        } else {
          emit(SubmittableMenuDefForm(value: newValue));
        }

      }
      });
      on <ChangedMenuDefMenuItems> ((event, emit) async {
      if (state is MenuDefFormInitialized) {
        final currentState = state as MenuDefFormInitialized;
        newValue = currentState.value!.copyWith(menuItems: event.value);
        emit(SubmittableMenuDefForm(value: newValue));

      }
      });
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

