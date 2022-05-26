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
import 'package:eliud_core/model/body_component_form_event.dart';
import 'package:eliud_core/model/body_component_form_state.dart';
import 'package:eliud_core/model/model_export.dart';

class BodyComponentFormBloc extends Bloc<BodyComponentFormEvent, BodyComponentFormState> {
  final String? appId;

  BodyComponentFormBloc(this.appId, ): super(BodyComponentFormUninitialized());
  @override
  Stream<BodyComponentFormState> mapEventToState(BodyComponentFormEvent event) async* {
    final currentState = state;
    if (currentState is BodyComponentFormUninitialized) {
      on <InitialiseNewBodyComponentFormEvent> ((event, emit) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: BodyComponentModel(
                                               documentID: "IDENTIFIER", 
                                 componentName: "",
                                 componentId: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseBodyComponentFormEvent) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseBodyComponentFormNoLoadEvent) {
        BodyComponentFormLoaded loaded = BodyComponentFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is BodyComponentFormInitialized) {
      BodyComponentModel? newValue = null;
      on <ChangedBodyComponentComponentName> ((event, emit) async {
        newValue = currentState.value!.copyWith(componentName: event.value);
        emit(SubmittableBodyComponentForm(value: newValue));

      });
      on <ChangedBodyComponentComponentId> ((event, emit) async {
        newValue = currentState.value!.copyWith(componentId: event.value);
        emit(SubmittableBodyComponentForm(value: newValue));

      });
    }
  }


}

