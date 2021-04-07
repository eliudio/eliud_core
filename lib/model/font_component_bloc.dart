/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/font_component_event.dart';
import 'package:eliud_core/model/font_component_state.dart';
import 'package:eliud_core/model/font_repository.dart';
import 'package:flutter/services.dart';

class FontComponentBloc extends Bloc<FontComponentEvent, FontComponentState> {
  final FontRepository? fontRepository;

  FontComponentBloc({ this.fontRepository }): super(FontComponentUninitialized());
  @override
  Stream<FontComponentState> mapEventToState(FontComponentEvent event) async* {
    final FontComponentState currentState = state;
    if (event is FetchFontComponent) {
      try {
        if (currentState is FontComponentUninitialized) {
          bool permissionDenied = false;
          final model = await fontRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield FontComponentPermissionDenied();
          } else {
            if (model != null) {
              yield FontComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield FontComponentError(
                  message: "Font with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield FontComponentError(message: "Unknown error whilst retrieving Font");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

