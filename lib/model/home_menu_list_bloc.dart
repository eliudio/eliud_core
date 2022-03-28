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



class HomeMenuListBloc extends Bloc<HomeMenuListEvent, HomeMenuListState> {
  final HomeMenuRepository _homeMenuRepository;
  StreamSubscription? _homeMenusListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int homeMenuLimit;

  HomeMenuListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HomeMenuRepository homeMenuRepository, this.homeMenuLimit = 5})
      : assert(homeMenuRepository != null),
        _homeMenuRepository = homeMenuRepository,
        super(HomeMenuListLoading());

  Stream<HomeMenuListState> _mapLoadHomeMenuListToState() async* {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values!.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listen(
          (list) => add(HomeMenuListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * homeMenuLimit : null
    );
  }

  Stream<HomeMenuListState> _mapLoadHomeMenuListWithDetailsToState() async* {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values!.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listenWithDetails(
            (list) => add(HomeMenuListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * homeMenuLimit : null
    );
  }

  Stream<HomeMenuListState> _mapAddHomeMenuListToState(AddHomeMenuList event) async* {
    var value = event.value;
    if (value != null) 
      _homeMenuRepository.add(value);
  }

  Stream<HomeMenuListState> _mapUpdateHomeMenuListToState(UpdateHomeMenuList event) async* {
    var value = event.value;
    if (value != null) 
      _homeMenuRepository.update(value);
  }

  Stream<HomeMenuListState> _mapDeleteHomeMenuListToState(DeleteHomeMenuList event) async* {
    var value = event.value;
    if (value != null) 
      _homeMenuRepository.delete(value);
  }

  Stream<HomeMenuListState> _mapHomeMenuListUpdatedToState(
      HomeMenuListUpdated event) async* {
    yield HomeMenuListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<HomeMenuListState> mapEventToState(HomeMenuListEvent event) async* {
    if (event is LoadHomeMenuList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHomeMenuListToState();
      } else {
        yield* _mapLoadHomeMenuListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadHomeMenuListWithDetailsToState();
    } else if (event is HomeMenuChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadHomeMenuListToState();
      } else {
        yield* _mapLoadHomeMenuListWithDetailsToState();
      }
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


