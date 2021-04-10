/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_form_bloc.dart
                       
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

import 'package:eliud_core/model/shadow_form_event.dart';
import 'package:eliud_core/model/shadow_form_state.dart';
import 'package:eliud_core/model/shadow_repository.dart';

class ShadowFormBloc extends Bloc<ShadowFormEvent, ShadowFormState> {
  final FormAction? formAction;
  final String? appId;

  ShadowFormBloc(this.appId, { this.formAction }): super(ShadowFormUninitialized());
  @override
  Stream<ShadowFormState> mapEventToState(ShadowFormEvent event) async* {
    final currentState = state;
    if (currentState is ShadowFormUninitialized) {
      if (event is InitialiseNewShadowFormEvent) {
        ShadowFormLoaded loaded = ShadowFormLoaded(value: ShadowModel(
                                               documentID: "",
                                 appId: "",
                                 comments: "",
                                 color: RgbModel(r: 211, g: 211, b: 211, opacity: 0.50), 
                                 offsetDX: 0.0,
                                 offsetDY: 0.0,
                                 spreadRadius: 0.0,
                                 blurRadius: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseShadowFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        ShadowFormLoaded loaded = ShadowFormLoaded(value: await shadowRepository(appId: appId)!.get(event!.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseShadowFormNoLoadEvent) {
        ShadowFormLoaded loaded = ShadowFormLoaded(value: event!.value);
        yield loaded;
        return;
      }
    } else if (currentState is ShadowFormInitialized) {
      ShadowModel? newValue = null;
      if (event is ChangedShadowDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event!.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event!.value, newValue).asStream();
        } else {
          yield SubmittableShadowForm(value: newValue);
        }

        return;
      }
      if (event is ChangedShadowComments) {
        newValue = currentState.value!.copyWith(comments: event!.value);
        yield SubmittableShadowForm(value: newValue);

        return;
      }
      if (event is ChangedShadowColor) {
        newValue = currentState.value!.copyWith(color: event!.value);
        yield SubmittableShadowForm(value: newValue);

        return;
      }
      if (event is ChangedShadowOffsetDX) {
        if (isDouble(event!.value!)) {
          newValue = currentState.value!.copyWith(offsetDX: double.parse(event!.value!));
          yield SubmittableShadowForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(offsetDX: 0.0);
          yield OffsetDXShadowFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShadowOffsetDY) {
        if (isDouble(event!.value!)) {
          newValue = currentState.value!.copyWith(offsetDY: double.parse(event!.value!));
          yield SubmittableShadowForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(offsetDY: 0.0);
          yield OffsetDYShadowFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShadowSpreadRadius) {
        if (isDouble(event!.value!)) {
          newValue = currentState.value!.copyWith(spreadRadius: double.parse(event!.value!));
          yield SubmittableShadowForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(spreadRadius: 0.0);
          yield SpreadRadiusShadowFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedShadowBlurRadius) {
        if (isDouble(event!.value!)) {
          newValue = currentState.value!.copyWith(blurRadius: double.parse(event!.value!));
          yield SubmittableShadowForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(blurRadius: 0.0);
          yield BlurRadiusShadowFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
    }
  }


  DocumentIDShadowFormError error(String message, ShadowModel newValue) => DocumentIDShadowFormError(message: message, value: newValue);

  Future<ShadowFormState> _isDocumentIDValid(String? value, ShadowModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<ShadowModel?> findDocument = shadowRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableShadowForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

