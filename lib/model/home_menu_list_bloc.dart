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
import 'package:eliud_core/tools/query/query_tools.dart';


const _homeMenuLimit = 5;

class HomeMenuListBloc extends Bloc<HomeMenuListEvent, HomeMenuListState> {
  final HomeMenuRepository _homeMenuRepository;
  StreamSubscription _homeMenusListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  HomeMenuListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required HomeMenuRepository homeMenuRepository})
      : assert(homeMenuRepository != null),
        _homeMenuRepository = homeMenuRepository,
        super(HomeMenuListLoading());

  Stream<HomeMenuListState> _mapLoadHomeMenuListToState() async* {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listen(
          (list) => add(HomeMenuListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _homeMenuLimit : null
    );
  }

  Stream<HomeMenuListState> _mapLoadHomeMenuListWithDetailsToState() async* {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listenWithDetails(
            (list) => add(HomeMenuListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _homeMenuLimit : null
    );
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

  Stream<HomeMenuListState> _mapHomeMenuListUpdatedToState(
      HomeMenuListUpdated event) async* {
    yield HomeMenuListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HomeMenuListState> mapEventToState(HomeMenuListEvent event) async* {
    if (event is LoadHomeMenuList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadHomeMenuListToState();
      } else {
        yield* _mapLoadHomeMenuListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


