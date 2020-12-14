/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:eliud_core/model/pos_size_list_event.dart';
import 'package:eliud_core/model/pos_size_list_state.dart';


class PosSizeListBloc extends Bloc<PosSizeListEvent, PosSizeListState> {
  final PosSizeRepository _posSizeRepository;
  StreamSubscription _posSizesListSubscription;

  PosSizeListBloc({ @required PosSizeRepository posSizeRepository })
      : assert(posSizeRepository != null),
      _posSizeRepository = posSizeRepository,
      super(PosSizeListLoading());

  Stream<PosSizeListState> _mapLoadPosSizeListToState({ String orderBy, bool descending }) async* {
    _posSizesListSubscription?.cancel();
    _posSizesListSubscription = _posSizeRepository.listen((list) => add(PosSizeListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<PosSizeListState> _mapLoadPosSizeListWithDetailsToState() async* {
    _posSizesListSubscription?.cancel();
    _posSizesListSubscription = _posSizeRepository.listenWithDetails((list) => add(PosSizeListUpdated(value: list)), );
  }

  Stream<PosSizeListState> _mapAddPosSizeListToState(AddPosSizeList event) async* {
    _posSizeRepository.add(event.value);
  }

  Stream<PosSizeListState> _mapUpdatePosSizeListToState(UpdatePosSizeList event) async* {
    _posSizeRepository.update(event.value);
  }

  Stream<PosSizeListState> _mapDeletePosSizeListToState(DeletePosSizeList event) async* {
    _posSizeRepository.delete(event.value);
  }

  Stream<PosSizeListState> _mapPosSizeListUpdatedToState(PosSizeListUpdated event) async* {
    yield PosSizeListLoaded(values: event.value);
  }


  @override
  Stream<PosSizeListState> mapEventToState(PosSizeListEvent event) async* {
    final currentState = state;
    if (event is LoadPosSizeList) {
      yield* _mapLoadPosSizeListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadPosSizeListWithDetails) {
      yield* _mapLoadPosSizeListWithDetailsToState();
    } else if (event is AddPosSizeList) {
      yield* _mapAddPosSizeListToState(event);
    } else if (event is UpdatePosSizeList) {
      yield* _mapUpdatePosSizeListToState(event);
    } else if (event is DeletePosSizeList) {
      yield* _mapDeletePosSizeListToState(event);
    } else if (event is PosSizeListUpdated) {
      yield* _mapPosSizeListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _posSizesListSubscription?.cancel();
    return super.close();
  }

}


