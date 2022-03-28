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
        super(PublicMediumListLoading());

  Stream<PublicMediumListState> _mapLoadPublicMediumListToState() async* {
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

  Stream<PublicMediumListState> _mapLoadPublicMediumListWithDetailsToState() async* {
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

  Stream<PublicMediumListState> _mapAddPublicMediumListToState(AddPublicMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _publicMediumRepository.add(value);
  }

  Stream<PublicMediumListState> _mapUpdatePublicMediumListToState(UpdatePublicMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _publicMediumRepository.update(value);
  }

  Stream<PublicMediumListState> _mapDeletePublicMediumListToState(DeletePublicMediumList event) async* {
    var value = event.value;
    if (value != null) 
      _publicMediumRepository.delete(value);
  }

  Stream<PublicMediumListState> _mapPublicMediumListUpdatedToState(
      PublicMediumListUpdated event) async* {
    yield PublicMediumListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PublicMediumListState> mapEventToState(PublicMediumListEvent event) async* {
    if (event is LoadPublicMediumList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPublicMediumListToState();
      } else {
        yield* _mapLoadPublicMediumListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPublicMediumListWithDetailsToState();
    } else if (event is PublicMediumChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPublicMediumListToState();
      } else {
        yield* _mapLoadPublicMediumListWithDetailsToState();
      }
    } else if (event is AddPublicMediumList) {
      yield* _mapAddPublicMediumListToState(event);
    } else if (event is UpdatePublicMediumList) {
      yield* _mapUpdatePublicMediumListToState(event);
    } else if (event is DeletePublicMediumList) {
      yield* _mapDeletePublicMediumListToState(event);
    } else if (event is PublicMediumListUpdated) {
      yield* _mapPublicMediumListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _publicMediumsListSubscription?.cancel();
    return super.close();
  }
}


