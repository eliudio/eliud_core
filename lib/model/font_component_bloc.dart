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
  StreamSubscription? _fontSubscription;

  Stream<FontComponentState> _mapLoadFontComponentUpdateToState(String documentId) async* {
    _fontSubscription?.cancel();
    _fontSubscription = fontRepository!.listenTo(documentId, (value) {
      if (value != null) add(FontComponentUpdated(value: value!));
    });
  }

  FontComponentBloc({ this.fontRepository }): super(FontComponentUninitialized());

  @override
  Stream<FontComponentState> mapEventToState(FontComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFontComponent) {
      yield* _mapLoadFontComponentUpdateToState(event.id!);
    } else if (event is FontComponentUpdated) {
      yield FontComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _fontSubscription?.cancel();
    return super.close();
  }

}

