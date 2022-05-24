/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dialog_form_bloc.dart
                       
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

import 'package:eliud_core/model/dialog_form_event.dart';
import 'package:eliud_core/model/dialog_form_state.dart';
import 'package:eliud_core/model/dialog_repository.dart';

class DialogFormBloc extends Bloc<DialogFormEvent, DialogFormState> {
  final FormAction? formAction;
  final String? appId;

  DialogFormBloc(this.appId, { this.formAction }): super(DialogFormUninitialized());
  @override
  Stream<DialogFormState> mapEventToState(DialogFormEvent event) async* {
    final currentState = state;
    if (currentState is DialogFormUninitialized) {
      on <InitialiseNewDialogFormEvent> ((event, emit) {
        DialogFormLoaded loaded = DialogFormLoaded(value: DialogModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 bodyComponents: [],

        ));
        emit(loaded);
      });


      if (event is InitialiseDialogFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DialogFormLoaded loaded = DialogFormLoaded(value: await dialogRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseDialogFormNoLoadEvent) {
        DialogFormLoaded loaded = DialogFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is DialogFormInitialized) {
      DialogModel? newValue = null;
      on <ChangedDialogDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDialogForm(value: newValue));
        }

      });
      on <ChangedDialogTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogBodyComponents> ((event, emit) async {
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogBackgroundOverride> ((event, emit) async {
        newValue = currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogLayout> ((event, emit) async {
        newValue = currentState.value!.copyWith(layout: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogIncludeHeading> ((event, emit) async {
        newValue = currentState.value!.copyWith(includeHeading: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogGridView> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(gridView: await gridViewRepository(appId: appId)!.get(event.value));
        emit(SubmittableDialogForm(value: newValue));

      });
      on <ChangedDialogConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDialogForm(value: newValue));

      });
    }
  }


  DocumentIDDialogFormError error(String message, DialogModel newValue) => DocumentIDDialogFormError(message: message, value: newValue);

  Future<DialogFormState> _isDocumentIDValid(String? value, DialogModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DialogModel?> findDocument = dialogRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDialogForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

