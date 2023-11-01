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

import 'package:eliud_core/model/grid_view_repository.dart';
import 'package:eliud_core/model/grid_view_list_event.dart';
import 'package:eliud_core/model/grid_view_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'grid_view_model.dart';

typedef List<GridViewModel?> FilterGridViewModels(List<GridViewModel?> values);



class GridViewListBloc extends Bloc<GridViewListEvent, GridViewListState> {
  final FilterGridViewModels? filter;
  final GridViewRepository _gridViewRepository;
  StreamSubscription? _gridViewsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int gridViewLimit;

  GridViewListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required GridViewRepository gridViewRepository, this.gridViewLimit = 5})
      : _gridViewRepository = gridViewRepository,
        super(GridViewListLoading()) {
    on <LoadGridViewList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadGridViewListToState();
      } else {
        _mapLoadGridViewListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadGridViewListWithDetailsToState();
    });
    
    on <GridViewChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadGridViewListToState();
      } else {
        _mapLoadGridViewListWithDetailsToState();
      }
    });
      
    on <AddGridViewList> ((event, emit) async {
      await _mapAddGridViewListToState(event);
    });
    
    on <UpdateGridViewList> ((event, emit) async {
      await _mapUpdateGridViewListToState(event);
    });
    
    on <DeleteGridViewList> ((event, emit) async {
      await _mapDeleteGridViewListToState(event);
    });
    
    on <GridViewListUpdated> ((event, emit) {
      emit(_mapGridViewListUpdatedToState(event));
    });
  }

  List<GridViewModel?> _filter(List<GridViewModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadGridViewListToState() async {
    int amountNow =  (state is GridViewListLoaded) ? (state as GridViewListLoaded).values!.length : 0;
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listen(
          (list) => add(GridViewListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * gridViewLimit : null
    );
  }

  Future<void> _mapLoadGridViewListWithDetailsToState() async {
    int amountNow =  (state is GridViewListLoaded) ? (state as GridViewListLoaded).values!.length : 0;
    _gridViewsListSubscription?.cancel();
    _gridViewsListSubscription = _gridViewRepository.listenWithDetails(
            (list) => add(GridViewListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * gridViewLimit : null
    );
  }

  Future<void> _mapAddGridViewListToState(AddGridViewList event) async {
    var value = event.value;
    if (value != null) {
      await _gridViewRepository.add(value);
    }
  }

  Future<void> _mapUpdateGridViewListToState(UpdateGridViewList event) async {
    var value = event.value;
    if (value != null) {
      await _gridViewRepository.update(value);
    }
  }

  Future<void> _mapDeleteGridViewListToState(DeleteGridViewList event) async {
    var value = event.value;
    if (value != null) {
      await _gridViewRepository.delete(value);
    }
  }

  GridViewListLoaded _mapGridViewListUpdatedToState(
      GridViewListUpdated event) => GridViewListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _gridViewsListSubscription?.cancel();
    return super.close();
  }
}


