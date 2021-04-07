/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_form_bloc.dart
                       
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

import 'package:eliud_core/model/pos_size_form_event.dart';
import 'package:eliud_core/model/pos_size_form_state.dart';
import 'package:eliud_core/model/pos_size_repository.dart';

class PosSizeFormBloc extends Bloc<PosSizeFormEvent, PosSizeFormState> {
  final FormAction? formAction;
  final String? appId;

  PosSizeFormBloc(this.appId, { this.formAction }): super(PosSizeFormUninitialized());
  @override
  Stream<PosSizeFormState> mapEventToState(PosSizeFormEvent event) async* {
    final PosSizeFormState currentState = state;
    if (currentState is PosSizeFormUninitialized) {
      if (event is InitialiseNewPosSizeFormEvent) {
        PosSizeFormLoaded loaded = PosSizeFormLoaded(value: PosSizeModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 widthPortrait: 0.0,
                                 widthLandscape: 0.0,
                                 heightPortrait: 0.0,
                                 heightLandscape: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePosSizeFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PosSizeFormLoaded loaded = PosSizeFormLoaded(value: await posSizeRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePosSizeFormNoLoadEvent) {
        PosSizeFormLoaded loaded = PosSizeFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PosSizeFormInitialized) {
      PosSizeModel? newValue = null;
      if (event is ChangedPosSizeDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePosSizeForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPosSizeName) {
        newValue = currentState.value!.copyWith(name: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeWidthPortrait) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(widthPortrait: double.parse(event.value!));
          yield SubmittablePosSizeForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(widthPortrait: 0.0);
          yield WidthPortraitPosSizeFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedPosSizeWidthTypePortrait) {
        newValue = currentState.value!.copyWith(widthTypePortrait: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeWidthLandscape) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(widthLandscape: double.parse(event.value!));
          yield SubmittablePosSizeForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(widthLandscape: 0.0);
          yield WidthLandscapePosSizeFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedPosSizeWidthTypeLandscape) {
        newValue = currentState.value!.copyWith(widthTypeLandscape: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeHeightPortrait) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(heightPortrait: double.parse(event.value!));
          yield SubmittablePosSizeForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(heightPortrait: 0.0);
          yield HeightPortraitPosSizeFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedPosSizeHeightTypePortrait) {
        newValue = currentState.value!.copyWith(heightTypePortrait: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeHeightLandscape) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(heightLandscape: double.parse(event.value!));
          yield SubmittablePosSizeForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(heightLandscape: 0.0);
          yield HeightLandscapePosSizeFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedPosSizeHeightTypeLandscape) {
        newValue = currentState.value!.copyWith(heightTypeLandscape: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeFitPortrait) {
        newValue = currentState.value!.copyWith(fitPortrait: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeFitLandscape) {
        newValue = currentState.value!.copyWith(fitLandscape: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeAlignTypePortrait) {
        newValue = currentState.value!.copyWith(alignTypePortrait: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeAlignTypeLandscape) {
        newValue = currentState.value!.copyWith(alignTypeLandscape: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
      if (event is ChangedPosSizeClip) {
        newValue = currentState.value!.copyWith(clip: event.value);
        yield SubmittablePosSizeForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPosSizeFormError error(String message, PosSizeModel newValue) => DocumentIDPosSizeFormError(message: message, value: newValue);

  Future<PosSizeFormState> _isDocumentIDValid(String? value, PosSizeModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PosSizeModel?> findDocument = posSizeRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePosSizeForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

