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

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/dialog_form_event.dart';
import 'package:eliud_core/model/dialog_form_state.dart';

class DialogFormBloc extends Bloc<DialogFormEvent, DialogFormState> {
  final FormAction? formAction;
  final String? appId;

  DialogFormBloc(this.appId, {this.formAction})
      : super(DialogFormUninitialized()) {
    on<InitialiseNewDialogFormEvent>((event, emit) {
      DialogFormLoaded loaded = DialogFormLoaded(
          value: DialogModel(
        documentID: "",
        appId: "",
        title: "",
        description: "",
        bodyComponents: [],
      ));
      emit(loaded);
    });

    on<InitialiseDialogFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      DialogFormLoaded loaded = DialogFormLoaded(
          value: await dialogRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseDialogFormNoLoadEvent>((event, emit) async {
      DialogFormLoaded loaded = DialogFormLoaded(value: event.value);
      emit(loaded);
    });
    DialogModel? newValue;
    on<ChangedDialogDocumentID>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDialogForm(value: newValue));
        }
      }
    });
    on<ChangedDialogTitle>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogDescription>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogBodyComponents>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogBackgroundOverride>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue =
            currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogLayout>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(layout: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogIncludeHeading>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(includeHeading: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogGridView>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              gridView:
                  await gridViewRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableDialogForm(value: newValue));
      }
    });
    on<ChangedDialogConditions>((event, emit) async {
      if (state is DialogFormInitialized) {
        final currentState = state as DialogFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDialogForm(value: newValue));
      }
    });
  }

  DocumentIDDialogFormError error(String message, DialogModel newValue) =>
      DocumentIDDialogFormError(message: message, value: newValue);

  Future<DialogFormState> _isDocumentIDValid(
      String? value, DialogModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<DialogModel?> findDocument =
        dialogRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDialogForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
