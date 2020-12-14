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


class GridViewListBloc extends Bloc<GridViewListEvent, GridViewListState> {
  final GridViewRepository _gridViewRepository;
  StreamSubscription _gridViewsListSubscription;

  GridViewListBloc({ @required GridViewRepository gridViewRepository })
      : assert(gridViewRepository != null),
      _gridViewRepository = gridViewRepository,
      super(GridViewListLoading());

  Stream<GridViewListState> _mapLoadGridViewListToState({ String orderBy, bool descending }) async* {
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listen((list) => add(GridViewListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<GridViewListState> _mapLoadGridViewListWithDetailsToState() async* {
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listenWithDetails((list) => add(GridViewListUpdated(value: list)), );
  }

  Stream<GridViewListState> _mapAddGridViewListToState(AddGridViewList event) async* {
    _gridViewRepository.add(event.value);
  }

  Stream<GridViewListState> _mapUpdateGridViewListToState(UpdateGridViewList event) async* {
    _gridViewRepository.update(event.value);
  }

  Stream<GridViewListState> _mapDeleteGridViewListToState(DeleteGridViewList event) async* {
    _gridViewRepository.delete(event.value);
  }

  Stream<GridViewListState> _mapGridViewListUpdatedToState(GridViewListUpdated event) async* {
    yield GridViewListLoaded(values: event.value);
  }


  @override
  Stream<GridViewListState> mapEventToState(GridViewListEvent event) async* {
    final currentState = state;
    if (event is LoadGridViewList) {
      yield* _mapLoadGridViewListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadGridViewListWithDetails) {
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


