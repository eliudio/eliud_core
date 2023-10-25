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
import 'package:eliud_core/tools/query/query_tools.dart';

import 'app_entry_pages_model.dart';

typedef List<AppEntryPagesModel?> FilterAppEntryPagesModels(List<AppEntryPagesModel?> values);



class AppEntryPagesListBloc extends Bloc<AppEntryPagesListEvent, AppEntryPagesListState> {
  final FilterAppEntryPagesModels? filter;
  final AppEntryPagesRepository _appEntryPagesRepository;
  StreamSubscription? _appEntryPagessListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int appEntryPagesLimit;

  AppEntryPagesListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required AppEntryPagesRepository appEntryPagesRepository, this.appEntryPagesLimit = 5})
      : assert(appEntryPagesRepository != null),
        _appEntryPagesRepository = appEntryPagesRepository,
        super(AppEntryPagesListLoading()) {
    on <LoadAppEntryPagesList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppEntryPagesListToState();
      } else {
        _mapLoadAppEntryPagesListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadAppEntryPagesListWithDetailsToState();
    });
    
    on <AppEntryPagesChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadAppEntryPagesListToState();
      } else {
        _mapLoadAppEntryPagesListWithDetailsToState();
      }
    });
      
    on <AddAppEntryPagesList> ((event, emit) async {
      await _mapAddAppEntryPagesListToState(event);
    });
    
    on <UpdateAppEntryPagesList> ((event, emit) async {
      await _mapUpdateAppEntryPagesListToState(event);
    });
    
    on <DeleteAppEntryPagesList> ((event, emit) async {
      await _mapDeleteAppEntryPagesListToState(event);
    });
    
    on <AppEntryPagesListUpdated> ((event, emit) {
      emit(_mapAppEntryPagesListUpdatedToState(event));
    });
  }

  List<AppEntryPagesModel?> _filter(List<AppEntryPagesModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadAppEntryPagesListToState() async {
    int amountNow =  (state is AppEntryPagesListLoaded) ? (state as AppEntryPagesListLoaded).values!.length : 0;
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listen(
          (list) => add(AppEntryPagesListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * appEntryPagesLimit : null
    );
  }

  Future<void> _mapLoadAppEntryPagesListWithDetailsToState() async {
    int amountNow =  (state is AppEntryPagesListLoaded) ? (state as AppEntryPagesListLoaded).values!.length : 0;
    _appEntryPagessListSubscription?.cancel();
    _appEntryPagessListSubscription = _appEntryPagesRepository.listenWithDetails(
            (list) => add(AppEntryPagesListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * appEntryPagesLimit : null
    );
  }

  Future<void> _mapAddAppEntryPagesListToState(AddAppEntryPagesList event) async {
    var value = event.value;
    if (value != null) {
      await _appEntryPagesRepository.add(value);
    }
  }

  Future<void> _mapUpdateAppEntryPagesListToState(UpdateAppEntryPagesList event) async {
    var value = event.value;
    if (value != null) {
      await _appEntryPagesRepository.update(value);
    }
  }

  Future<void> _mapDeleteAppEntryPagesListToState(DeleteAppEntryPagesList event) async {
    var value = event.value;
    if (value != null) {
      await _appEntryPagesRepository.delete(value);
    }
  }

  AppEntryPagesListLoaded _mapAppEntryPagesListUpdatedToState(
      AppEntryPagesListUpdated event) => AppEntryPagesListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _appEntryPagessListSubscription?.cancel();
    return super.close();
  }
}


