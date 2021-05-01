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

import 'package:eliud_core/model/grid_view_form_event.dart';
import 'package:eliud_core/model/grid_view_form_state.dart';
import 'package:eliud_core/model/grid_view_repository.dart';

class GridViewFormBloc extends Bloc<GridViewFormEvent, GridViewFormState> {
  final FormAction? formAction;
  final String? appId;

  GridViewFormBloc(this.appId, { this.formAction }): super(GridViewFormUninitialized());
  @override
  Stream<GridViewFormState> mapEventToState(GridViewFormEvent event) async* {
    final currentState = state;
    if (currentState is GridViewFormUninitialized) {
      if (event is InitialiseNewGridViewFormEvent) {
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
        yield loaded;
        return;

      }


      if (event is InitialiseGridViewFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        GridViewFormLoaded loaded = GridViewFormLoaded(value: await gridViewRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseGridViewFormNoLoadEvent) {
        GridViewFormLoaded loaded = GridViewFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is GridViewFormInitialized) {
      GridViewModel? newValue = null;
      if (event is ChangedGridViewDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableGridViewForm(value: newValue);
        }

        return;
      }
      if (event is ChangedGridViewName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittableGridViewForm(value: newValue);

        return;
      }
      if (event is ChangedGridViewScrollDirection) {
        newValue = currentState.value!.copyWith(scrollDirection: event.value);
        yield SubmittableGridViewForm(value: newValue);

        return;
      }
      if (event is ChangedGridViewType) {
        newValue = currentState.value!.copyWith(type: event.value);
        yield SubmittableGridViewForm(value: newValue);

        return;
      }
      if (event is ChangedGridViewCrossAxisCount) {
        if (isInt(event.value)) {
          newValue = currentState.value!.copyWith(crossAxisCount: int.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(crossAxisCount: 0);
          yield CrossAxisCountGridViewFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewMaxCrossAxisExtentType) {
        newValue = currentState.value!.copyWith(maxCrossAxisExtentType: event.value);
        yield SubmittableGridViewForm(value: newValue);

        return;
      }
      if (event is ChangedGridViewAbsoluteMaxCrossAxisExtent) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(absoluteMaxCrossAxisExtent: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(absoluteMaxCrossAxisExtent: 0.0);
          yield AbsoluteMaxCrossAxisExtentGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewRelativeMaxCrossAxisExtent) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(relativeMaxCrossAxisExtent: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(relativeMaxCrossAxisExtent: 0.0);
          yield RelativeMaxCrossAxisExtentGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewChildAspectRatio) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(childAspectRatio: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(childAspectRatio: 0.0);
          yield ChildAspectRatioGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewPadding) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(padding: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(padding: 0.0);
          yield PaddingGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewMainAxisSpacing) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(mainAxisSpacing: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(mainAxisSpacing: 0.0);
          yield MainAxisSpacingGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewCrossAxisSpacing) {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(crossAxisSpacing: double.parse(event.value!));
          yield SubmittableGridViewForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(crossAxisSpacing: 0.0);
          yield CrossAxisSpacingGridViewFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedGridViewConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableGridViewForm(value: newValue);

        return;
      }
    }
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

