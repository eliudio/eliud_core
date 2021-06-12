/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_component_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_component_state.dart';
import 'package:eliud_core/model/eliud_style_attributes_repository.dart';
import 'package:flutter/services.dart';


class EliudStyleAttributesComponentBloc extends Bloc<EliudStyleAttributesComponentEvent, EliudStyleAttributesComponentState> {
  final EliudStyleAttributesRepository? eliudStyleAttributesRepository;

  EliudStyleAttributesComponentBloc({ this.eliudStyleAttributesRepository }): super(EliudStyleAttributesComponentUninitialized());
  @override
  Stream<EliudStyleAttributesComponentState> mapEventToState(EliudStyleAttributesComponentEvent event) async* {
    final currentState = state;
    if (event is FetchEliudStyleAttributesComponent) {
      try {
        if (currentState is EliudStyleAttributesComponentUninitialized) {
          bool permissionDenied = false;
          final model = await eliudStyleAttributesRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield EliudStyleAttributesComponentPermissionDenied();
          } else {
            if (model != null) {
              yield EliudStyleAttributesComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield EliudStyleAttributesComponentError(
                  message: "EliudStyleAttributes with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield EliudStyleAttributesComponentError(message: "Unknown error whilst retrieving EliudStyleAttributes");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

