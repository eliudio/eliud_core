/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_view_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/grid_view_repository.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';
import 'package:eliud_core/model/grid_view_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _gridViewLimit = 5;

class GridViewListBloc extends Bloc<GridViewListEvent, GridViewListState> {
  final GridViewRepository _gridViewRepository;
  StreamSubscription? _gridViewsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  GridViewListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required GridViewRepository gridViewRepository})
      : assert(gridViewRepository != null),
        _gridViewRepository = gridViewRepository,
        super(GridViewListLoading());

  Stream<GridViewListState> _mapLoadGridViewListToState() async* {
    int amountNow =  (state is GridViewListLoaded) ? (state as GridViewListLoaded).values!.length : 0;
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listen(
          (list) => add(GridViewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _gridViewLimit : null
    );
  }

  Stream<GridViewListState> _mapLoadGridViewListWithDetailsToState() async* {
    int amountNow =  (state is GridViewListLoaded) ? (state as GridViewListLoaded).values!.length : 0;
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listenWithDetails(
            (list) => add(GridViewListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _gridViewLimit : null
    );
  }

  Stream<GridViewListState> _mapAddGridViewListToState(AddGridViewList event) async* {
    var value = event.value;
    if (value != null) 
      _gridViewRepository.add(value);
  }

  Stream<GridViewListState> _mapUpdateGridViewListToState(UpdateGridViewList event) async* {
    var value = event.value;
    if (value != null) 
      _gridViewRepository.update(value);
  }

  Stream<GridViewListState> _mapDeleteGridViewListToState(DeleteGridViewList event) async* {
    var value = event.value;
    if (value != null) 
      _gridViewRepository.delete(value);
  }

  Stream<GridViewListState> _mapGridViewListUpdatedToState(
      GridViewListUpdated event) async* {
    yield GridViewListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<GridViewListState> mapEventToState(GridViewListEvent event) async* {
    if (event is LoadGridViewList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadGridViewListToState();
      } else {
        yield* _mapLoadGridViewListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadGridViewListWithDetailsToState();
    } else if (event is AddGridViewList) {
      yield* _mapAddGridViewListToState(event);
    } else if (event is UpdateGridViewList) {
      yield* _mapUpdateGridViewListToState(event);
    } else if (event is DeleteGridViewList) {
      yield* _mapDeleteGridViewListToState(event);
    } else if (event is GridViewListUpdated) {
      yield* _mapGridViewListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _gridViewsListSubscription?.cancel();
    return super.close();
  }
}


