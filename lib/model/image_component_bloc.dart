/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/image_component_event.dart';
import 'package:eliud_core/model/image_component_state.dart';
import 'package:eliud_core/model/image_repository.dart';
import 'package:flutter/services.dart';

class ImageComponentBloc extends Bloc<ImageComponentEvent, ImageComponentState> {
  final ImageRepository imageRepository;

  ImageComponentBloc({ this.imageRepository }): super(ImageComponentUninitialized());
  @override
  Stream<ImageComponentState> mapEventToState(ImageComponentEvent event) async* {
    final currentState = state;
    if (event is FetchImageComponent) {
      try {
        if (currentState is ImageComponentUninitialized) {
          bool permissionDenied = false;
          final model = await imageRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield ImageComponentPermissionDenied();
          } else {
            if (model != null) {
              yield ImageComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield ImageComponentError(
                  message: "Image with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield ImageComponentError(message: "Unknown error whilst retrieving Image");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

