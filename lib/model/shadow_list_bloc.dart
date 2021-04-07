/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 shadow_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/shadow_repository.dart';
import 'package:eliud_core/model/shadow_list_event.dart';
import 'package:eliud_core/model/shadow_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _shadowLimit = 5;

class ShadowListBloc extends Bloc<ShadowListEvent, ShadowListState> {
  final ShadowRepository _shadowRepository;
  StreamSubscription? _shadowsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  ShadowListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ShadowRepository shadowRepository})
      : assert(shadowRepository != null),
        _shadowRepository = shadowRepository,
        super(ShadowListLoading());

  Stream<ShadowListState> _mapLoadShadowListToState() async* {
    int amountNow =  (state is ShadowListLoaded) ? (state as ShadowListLoaded).values!.length : 0;
    _shadowsListSubscription?.cancel();
    _shadowsListSubscription = _shadowRepository.listen(
          (list) => add(ShadowListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _shadowLimit : null
    );
  }

  Stream<ShadowListState> _mapLoadShadowListWithDetailsToState() async* {
    int amountNow =  (state is ShadowListLoaded) ? (state as ShadowListLoaded).values!.length : 0;
    _shadowsListSubscription?.cancel();
    _shadowsListSubscription = _shadowRepository.listenWithDetails(
            (list) => add(ShadowListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _shadowLimit : null
    );
  }

  Stream<ShadowListState> _mapAddShadowListToState(AddShadowList event) async* {
    _shadowRepository.add(event.value);
  }

  Stream<ShadowListState> _mapUpdateShadowListToState(UpdateShadowList event) async* {
    _shadowRepository.update(event.value);
  }

  Stream<ShadowListState> _mapDeleteShadowListToState(DeleteShadowList event) async* {
    _shadowRepository.delete(event.value);
  }

  Stream<ShadowListState> _mapShadowListUpdatedToState(
      ShadowListUpdated event) async* {
    yield ShadowListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ShadowListState> mapEventToState(ShadowListEvent event) async* {
    if (event is LoadShadowList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadShadowListToState();
      } else {
        yield* _mapLoadShadowListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadShadowListWithDetailsToState();
    } else if (event is AddShadowList) {
      yield* _mapAddShadowListToState(event);
    } else if (event is UpdateShadowList) {
      yield* _mapUpdateShadowListToState(event);
    } else if (event is DeleteShadowList) {
      yield* _mapDeleteShadowListToState(event);
    } else if (event is ShadowListUpdated) {
      yield* _mapShadowListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _shadowsListSubscription?.cancel();
    return super.close();
  }
}


