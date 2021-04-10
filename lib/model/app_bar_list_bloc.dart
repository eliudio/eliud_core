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
import 'package:eliud_core/tools/query/query_tools.dart';


const _appBarLimit = 5;

class AppBarListBloc extends Bloc<AppBarListEvent, AppBarListState> {
  final AppBarRepository _appBarRepository;
  StreamSubscription? _appBarsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  AppBarListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppBarRepository appBarRepository})
      : assert(appBarRepository != null),
        _appBarRepository = appBarRepository,
        super(AppBarListLoading());

  Stream<AppBarListState> _mapLoadAppBarListToState() async* {
    int amountNow =  (state is AppBarListLoaded) ? (state as AppBarListLoaded).values!.length : 0;
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listen(
          (list) => add(AppBarListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _appBarLimit : null
    );
  }

  Stream<AppBarListState> _mapLoadAppBarListWithDetailsToState() async* {
    int amountNow =  (state is AppBarListLoaded) ? (state as AppBarListLoaded).values!.length : 0;
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listenWithDetails(
            (list) => add(AppBarListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _appBarLimit : null
    );
  }

  Stream<AppBarListState> _mapAddAppBarListToState(AddAppBarList event) async* {
    var value = event.value;
    if (value != null) 
      _appBarRepository.add(value);
  }

  Stream<AppBarListState> _mapUpdateAppBarListToState(UpdateAppBarList event) async* {
    var value = event.value;
    if (value != null) 
      _appBarRepository.update(value);
  }

  Stream<AppBarListState> _mapDeleteAppBarListToState(DeleteAppBarList event) async* {
    var value = event.value;
    if (value != null) 
      _appBarRepository.delete(value);
  }

  Stream<AppBarListState> _mapAppBarListUpdatedToState(
      AppBarListUpdated event) async* {
    yield AppBarListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<AppBarListState> mapEventToState(AppBarListEvent event) async* {
    if (event is LoadAppBarList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadAppBarListToState();
      } else {
        yield* _mapLoadAppBarListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


