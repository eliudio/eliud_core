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

import 'package:eliud_core/model/home_menu_repository.dart';
import 'package:eliud_core/model/home_menu_list_event.dart';
import 'package:eliud_core/model/home_menu_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'home_menu_model.dart';

typedef List<HomeMenuModel?> FilterHomeMenuModels(List<HomeMenuModel?> values);



class HomeMenuListBloc extends Bloc<HomeMenuListEvent, HomeMenuListState> {
  final FilterHomeMenuModels? filter;
  final HomeMenuRepository _homeMenuRepository;
  StreamSubscription? _homeMenusListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int homeMenuLimit;

  HomeMenuListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required HomeMenuRepository homeMenuRepository, this.homeMenuLimit = 5})
      : _homeMenuRepository = homeMenuRepository,
        super(HomeMenuListLoading()) {
    on <LoadHomeMenuList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHomeMenuListToState();
      } else {
        _mapLoadHomeMenuListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadHomeMenuListWithDetailsToState();
    });
    
    on <HomeMenuChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadHomeMenuListToState();
      } else {
        _mapLoadHomeMenuListWithDetailsToState();
      }
    });
      
    on <AddHomeMenuList> ((event, emit) async {
      await _mapAddHomeMenuListToState(event);
    });
    
    on <UpdateHomeMenuList> ((event, emit) async {
      await _mapUpdateHomeMenuListToState(event);
    });
    
    on <DeleteHomeMenuList> ((event, emit) async {
      await _mapDeleteHomeMenuListToState(event);
    });
    
    on <HomeMenuListUpdated> ((event, emit) {
      emit(_mapHomeMenuListUpdatedToState(event));
    });
  }

  List<HomeMenuModel?> _filter(List<HomeMenuModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadHomeMenuListToState() async {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values!.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listen(
          (list) => add(HomeMenuListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * homeMenuLimit : null
    );
  }

  Future<void> _mapLoadHomeMenuListWithDetailsToState() async {
    int amountNow =  (state is HomeMenuListLoaded) ? (state as HomeMenuListLoaded).values!.length : 0;
    _homeMenusListSubscription?.cancel();
    _homeMenusListSubscription = _homeMenuRepository.listenWithDetails(
            (list) => add(HomeMenuListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * homeMenuLimit : null
    );
  }

  Future<void> _mapAddHomeMenuListToState(AddHomeMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _homeMenuRepository.add(value);
    }
  }

  Future<void> _mapUpdateHomeMenuListToState(UpdateHomeMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _homeMenuRepository.update(value);
    }
  }

  Future<void> _mapDeleteHomeMenuListToState(DeleteHomeMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _homeMenuRepository.delete(value);
    }
  }

  HomeMenuListLoaded _mapHomeMenuListUpdatedToState(
      HomeMenuListUpdated event) => HomeMenuListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _homeMenusListSubscription?.cancel();
    return super.close();
  }
}


