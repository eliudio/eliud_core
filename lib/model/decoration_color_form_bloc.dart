/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_form_bloc.dart
                       
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

import 'package:eliud_core/model/decoration_color_form_event.dart';
import 'package:eliud_core/model/decoration_color_form_state.dart';
import 'package:eliud_core/model/decoration_color_repository.dart';

class DecorationColorFormBloc extends Bloc<DecorationColorFormEvent, DecorationColorFormState> {
  final String? appId;

  DecorationColorFormBloc(this.appId, ): super(DecorationColorFormUninitialized());
  @override
  Stream<DecorationColorFormState> mapEventToState(DecorationColorFormEvent event) async* {
    final DecorationColorFormState currentState = state;
    if (currentState is DecorationColorFormUninitialized) {
      if (event is InitialiseNewDecorationColorFormEvent) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: DecorationColorModel(
                                               documentID: "IDENTIFIER", 
                                 color: RgbModel(r: 64, g: 6, b: 64, opacity: 1.00), 
                                 stop: 0.1, 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDecorationColorFormEvent) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseDecorationColorFormNoLoadEvent) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DecorationColorFormInitialized) {
      DecorationColorModel? newValue = null;
      if (event is ChangedDecorationColorColor) {
        newValue = currentState.value!.copyWith(color: event.value);
        yield SubmittableDecorationColorForm(value: newValue);

        return;
      }
      if (event is ChangedDecorationColorStop) {
        if (isDouble(event.value)) {
          newValue = currentState.value!.copyWith(stop: double.parse(event.value!));
          yield SubmittableDecorationColorForm(value: newValue);

        } else {
          newValue = currentState.value!.copyWith(stop: 0.0);
          yield StopDecorationColorFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
    }
  }


}

