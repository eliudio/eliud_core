/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core/tools/enums.dart';


import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';

import 'package:eliud_core/model/grid_view_form_event.dart';
import 'package:eliud_core/model/grid_view_form_state.dart';

class GridViewFormBloc extends Bloc<GridViewFormEvent, GridViewFormState> {
  final FormAction? formAction;
  final String? appId;

  GridViewFormBloc(this.appId, { this.formAction }): super(GridViewFormUninitialized()) {
      on <InitialiseNewGridViewFormEvent> ((event, emit) {
        GridViewFormLoaded loaded = GridViewFormLoaded(value: GridViewModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 crossAxisCount: 0,
                                 absoluteMaxCrossAxisExtent: 0.0,
                                 relativeMaxCrossAxisExtent: 0.0,
                                 childAspectRatio: 0.0,
                                 padding: 0.0,
                                 mainAxisSpacing: 0.0,
                                 crossAxisSpacing: 0.0,

        ));
        emit(loaded);
      });


      on <InitialiseGridViewFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        GridViewFormLoaded loaded = GridViewFormLoaded(value: await gridViewRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseGridViewFormNoLoadEvent> ((event, emit) async {
        GridViewFormLoaded loaded = GridViewFormLoaded(value: event.value);
        emit(loaded);
      });
      GridViewModel? newValue = null;
      on <ChangedGridViewDocumentID> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableGridViewForm(value: newValue));
        }

      }
      });
      on <ChangedGridViewName> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableGridViewForm(value: newValue));

      }
      });
      on <ChangedGridViewScrollDirection> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(scrollDirection: event.value);
        emit(SubmittableGridViewForm(value: newValue));

      }
      });
      on <ChangedGridViewType> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(type: event.value);
        emit(SubmittableGridViewForm(value: newValue));

      }
      });
      on <ChangedGridViewCrossAxisCount> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(crossAxisCount: int.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(crossAxisCount: 0);
          emit(CrossAxisCountGridViewFormError(message: "Value should be a number", value: newValue));
        }
      }
      });
      on <ChangedGridViewMaxCrossAxisExtentType> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(maxCrossAxisExtentType: event.value);
        emit(SubmittableGridViewForm(value: newValue));

      }
      });
      on <ChangedGridViewAbsoluteMaxCrossAxisExtent> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(absoluteMaxCrossAxisExtent: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(absoluteMaxCrossAxisExtent: 0.0);
          emit(AbsoluteMaxCrossAxisExtentGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewRelativeMaxCrossAxisExtent> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(relativeMaxCrossAxisExtent: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(relativeMaxCrossAxisExtent: 0.0);
          emit(RelativeMaxCrossAxisExtentGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewChildAspectRatio> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(childAspectRatio: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(childAspectRatio: 0.0);
          emit(ChildAspectRatioGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewPadding> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(padding: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(padding: 0.0);
          emit(PaddingGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewMainAxisSpacing> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(mainAxisSpacing: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(mainAxisSpacing: 0.0);
          emit(MainAxisSpacingGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewCrossAxisSpacing> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(crossAxisSpacing: double.parse(event.value!));
          emit(SubmittableGridViewForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(crossAxisSpacing: 0.0);
          emit(CrossAxisSpacingGridViewFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedGridViewConditions> ((event, emit) async {
      if (state is GridViewFormInitialized) {
        final currentState = state as GridViewFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableGridViewForm(value: newValue));

      }
      });
  }


  DocumentIDGridViewFormError error(String message, GridViewModel newValue) => DocumentIDGridViewFormError(message: message, value: newValue);

  Future<GridViewFormState> _isDocumentIDValid(String? value, GridViewModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<GridViewModel?> findDocument = gridViewRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableGridViewForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

