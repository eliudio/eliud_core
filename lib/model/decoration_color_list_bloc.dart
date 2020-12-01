/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/decoration_color_repository.dart';
import 'package:eliud_core/model/decoration_color_list_event.dart';
import 'package:eliud_core/model/decoration_color_list_state.dart';


class DecorationColorListBloc extends Bloc<DecorationColorListEvent, DecorationColorListState> {
  final DecorationColorRepository _decorationColorRepository;
  StreamSubscription _decorationColorsListSubscription;

  DecorationColorListBloc({ @required DecorationColorRepository decorationColorRepository })
      : assert(decorationColorRepository != null),
      _decorationColorRepository = decorationColorRepository,
      super(DecorationColorListLoading());

  Stream<DecorationColorListState> _mapLoadDecorationColorListToState() async* {
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listen( (list) => add(DecorationColorListUpdated(value: list)));
  }

  Stream<DecorationColorListState> _mapLoadDecorationColorListWithDetailsToState() async* {
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listenWithDetails( (list) => add(DecorationColorListUpdated(value: list)));
  }

  Stream<DecorationColorListState> _mapAddDecorationColorListToState(AddDecorationColorList event) async* {
    _decorationColorRepository.add(event.value);
  }

  Stream<DecorationColorListState> _mapUpdateDecorationColorListToState(UpdateDecorationColorList event) async* {
    _decorationColorRepository.update(event.value);
  }

  Stream<DecorationColorListState> _mapDeleteDecorationColorListToState(DeleteDecorationColorList event) async* {
    _decorationColorRepository.delete(event.value);
  }

  Stream<DecorationColorListState> _mapDecorationColorListUpdatedToState(DecorationColorListUpdated event) async* {
    yield DecorationColorListLoaded(values: event.value);
  }


  @override
  Stream<DecorationColorListState> mapEventToState(DecorationColorListEvent event) async* {
    final currentState = state;
    if (event is LoadDecorationColorList) {
      yield* _mapLoadDecorationColorListToState();
    } if (event is LoadDecorationColorListWithDetails) {
      yield* _mapLoadDecorationColorListWithDetailsToState();
    } else if (event is AddDecorationColorList) {
      yield* _mapAddDecorationColorListToState(event);
    } else if (event is UpdateDecorationColorList) {
      yield* _mapUpdateDecorationColorListToState(event);
    } else if (event is DeleteDecorationColorList) {
      yield* _mapDeleteDecorationColorListToState(event);
    } else if (event is DecorationColorListUpdated) {
      yield* _mapDecorationColorListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _decorationColorsListSubscription?.cancel();
    return super.close();
  }

}


