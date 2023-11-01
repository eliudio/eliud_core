/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/blocking_dashboard_repository.dart';
import 'package:eliud_core/model/blocking_dashboard_list_event.dart';
import 'package:eliud_core/model/blocking_dashboard_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'blocking_dashboard_model.dart';

typedef List<BlockingDashboardModel?> FilterBlockingDashboardModels(List<BlockingDashboardModel?> values);



class BlockingDashboardListBloc extends Bloc<BlockingDashboardListEvent, BlockingDashboardListState> {
  final FilterBlockingDashboardModels? filter;
  final BlockingDashboardRepository _blockingDashboardRepository;
  StreamSubscription? _blockingDashboardsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int blockingDashboardLimit;

  BlockingDashboardListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BlockingDashboardRepository blockingDashboardRepository, this.blockingDashboardLimit = 5})
      : _blockingDashboardRepository = blockingDashboardRepository,
        super(BlockingDashboardListLoading()) {
    on <LoadBlockingDashboardList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBlockingDashboardListToState();
      } else {
        _mapLoadBlockingDashboardListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBlockingDashboardListWithDetailsToState();
    });
    
    on <BlockingDashboardChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBlockingDashboardListToState();
      } else {
        _mapLoadBlockingDashboardListWithDetailsToState();
      }
    });
      
    on <AddBlockingDashboardList> ((event, emit) async {
      await _mapAddBlockingDashboardListToState(event);
    });
    
    on <UpdateBlockingDashboardList> ((event, emit) async {
      await _mapUpdateBlockingDashboardListToState(event);
    });
    
    on <DeleteBlockingDashboardList> ((event, emit) async {
      await _mapDeleteBlockingDashboardListToState(event);
    });
    
    on <BlockingDashboardListUpdated> ((event, emit) {
      emit(_mapBlockingDashboardListUpdatedToState(event));
    });
  }

  List<BlockingDashboardModel?> _filter(List<BlockingDashboardModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadBlockingDashboardListToState() async {
    int amountNow =  (state is BlockingDashboardListLoaded) ? (state as BlockingDashboardListLoaded).values!.length : 0;
    _blockingDashboardsListSubscription?.cancel();
    _blockingDashboardsListSubscription = _blockingDashboardRepository.listen(
          (list) => add(BlockingDashboardListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * blockingDashboardLimit : null
    );
  }

  Future<void> _mapLoadBlockingDashboardListWithDetailsToState() async {
    int amountNow =  (state is BlockingDashboardListLoaded) ? (state as BlockingDashboardListLoaded).values!.length : 0;
    _blockingDashboardsListSubscription?.cancel();
    _blockingDashboardsListSubscription = _blockingDashboardRepository.listenWithDetails(
            (list) => add(BlockingDashboardListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * blockingDashboardLimit : null
    );
  }

  Future<void> _mapAddBlockingDashboardListToState(AddBlockingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingDashboardRepository.add(value);
    }
  }

  Future<void> _mapUpdateBlockingDashboardListToState(UpdateBlockingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingDashboardRepository.update(value);
    }
  }

  Future<void> _mapDeleteBlockingDashboardListToState(DeleteBlockingDashboardList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingDashboardRepository.delete(value);
    }
  }

  BlockingDashboardListLoaded _mapBlockingDashboardListUpdatedToState(
      BlockingDashboardListUpdated event) => BlockingDashboardListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _blockingDashboardsListSubscription?.cancel();
    return super.close();
  }
}


