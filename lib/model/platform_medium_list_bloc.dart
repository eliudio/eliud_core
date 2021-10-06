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
import 'package:meta/meta.dart';

import 'package:eliud_core/model/platform_medium_repository.dart';
import 'package:eliud_core/model/platform_medium_list_event.dart';
import 'package:eliud_core/model/platform_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PlatformMediumListBloc extends Bloc<PlatformMediumListEvent, PlatformMediumListState> {
  final PlatformMediumRepository _platformMediumRepository;
  StreamSubscription? _platformMediumsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int platformMediumLimit;

  PlatformMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PlatformMediumRepository platformMediumRepository, this.platformMediumLimit = 5})
      : assert(platformMediumRepository != null),
        _platformMediumRepository = platformMediumRepository,
        super(PlatformMediumListLoading());

  Stream<PlatformMediumListState> _mapLoadPlatformMediumListToState() async* {
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

  Stream<PlatformMediumListState> _mapLoadPlatformMediumListWithDetailsToState() async* {
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

  Stream<PlatformMediumListState> _mapAddPlatformMediumListToState(AddPlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _platformMediumRepository.add(value);
  }

  Stream<PlatformMediumListState> _mapUpdatePlatformMediumListToState(UpdatePlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _platformMediumRepository.update(value);
  }

  Stream<PlatformMediumListState> _mapDeletePlatformMediumListToState(DeletePlatformMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _platformMediumRepository.delete(value);
  }

  Stream<PlatformMediumListState> _mapPlatformMediumListUpdatedToState(
      PlatformMediumListUpdated event) async* {
    yield PlatformMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PlatformMediumListState> mapEventToState(PlatformMediumListEvent event) async* {
    if (event is LoadPlatformMediumList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPlatformMediumListToState();
      } else {
        yield* _mapLoadPlatformMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPlatformMediumListWithDetailsToState();
    } else if (event is AddPlatformMediumList) {
      yield* _mapAddPlatformMediumListToState(event);
    } else if (event is UpdatePlatformMediumList) {
      yield* _mapUpdatePlatformMediumListToState(event);
    } else if (event is DeletePlatformMediumList) {
      yield* _mapDeletePlatformMediumListToState(event);
    } else if (event is PlatformMediumListUpdated) {
      yield* _mapPlatformMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _platformMediumsListSubscription?.cancel();
    return super.close();
  }
}


