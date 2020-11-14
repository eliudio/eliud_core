/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/pos_size_component_event.dart';
import 'package:eliud_core/model/pos_size_component_state.dart';
import 'package:eliud_core/model/pos_size_repository.dart';
class PosSizeComponentBloc extends Bloc<PosSizeComponentEvent, PosSizeComponentState> {
  final PosSizeRepository posSizeRepository;

  PosSizeComponentBloc({ this.posSizeRepository }): super(PosSizeComponentUninitialized());
  @override
  Stream<PosSizeComponentState> mapEventToState(PosSizeComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPosSizeComponent) {
      try {
        if (currentState is PosSizeComponentUninitialized) {
          final PosSizeModel model = await _fetchPosSize(event.id);

          if (model != null) {
            yield PosSizeComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield PosSizeComponentError(message: "PosSize with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PosSizeComponentError(message: "Unknown error whilst retrieving PosSize");
      }
    }
  }

  Future<PosSizeModel> _fetchPosSize(String id) async {
    return posSizeRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


