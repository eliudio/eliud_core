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

import 'font_model.dart';
import 'font_component_event.dart';
import 'font_component_state.dart';
import 'font_repository.dart';
class FontBloc extends Bloc<FontEvent, FontState> {
  final FontRepository fontRepository;

  FontBloc({ this.fontRepository }): super(FontUninitialized());
  @override
  Stream<FontState> mapEventToState(FontEvent event) async* {
    final currentState = state;
    if (event is FetchFont) {
      try {
        if (currentState is FontUninitialized) {
          final FontModel model = await _fetchFont(event.id);

          if (model != null) {
            yield FontLoaded(value: model);
          } else {
            String id = event.id;
            yield FontError(message: "Font with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield FontError(message: "Unknown error whilst retrieving Font");
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


