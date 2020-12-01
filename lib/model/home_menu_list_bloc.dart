/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/home_menu_repository.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';
import 'package:eliud_core/model/home_menu_list_state.dart';


class HomeMenuListBloc extends Bloc<HomeMenuListEvent, HomeMenuListState> {
  final HomeMenuRepository _homeMenuRepository;
  StreamSubscription _homeMenusListSubscription;

  HomeMenuListBloc({ @required HomeMenuRepository homeMenuRepository })
      : assert(homeMenuRepository != null),
      _homeMenuRepository = homeMenuRepository,
      super(HomeMenuListLoading());

  Stream<HomeMenuListState> _mapLoadHomeMenuListToState() async* {
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listen( (list) => add(HomeMenuListUpdated(value: list)));
  }

  Stream<HomeMenuListState> _mapLoadHomeMenuListWithDetailsToState() async* {
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listenWithDetails( (list) => add(HomeMenuListUpdated(value: list)));
  }

  Stream<HomeMenuListState> _mapAddHomeMenuListToState(AddHomeMenuList event) async* {
    _homeMenuRepository.add(event.value);
  }

  Stream<HomeMenuListState> _mapUpdateHomeMenuListToState(UpdateHomeMenuList event) async* {
    _homeMenuRepository.update(event.value);
  }

  Stream<HomeMenuListState> _mapDeleteHomeMenuListToState(DeleteHomeMenuList event) async* {
    _homeMenuRepository.delete(event.value);
  }

  Stream<HomeMenuListState> _mapHomeMenuListUpdatedToState(HomeMenuListUpdated event) async* {
    yield HomeMenuListLoaded(values: event.value);
  }


  @override
  Stream<HomeMenuListState> mapEventToState(HomeMenuListEvent event) async* {
    final currentState = state;
    if (event is LoadHomeMenuList) {
      yield* _mapLoadHomeMenuListToState();
    } if (event is LoadHomeMenuListWithDetails) {
      yield* _mapLoadHomeMenuListWithDetailsToState();
    } else if (event is AddHomeMenuList) {
      yield* _mapAddHomeMenuListToState(event);
    } else if (event is UpdateHomeMenuList) {
      yield* _mapUpdateHomeMenuListToState(event);
    } else if (event is DeleteHomeMenuList) {
      yield* _mapDeleteHomeMenuListToState(event);
    } else if (event is HomeMenuListUpdated) {
      yield* _mapHomeMenuListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _homeMenusListSubscription?.cancel();
    return super.close();
  }

}


