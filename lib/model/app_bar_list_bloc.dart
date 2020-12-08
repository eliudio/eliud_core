/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_bar_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_bar_repository.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';
import 'package:eliud_core/model/app_bar_list_state.dart';


class AppBarListBloc extends Bloc<AppBarListEvent, AppBarListState> {
  final AppBarRepository _appBarRepository;
  StreamSubscription _appBarsListSubscription;

  AppBarListBloc({ @required AppBarRepository appBarRepository })
      : assert(appBarRepository != null),
      _appBarRepository = appBarRepository,
      super(AppBarListLoading());

  Stream<AppBarListState> _mapLoadAppBarListToState({ String orderBy, bool descending }) async* {
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listen( (list) => add(AppBarListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<AppBarListState> _mapLoadAppBarListWithDetailsToState() async* {
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listenWithDetails( (list) => add(AppBarListUpdated(value: list)));
  }

  Stream<AppBarListState> _mapAddAppBarListToState(AddAppBarList event) async* {
    _appBarRepository.add(event.value);
  }

  Stream<AppBarListState> _mapUpdateAppBarListToState(UpdateAppBarList event) async* {
    _appBarRepository.update(event.value);
  }

  Stream<AppBarListState> _mapDeleteAppBarListToState(DeleteAppBarList event) async* {
    _appBarRepository.delete(event.value);
  }

  Stream<AppBarListState> _mapAppBarListUpdatedToState(AppBarListUpdated event) async* {
    yield AppBarListLoaded(values: event.value);
  }


  @override
  Stream<AppBarListState> mapEventToState(AppBarListEvent event) async* {
    final currentState = state;
    if (event is LoadAppBarList) {
      yield* _mapLoadAppBarListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAppBarListWithDetails) {
      yield* _mapLoadAppBarListWithDetailsToState();
    } else if (event is AddAppBarList) {
      yield* _mapAddAppBarListToState(event);
    } else if (event is UpdateAppBarList) {
      yield* _mapUpdateAppBarListToState(event);
    } else if (event is DeleteAppBarList) {
      yield* _mapDeleteAppBarListToState(event);
    } else if (event is AppBarListUpdated) {
      yield* _mapAppBarListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appBarsListSubscription?.cancel();
    return super.close();
  }

}


