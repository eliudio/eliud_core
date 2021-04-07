/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/pos_size_repository.dart';
import 'package:eliud_core/model/pos_size_list_event.dart';
import 'package:eliud_core/model/pos_size_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _posSizeLimit = 5;

class PosSizeListBloc extends Bloc<PosSizeListEvent, PosSizeListState> {
  final PosSizeRepository _posSizeRepository;
  StreamSubscription? _posSizesListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  PosSizeListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PosSizeRepository posSizeRepository})
      : assert(posSizeRepository != null),
        _posSizeRepository = posSizeRepository,
        super(PosSizeListLoading());

  Stream<PosSizeListState> _mapLoadPosSizeListToState() async* {
    int amountNow =  (state is PosSizeListLoaded) ? (state as PosSizeListLoaded).values!.length : 0;
    _posSizesListSubscription?.cancel();
    _posSizesListSubscription = _posSizeRepository.listen(
          (list) => add(PosSizeListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _posSizeLimit : null
    );
  }

  Stream<PosSizeListState> _mapLoadPosSizeListWithDetailsToState() async* {
    int amountNow =  (state is PosSizeListLoaded) ? (state as PosSizeListLoaded).values!.length : 0;
    _posSizesListSubscription?.cancel();
    _posSizesListSubscription = _posSizeRepository.listenWithDetails(
            (list) => add(PosSizeListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _posSizeLimit : null
    );
  }

  Stream<PosSizeListState> _mapAddPosSizeListToState(AddPosSizeList event) async* {
    _posSizeRepository.add(event.value);
  }

  Stream<PosSizeListState> _mapUpdatePosSizeListToState(UpdatePosSizeList event) async* {
    _posSizeRepository.update(event.value);
  }

  Stream<PosSizeListState> _mapDeletePosSizeListToState(DeletePosSizeList event) async* {
    _posSizeRepository.delete(event.value);
  }

  Stream<PosSizeListState> _mapPosSizeListUpdatedToState(
      PosSizeListUpdated event) async* {
    yield PosSizeListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PosSizeListState> mapEventToState(PosSizeListEvent event) async* {
    if (event is LoadPosSizeList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPosSizeListToState();
      } else {
        yield* _mapLoadPosSizeListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPosSizeListWithDetailsToState();
    } else if (event is AddPosSizeList) {
      yield* _mapAddPosSizeListToState(event);
    } else if (event is UpdatePosSizeList) {
      yield* _mapUpdatePosSizeListToState(event);
    } else if (event is DeletePosSizeList) {
      yield* _mapDeletePosSizeListToState(event);
    } else if (event is PosSizeListUpdated) {
      yield* _mapPosSizeListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _posSizesListSubscription?.cancel();
    return super.close();
  }
}


