/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/body_component_form_event.dart';
import 'package:eliud_core/model/body_component_form_state.dart';
import 'package:eliud_core/model/body_component_repository.dart';

class BodyComponentFormBloc extends Bloc<BodyComponentFormEvent, BodyComponentFormState> {

  BodyComponentFormBloc(): super(BodyComponentFormUninitialized());
  @override
  Stream<BodyComponentFormState> mapEventToState(BodyComponentFormEvent event) async* {
    final currentState = state;
    if (currentState is BodyComponentFormUninitialized) {
      if (event is InitialiseNewBodyComponentFormEvent) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: BodyComponentModel(
                                               documentID: "IDENTIFIER", 
                                 componentName: "",
                                 componentId: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseBodyComponentFormEvent) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseBodyComponentFormNoLoadEvent) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is BodyComponentFormInitialized) {
      BodyComponentModel newValue = null;
      if (event is ChangedBodyComponentComponentName) {
        newValue = currentState.value.copyWith(componentName: event.value);
        yield SubmittableBodyComponentForm(value: newValue);

        return;
      }
      if (event is ChangedBodyComponentComponentId) {
        newValue = currentState.value.copyWith(componentId: event.value);
        yield SubmittableBodyComponentForm(value: newValue);

        return;
      }
    }
  }


}

