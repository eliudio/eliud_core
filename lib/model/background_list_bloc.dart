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
import 'package:eliud_core/tools/query/query_tools.dart';


const _backgroundLimit = 5;

class BackgroundListBloc extends Bloc<BackgroundListEvent, BackgroundListState> {
  final BackgroundRepository _backgroundRepository;
  StreamSubscription _backgroundsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  BackgroundListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required BackgroundRepository backgroundRepository})
      : assert(backgroundRepository != null),
        _backgroundRepository = backgroundRepository,
        super(BackgroundListLoading());

  Stream<BackgroundListState> _mapLoadBackgroundListToState() async* {
    int amountNow =  (state is BackgroundListLoaded) ? (state as BackgroundListLoaded).values.length : 0;
    _backgroundsListSubscription?.cancel();
    _backgroundsListSubscription = _backgroundRepository.listen(
          (list) => add(BackgroundListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _backgroundLimit : null
    );
  }

  Stream<BackgroundListState> _mapLoadBackgroundListWithDetailsToState() async* {
    int amountNow =  (state is BackgroundListLoaded) ? (state as BackgroundListLoaded).values.length : 0;
    _backgroundsListSubscription?.cancel();
    _backgroundsListSubscription = _backgroundRepository.listenWithDetails(
            (list) => add(BackgroundListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _backgroundLimit : null
    );
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

  Stream<BackgroundListState> _mapBackgroundListUpdatedToState(
      BackgroundListUpdated event) async* {
    yield BackgroundListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<BackgroundListState> mapEventToState(BackgroundListEvent event) async* {
    if (event is LoadBackgroundList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadBackgroundListToState();
      } else {
        yield* _mapLoadBackgroundListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


