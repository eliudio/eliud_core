/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 background_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/background_repository.dart';
import 'package:eliud_core/model/background_list_event.dart';
import 'package:eliud_core/model/background_list_state.dart';


class BackgroundListBloc extends Bloc<BackgroundListEvent, BackgroundListState> {
  final BackgroundRepository _backgroundRepository;
  StreamSubscription _backgroundsListSubscription;

  BackgroundListBloc({ @required BackgroundRepository backgroundRepository })
      : assert(backgroundRepository != null),
      _backgroundRepository = backgroundRepository,
      super(BackgroundListLoading());

  Stream<BackgroundListState> _mapLoadBackgroundListToState({ String orderBy, bool descending }) async* {
    _backgroundsListSubscription?.cancel();
    _backgroundsListSubscription = _backgroundRepository.listen((list) => add(BackgroundListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<BackgroundListState> _mapLoadBackgroundListWithDetailsToState() async* {
    _backgroundsListSubscription?.cancel();
    _backgroundsListSubscription = _backgroundRepository.listenWithDetails((list) => add(BackgroundListUpdated(value: list)), );
  }

  Stream<BackgroundListState> _mapAddBackgroundListToState(AddBackgroundList event) async* {
    _backgroundRepository.add(event.value);
  }

  Stream<BackgroundListState> _mapUpdateBackgroundListToState(UpdateBackgroundList event) async* {
    _backgroundRepository.update(event.value);
  }

  Stream<BackgroundListState> _mapDeleteBackgroundListToState(DeleteBackgroundList event) async* {
    _backgroundRepository.delete(event.value);
  }

  Stream<BackgroundListState> _mapBackgroundListUpdatedToState(BackgroundListUpdated event) async* {
    yield BackgroundListLoaded(values: event.value);
  }


  @override
  Stream<BackgroundListState> mapEventToState(BackgroundListEvent event) async* {
    final currentState = state;
    if (event is LoadBackgroundList) {
      yield* _mapLoadBackgroundListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadBackgroundListWithDetails) {
      yield* _mapLoadBackgroundListWithDetailsToState();
    } else if (event is AddBackgroundList) {
      yield* _mapAddBackgroundListToState(event);
    } else if (event is UpdateBackgroundList) {
      yield* _mapUpdateBackgroundListToState(event);
    } else if (event is DeleteBackgroundList) {
      yield* _mapDeleteBackgroundListToState(event);
    } else if (event is BackgroundListUpdated) {
      yield* _mapBackgroundListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _backgroundsListSubscription?.cancel();
    return super.close();
  }

}


