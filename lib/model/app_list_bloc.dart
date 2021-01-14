/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/app_list_event.dart';
import 'package:eliud_core/model/app_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class AppListBloc extends Bloc<AppListEvent, AppListState> {
  final AppRepository _appRepository;
  StreamSubscription _appsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  AppListBloc(this.accessBloc,{ this.eliudQuery, @required AppRepository appRepository })
      : assert(appRepository != null),
      _appRepository = appRepository,
      super(AppListLoading());

  Stream<AppListState> _mapLoadAppListToState({ String orderBy, bool descending }) async* {
    _appsListSubscription?.cancel();
    _appsListSubscription = _appRepository.listen((list) => add(AppListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<AppListState> _mapLoadAppListWithDetailsToState({ String orderBy, bool descending }) async* {
    _appsListSubscription?.cancel();
    _appsListSubscription = _appRepository.listenWithDetails((list) => add(AppListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<AppListState> _mapAddAppListToState(AddAppList event) async* {
    _appRepository.add(event.value);
  }

  Stream<AppListState> _mapUpdateAppListToState(UpdateAppList event) async* {
    _appRepository.update(event.value);
  }

  Stream<AppListState> _mapDeleteAppListToState(DeleteAppList event) async* {
    _appRepository.delete(event.value);
  }

  Stream<AppListState> _mapAppListUpdatedToState(AppListUpdated event) async* {
    yield AppListLoaded(values: event.value);
  }


  @override
  Stream<AppListState> mapEventToState(AppListEvent event) async* {
    final currentState = state;
    if (event is LoadAppList) {
      yield* _mapLoadAppListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadAppListWithDetails) {
      yield* _mapLoadAppListWithDetailsToState();
    } else if (event is AddAppList) {
      yield* _mapAddAppListToState(event);
    } else if (event is UpdateAppList) {
      yield* _mapUpdateAppListToState(event);
    } else if (event is DeleteAppList) {
      yield* _mapDeleteAppListToState(event);
    } else if (event is AppListUpdated) {
      yield* _mapAppListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _appsListSubscription?.cancel();
    return super.close();
  }

}


