/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/blocking_repository.dart';
import 'package:eliud_core/model/blocking_list_event.dart';
import 'package:eliud_core/model/blocking_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'blocking_model.dart';

typedef List<BlockingModel?> FilterBlockingModels(List<BlockingModel?> values);



class BlockingListBloc extends Bloc<BlockingListEvent, BlockingListState> {
  final FilterBlockingModels? filter;
  final BlockingRepository _blockingRepository;
  StreamSubscription? _blockingsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int blockingLimit;

  BlockingListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BlockingRepository blockingRepository, this.blockingLimit = 5})
      : assert(blockingRepository != null),
        _blockingRepository = blockingRepository,
        super(BlockingListLoading()) {
    on <LoadBlockingList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBlockingListToState();
      } else {
        _mapLoadBlockingListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBlockingListWithDetailsToState();
    });
    
    on <BlockingChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBlockingListToState();
      } else {
        _mapLoadBlockingListWithDetailsToState();
      }
    });
      
    on <AddBlockingList> ((event, emit) async {
      await _mapAddBlockingListToState(event);
    });
    
    on <UpdateBlockingList> ((event, emit) async {
      await _mapUpdateBlockingListToState(event);
    });
    
    on <DeleteBlockingList> ((event, emit) async {
      await _mapDeleteBlockingListToState(event);
    });
    
    on <BlockingListUpdated> ((event, emit) {
      emit(_mapBlockingListUpdatedToState(event));
    });
  }

  List<BlockingModel?> _filter(List<BlockingModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadBlockingListToState() async {
    int amountNow =  (state is BlockingListLoaded) ? (state as BlockingListLoaded).values!.length : 0;
    _blockingsListSubscription?.cancel();
    _blockingsListSubscription = _blockingRepository.listen(
          (list) => add(BlockingListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * blockingLimit : null
    );
  }

  Future<void> _mapLoadBlockingListWithDetailsToState() async {
    int amountNow =  (state is BlockingListLoaded) ? (state as BlockingListLoaded).values!.length : 0;
    _blockingsListSubscription?.cancel();
    _blockingsListSubscription = _blockingRepository.listenWithDetails(
            (list) => add(BlockingListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * blockingLimit : null
    );
  }

  Future<void> _mapAddBlockingListToState(AddBlockingList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingRepository.add(value);
    }
  }

  Future<void> _mapUpdateBlockingListToState(UpdateBlockingList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingRepository.update(value);
    }
  }

  Future<void> _mapDeleteBlockingListToState(DeleteBlockingList event) async {
    var value = event.value;
    if (value != null) {
      await _blockingRepository.delete(value);
    }
  }

  BlockingListLoaded _mapBlockingListUpdatedToState(
      BlockingListUpdated event) => BlockingListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _blockingsListSubscription?.cancel();
    return super.close();
  }
}


