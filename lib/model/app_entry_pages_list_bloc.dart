/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_entry_pages_repository.dart';
import 'package:eliud_core/model/app_entry_pages_list_event.dart';
import 'package:eliud_core/model/app_entry_pages_list_state.dart';


class AppEntryPagesListBloc extends Bloc<AppEntryPagesListEvent, AppEntryPagesListState> {
  final AppEntryPagesRepository _appEntryPagesRepository;
  StreamSubscription _appEntryPagessListSubscription;

  AppEntryPagesListBloc({ @required AppEntryPagesRepository appEntryPagesRepository })
      : assert(appEntryPagesRepository != null),
      _appEntryPagesRepository = appEntryPagesRepository,
      super(AppEntryPagesListLoading());

  Stream<AppEntryPagesListState> _mapLoadAppEntryPagesListToState({ String orderBy, bool descending }) async* {
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listen((list) => add(AppEntryPagesListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<AppEntryPagesListState> _mapLoadAppEntryPagesListWithDetailsToState() async* {
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listenWithDetails((list) => add(AppEntryPagesListUpdated(value: list)), );
  }

  Stream<AppEntryPagesListState> _mapAddAppEntryPagesListToState(AddAppEntryPagesList event) async* {
    _appEntryPagesRepository.add(event.value);
  }

  Stream<AppEntryPagesListState> _mapUpdateAppEntryPagesListToState(UpdateAppEntryPagesList event) async* {
    _appEntryPagesRepository.update(event.value);
  }

  Stream<AppEntryPagesListState> _mapDeleteAppEntryPagesListToState(DeleteAppEntryPagesList event) async* {
    _appEntryPagesRepository.delete(event.value);
  }

  Stream<AppEntryPagesListState> _mapAppEntryPagesListUpdatedToState(AppEntryPagesListUpdated event) async* {
    yield AppEntryPagesListLoaded(values: event.value);
  }


  @override
  Stream<AppEntryPagesListState> mapEventToState(AppEntryPagesListEvent event) async* {
    final currentState = state;
    if (event is LoadAppEntryPagesList) {
      yield* _mapLoadAppEntryPagesListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAppEntryPagesListWithDetails) {
      yield* _mapLoadAppEntryPagesListWithDetailsToState();
    } else if (event is AddAppEntryPagesList) {
      yield* _mapAddAppEntryPagesListToState(event);
    } else if (event is UpdateAppEntryPagesList) {
      yield* _mapUpdateAppEntryPagesListToState(event);
    } else if (event is DeleteAppEntryPagesList) {
      yield* _mapDeleteAppEntryPagesListToState(event);
    } else if (event is AppEntryPagesListUpdated) {
      yield* _mapAppEntryPagesListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appEntryPagessListSubscription?.cancel();
    return super.close();
  }

}


