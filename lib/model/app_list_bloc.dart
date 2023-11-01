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

import 'package:eliud_core/model/app_repository.dart';
import 'package:eliud_core/model/app_list_event.dart';
import 'package:eliud_core/model/app_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'app_model.dart';

typedef List<AppModel?> FilterAppModels(List<AppModel?> values);



class AppListBloc extends Bloc<AppListEvent, AppListState> {
  final FilterAppModels? filter;
  final AppRepository _appRepository;
  StreamSubscription? _appsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appLimit;

  AppListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppRepository appRepository, this.appLimit = 5})
      : _appRepository = appRepository,
        super(AppListLoading()) {
    on <LoadAppList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppListToState();
      } else {
        _mapLoadAppListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAppListWithDetailsToState();
    });
    
    on <AppChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppListToState();
      } else {
        _mapLoadAppListWithDetailsToState();
      }
    });
      
    on <AddAppList> ((event, emit) async {
      await _mapAddAppListToState(event);
    });
    
    on <UpdateAppList> ((event, emit) async {
      await _mapUpdateAppListToState(event);
    });
    
    on <DeleteAppList> ((event, emit) async {
      await _mapDeleteAppListToState(event);
    });
    
    on <AppListUpdated> ((event, emit) {
      emit(_mapAppListUpdatedToState(event));
    });
  }

  List<AppModel?> _filter(List<AppModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAppListToState() async {
    int amountNow =  (state is AppListLoaded) ? (state as AppListLoaded).values!.length : 0;
    _appsListSubscription?.cancel();
    _appsListSubscription = _appRepository.listen(
          (list) => add(AppListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appLimit : null
    );
  }

  Future<void> _mapLoadAppListWithDetailsToState() async {
    int amountNow =  (state is AppListLoaded) ? (state as AppListLoaded).values!.length : 0;
    _appsListSubscription?.cancel();
    _appsListSubscription = _appRepository.listenWithDetails(
            (list) => add(AppListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appLimit : null
    );
  }

  Future<void> _mapAddAppListToState(AddAppList event) async {
    var value = event.value;
    if (value != null) {
      await _appRepository.add(value);
    }
  }

  Future<void> _mapUpdateAppListToState(UpdateAppList event) async {
    var value = event.value;
    if (value != null) {
      await _appRepository.update(value);
    }
  }

  Future<void> _mapDeleteAppListToState(DeleteAppList event) async {
    var value = event.value;
    if (value != null) {
      await _appRepository.delete(value);
    }
  }

  AppListLoaded _mapAppListUpdatedToState(
      AppListUpdated event) => AppListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _appsListSubscription?.cancel();
    return super.close();
  }
}


