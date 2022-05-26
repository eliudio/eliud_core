/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/platform_medium_list_event.dart';
import 'package:eliud_core/model/platform_medium_list_state.dart';
import 'package:eliud_core/model/platform_medium_repository.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PlatformMediumListBloc extends Bloc<PlatformMediumListEvent, PlatformMediumListState> {
  final PlatformMediumRepository _platformMediumRepository;
  StreamSubscription? _platformMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int platformMediumLimit;

  PlatformMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PlatformMediumRepository platformMediumRepository, this.platformMediumLimit = 5})
      : assert(platformMediumRepository != null),
        _platformMediumRepository = platformMediumRepository,
        super(PlatformMediumListLoading()) {
    on <LoadPlatformMediumList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPlatformMediumListToState();
      } else {
        _mapLoadPlatformMediumListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPlatformMediumListWithDetailsToState();
    });
    
    on <PlatformMediumChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPlatformMediumListToState();
      } else {
        _mapLoadPlatformMediumListWithDetailsToState();
      }
    });
      
    on <AddPlatformMediumList> ((event, emit) async {
      await _mapAddPlatformMediumListToState(event);
    });
    
    on <UpdatePlatformMediumList> ((event, emit) async {
      await _mapUpdatePlatformMediumListToState(event);
    });
    
    on <DeletePlatformMediumList> ((event, emit) async {
      await _mapDeletePlatformMediumListToState(event);
    });
    
    on <PlatformMediumListUpdated> ((event, emit) {
      emit(_mapPlatformMediumListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadPlatformMediumListToState() async {
    int amountNow =  (state is PlatformMediumListLoaded) ? (state as PlatformMediumListLoaded).values!.length : 0;
    _platformMediumsListSubscription?.cancel();
    _platformMediumsListSubscription = _platformMediumRepository.listen(
          (list) => add(PlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * platformMediumLimit : null
    );
  }

  Future<void> _mapLoadPlatformMediumListWithDetailsToState() async {
    int amountNow =  (state is PlatformMediumListLoaded) ? (state as PlatformMediumListLoaded).values!.length : 0;
    _platformMediumsListSubscription?.cancel();
    _platformMediumsListSubscription = _platformMediumRepository.listenWithDetails(
            (list) => add(PlatformMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * platformMediumLimit : null
    );
  }

  Future<void> _mapAddPlatformMediumListToState(AddPlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _platformMediumRepository.add(value);
    }
  }

  Future<void> _mapUpdatePlatformMediumListToState(UpdatePlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _platformMediumRepository.update(value);
    }
  }

  Future<void> _mapDeletePlatformMediumListToState(DeletePlatformMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _platformMediumRepository.delete(value);
    }
  }

  PlatformMediumListLoaded _mapPlatformMediumListUpdatedToState(
      PlatformMediumListUpdated event) => PlatformMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _platformMediumsListSubscription?.cancel();
    return super.close();
  }
}


