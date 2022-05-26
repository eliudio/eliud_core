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
import 'package:eliud_core/model/decoration_color_form_event.dart';
import 'package:eliud_core/model/decoration_color_form_state.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/string_validator.dart';

class DecorationColorFormBloc extends Bloc<DecorationColorFormEvent, DecorationColorFormState> {
  final String? appId;

  DecorationColorFormBloc(this.appId, ): super(DecorationColorFormUninitialized());
  @override
  Stream<DecorationColorFormState> mapEventToState(DecorationColorFormEvent event) async* {
    final currentState = state;
    if (currentState is DecorationColorFormUninitialized) {
      on <InitialiseNewDecorationColorFormEvent> ((event, emit) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: DecorationColorModel(
                                               documentID: "IDENTIFIER", 
                                 color: RgbModel(r: 64, g: 6, b: 64, opacity: 1.00), 
                                 stop: 0.1, 

        ));
        emit(loaded);
      });


      if (event is InitialiseDecorationColorFormEvent) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseDecorationColorFormNoLoadEvent) {
        DecorationColorFormLoaded loaded = DecorationColorFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is DecorationColorFormInitialized) {
      DecorationColorModel? newValue = null;
      on <ChangedDecorationColorColor> ((event, emit) async {
        newValue = currentState.value!.copyWith(color: event.value);
        emit(SubmittableDecorationColorForm(value: newValue));

      });
      on <ChangedDecorationColorStop> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(stop: double.parse(event.value!));
          emit(SubmittableDecorationColorForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(stop: 0.0);
          emit(StopDecorationColorFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
    }
  }


}

