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

import 'package:eliud_core/model/app_bar_repository.dart';
import 'package:eliud_core/model/app_bar_list_event.dart';
import 'package:eliud_core/model/app_bar_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'app_bar_model.dart';

typedef List<AppBarModel?> FilterAppBarModels(List<AppBarModel?> values);



class AppBarListBloc extends Bloc<AppBarListEvent, AppBarListState> {
  final FilterAppBarModels? filter;
  final AppBarRepository _appBarRepository;
  StreamSubscription? _appBarsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appBarLimit;

  AppBarListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppBarRepository appBarRepository, this.appBarLimit = 5})
      : _appBarRepository = appBarRepository,
        super(AppBarListLoading()) {
    on <LoadAppBarList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppBarListToState();
      } else {
        _mapLoadAppBarListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAppBarListWithDetailsToState();
    });
    
    on <AppBarChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppBarListToState();
      } else {
        _mapLoadAppBarListWithDetailsToState();
      }
    });
      
    on <AddAppBarList> ((event, emit) async {
      await _mapAddAppBarListToState(event);
    });
    
    on <UpdateAppBarList> ((event, emit) async {
      await _mapUpdateAppBarListToState(event);
    });
    
    on <DeleteAppBarList> ((event, emit) async {
      await _mapDeleteAppBarListToState(event);
    });
    
    on <AppBarListUpdated> ((event, emit) {
      emit(_mapAppBarListUpdatedToState(event));
    });
  }

  List<AppBarModel?> _filter(List<AppBarModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAppBarListToState() async {
    int amountNow =  (state is AppBarListLoaded) ? (state as AppBarListLoaded).values!.length : 0;
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listen(
          (list) => add(AppBarListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appBarLimit : null
    );
  }

  Future<void> _mapLoadAppBarListWithDetailsToState() async {
    int amountNow =  (state is AppBarListLoaded) ? (state as AppBarListLoaded).values!.length : 0;
    _appBarsListSubscription?.cancel();
    _appBarsListSubscription = _appBarRepository.listenWithDetails(
            (list) => add(AppBarListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appBarLimit : null
    );
  }

  Future<void> _mapAddAppBarListToState(AddAppBarList event) async {
    var value = event.value;
    if (value != null) {
      await _appBarRepository.add(value);
    }
  }

  Future<void> _mapUpdateAppBarListToState(UpdateAppBarList event) async {
    var value = event.value;
    if (value != null) {
      await _appBarRepository.update(value);
    }
  }

  Future<void> _mapDeleteAppBarListToState(DeleteAppBarList event) async {
    var value = event.value;
    if (value != null) {
      await _appBarRepository.delete(value);
    }
  }

  AppBarListLoaded _mapAppBarListUpdatedToState(
      AppBarListUpdated event) => AppBarListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _appBarsListSubscription?.cancel();
    return super.close();
  }
}


