/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 public_medium_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/public_medium_repository.dart';
import 'package:eliud_core/model/public_medium_list_event.dart';
import 'package:eliud_core/model/public_medium_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PublicMediumListBloc extends Bloc<PublicMediumListEvent, PublicMediumListState> {
  final PublicMediumRepository _publicMediumRepository;
  StreamSubscription? _publicMediumsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int publicMediumLimit;

  PublicMediumListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PublicMediumRepository publicMediumRepository, this.publicMediumLimit = 5})
      : assert(publicMediumRepository != null),
        _publicMediumRepository = publicMediumRepository,
        super(PublicMediumListLoading()) {
    on <LoadPublicMediumList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPublicMediumListToState();
      } else {
        _mapLoadPublicMediumListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPublicMediumListWithDetailsToState();
    });
    
    on <PublicMediumChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPublicMediumListToState();
      } else {
        _mapLoadPublicMediumListWithDetailsToState();
      }
    });
      
    on <AddPublicMediumList> ((event, emit) async {
      await _mapAddPublicMediumListToState(event);
    });
    
    on <UpdatePublicMediumList> ((event, emit) async {
      await _mapUpdatePublicMediumListToState(event);
    });
    
    on <DeletePublicMediumList> ((event, emit) async {
      await _mapDeletePublicMediumListToState(event);
    });
    
    on <PublicMediumListUpdated> ((event, emit) {
      emit(_mapPublicMediumListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadPublicMediumListToState() async {
    int amountNow =  (state is PublicMediumListLoaded) ? (state as PublicMediumListLoaded).values!.length : 0;
    _publicMediumsListSubscription?.cancel();
    _publicMediumsListSubscription = _publicMediumRepository.listen(
          (list) => add(PublicMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * publicMediumLimit : null
    );
  }

  Future<void> _mapLoadPublicMediumListWithDetailsToState() async {
    int amountNow =  (state is PublicMediumListLoaded) ? (state as PublicMediumListLoaded).values!.length : 0;
    _publicMediumsListSubscription?.cancel();
    _publicMediumsListSubscription = _publicMediumRepository.listenWithDetails(
            (list) => add(PublicMediumListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * publicMediumLimit : null
    );
  }

  Future<void> _mapAddPublicMediumListToState(AddPublicMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _publicMediumRepository.add(value);
    }
  }

  Future<void> _mapUpdatePublicMediumListToState(UpdatePublicMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _publicMediumRepository.update(value);
    }
  }

  Future<void> _mapDeletePublicMediumListToState(DeletePublicMediumList event) async {
    var value = event.value;
    if (value != null) {
      await _publicMediumRepository.delete(value);
    }
  }

  PublicMediumListLoaded _mapPublicMediumListUpdatedToState(
      PublicMediumListUpdated event) => PublicMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _publicMediumsListSubscription?.cancel();
    return super.close();
  }
}


