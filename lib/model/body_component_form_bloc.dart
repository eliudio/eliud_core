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

import 'package:eliud_core/model/body_component_form_event.dart';
import 'package:eliud_core/model/body_component_form_state.dart';
import 'package:eliud_core/model/body_component_repository.dart';

class BodyComponentFormBloc extends Bloc<BodyComponentFormEvent, BodyComponentFormState> {
  final String? appId;

  BodyComponentFormBloc(this.appId, ): super(BodyComponentFormUninitialized()) {
      on <InitialiseNewBodyComponentFormEvent> ((event, emit) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: BodyComponentModel(
                                               documentID: "IDENTIFIER", 
                                 componentName: "",
                                 componentId: "",

        ));
        emit(loaded);
      });


      on <InitialiseBodyComponentFormEvent> ((event, emit) async {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseBodyComponentFormNoLoadEvent> ((event, emit) async {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        emit(loaded);
      });
      BodyComponentModel? newValue = null;
      on <ChangedBodyComponentComponentName> ((event, emit) async {
      if (state is BodyComponentFormInitialized) {
        final currentState = state as BodyComponentFormInitialized;
        newValue = currentState.value!.copyWith(componentName: event.value);
        emit(SubmittableBodyComponentForm(value: newValue));

      }
      });
      on <ChangedBodyComponentComponentId> ((event, emit) async {
      if (state is BodyComponentFormInitialized) {
        final currentState = state as BodyComponentFormInitialized;
        newValue = currentState.value!.copyWith(componentId: event.value);
        emit(SubmittableBodyComponentForm(value: newValue));

      }
      });
  }


}

