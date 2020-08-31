/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/shadow_repository.dart';
import 'package:eliud_core/model/shadow_list_event.dart';
import 'package:eliud_core/model/shadow_list_state.dart';


class ShadowListBloc extends Bloc<ShadowListEvent, ShadowListState> {
  final ShadowRepository _shadowRepository;
  StreamSubscription _shadowsListSubscription;

  ShadowListBloc({ @required ShadowRepository shadowRepository })
      : assert(shadowRepository != null),
      _shadowRepository = shadowRepository,
      super(ShadowListLoading());

  Stream<ShadowListState> _mapLoadShadowListToState() async* {
    _shadowsListSubscription?.cancel();
    _shadowsListSubscription = _shadowRepository.listen((list) => add(ShadowListUpdated(value: list)));
  }

  Stream<ShadowListState> _mapLoadShadowListWithDetailsToState() async* {
    _shadowsListSubscription?.cancel();
    _shadowsListSubscription = _shadowRepository.listenWithDetails((list) => add(ShadowListUpdated(value: list)));
  }

  Stream<ShadowListState> _mapAddShadowListToState(AddShadowList event) async* {
    _shadowRepository.add(event.value);
  }

  Stream<ShadowListState> _mapUpdateShadowListToState(UpdateShadowList event) async* {
    _shadowRepository.update(event.value);
  }

  Stream<ShadowListState> _mapDeleteShadowListToState(DeleteShadowList event) async* {
    _shadowRepository.delete(event.value);
  }

  Stream<ShadowListState> _mapShadowListUpdatedToState(ShadowListUpdated event) async* {
    yield ShadowListLoaded(values: event.value);
  }


  @override
  Stream<ShadowListState> mapEventToState(ShadowListEvent event) async* {
    final currentState = state;
    if (event is LoadShadowList) {
      yield* _mapLoadShadowListToState();
    } if (event is LoadShadowListWithDetails) {
      yield* _mapLoadShadowListWithDetailsToState();
    } else if (event is AddShadowList) {
      yield* _mapAddShadowListToState(event);
    } else if (event is UpdateShadowList) {
      yield* _mapUpdateShadowListToState(event);
    } else if (event is DeleteShadowList) {
      yield* _mapDeleteShadowListToState(event);
    } else if (event is ShadowListUpdated) {
      yield* _mapShadowListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _shadowsListSubscription?.cancel();
    return super.close();
  }

}


