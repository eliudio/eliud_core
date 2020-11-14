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
class FontComponentBloc extends Bloc<FontComponentEvent, FontComponentState> {
  final FontRepository fontRepository;

  FontComponentBloc({ this.fontRepository }): super(FontComponentUninitialized());
  @override
  Stream<FontComponentState> mapEventToState(FontComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFontComponent) {
      try {
        if (currentState is FontComponentUninitialized) {
          final FontModel model = await _fetchFont(event.id);

          if (model != null) {
            yield FontComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield FontComponentError(message: "Font with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield FontComponentError(message: "Unknown error whilst retrieving Font");
      }
    }
  }

  Future<FontModel> _fetchFont(String id) async {
    return fontRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


