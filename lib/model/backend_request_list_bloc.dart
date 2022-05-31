/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/backend_request_repository.dart';
import 'package:eliud_core/model/backend_request_list_event.dart';
import 'package:eliud_core/model/backend_request_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class BackendRequestListBloc extends Bloc<BackendRequestListEvent, BackendRequestListState> {
  final BackendRequestRepository _backendRequestRepository;
  StreamSubscription? _backendRequestsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int backendRequestLimit;

  BackendRequestListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BackendRequestRepository backendRequestRepository, this.backendRequestLimit = 5})
      : assert(backendRequestRepository != null),
        _backendRequestRepository = backendRequestRepository,
        super(BackendRequestListLoading()) {
    on <LoadBackendRequestList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBackendRequestListToState();
      } else {
        _mapLoadBackendRequestListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBackendRequestListWithDetailsToState();
    });
    
    on <BackendRequestChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBackendRequestListToState();
      } else {
        _mapLoadBackendRequestListWithDetailsToState();
      }
    });
      
    on <AddBackendRequestList> ((event, emit) async {
      await _mapAddBackendRequestListToState(event);
    });
    
    on <UpdateBackendRequestList> ((event, emit) async {
      await _mapUpdateBackendRequestListToState(event);
    });
    
    on <DeleteBackendRequestList> ((event, emit) async {
      await _mapDeleteBackendRequestListToState(event);
    });
    
    on <BackendRequestListUpdated> ((event, emit) {
      emit(_mapBackendRequestListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadBackendRequestListToState() async {
    int amountNow =  (state is BackendRequestListLoaded) ? (state as BackendRequestListLoaded).values!.length : 0;
    _backendRequestsListSubscription?.cancel();
    _backendRequestsListSubscription = _backendRequestRepository.listen(
          (list) => add(BackendRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * backendRequestLimit : null
    );
  }

  Future<void> _mapLoadBackendRequestListWithDetailsToState() async {
    int amountNow =  (state is BackendRequestListLoaded) ? (state as BackendRequestListLoaded).values!.length : 0;
    _backendRequestsListSubscription?.cancel();
    _backendRequestsListSubscription = _backendRequestRepository.listenWithDetails(
            (list) => add(BackendRequestListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * backendRequestLimit : null
    );
  }

  Future<void> _mapAddBackendRequestListToState(AddBackendRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _backendRequestRepository.add(value);
    }
  }

  Future<void> _mapUpdateBackendRequestListToState(UpdateBackendRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _backendRequestRepository.update(value);
    }
  }

  Future<void> _mapDeleteBackendRequestListToState(DeleteBackendRequestList event) async {
    var value = event.value;
    if (value != null) {
      await _backendRequestRepository.delete(value);
    }
  }

  BackendRequestListLoaded _mapBackendRequestListUpdatedToState(
      BackendRequestListUpdated event) => BackendRequestListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _backendRequestsListSubscription?.cancel();
    return super.close();
  }
}


