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
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository imageRepository;

  ImageBloc({ this.imageRepository }): super(ImageUninitialized());
  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    final currentState = state;
    if (event is FetchImage) {
      try {
        if (currentState is ImageUninitialized) {
          final ImageModel model = await _fetchImage(event.id);

          if (model != null) {
            yield ImageLoaded(value: model);
          } else {
            String id = event.id;
            yield ImageError(message: "Image with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield ImageError(message: "Unknown error whilst retrieving Image");
      }
    }
  }

  Future<ImageModel> _fetchImage(String id) async {
    return imageRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


