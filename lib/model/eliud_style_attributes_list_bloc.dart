/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 eliud_style_attributes_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/eliud_style_attributes_repository.dart';
import 'package:eliud_core/model/eliud_style_attributes_list_event.dart';
import 'package:eliud_core/model/eliud_style_attributes_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class EliudStyleAttributesListBloc extends Bloc<EliudStyleAttributesListEvent, EliudStyleAttributesListState> {
  final EliudStyleAttributesRepository _eliudStyleAttributesRepository;
  StreamSubscription? _eliudStyleAttributessListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int eliudStyleAttributesLimit;

  EliudStyleAttributesListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required EliudStyleAttributesRepository eliudStyleAttributesRepository, this.eliudStyleAttributesLimit = 5})
      : assert(eliudStyleAttributesRepository != null),
        _eliudStyleAttributesRepository = eliudStyleAttributesRepository,
        super(EliudStyleAttributesListLoading());

  Stream<EliudStyleAttributesListState> _mapLoadEliudStyleAttributesListToState() async* {
    int amountNow =  (state is EliudStyleAttributesListLoaded) ? (state as EliudStyleAttributesListLoaded).values!.length : 0;
    _eliudStyleAttributessListSubscription?.cancel();
    _eliudStyleAttributessListSubscription = _eliudStyleAttributesRepository.listen(
          (list) => add(EliudStyleAttributesListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * eliudStyleAttributesLimit : null
    );
  }

  Stream<EliudStyleAttributesListState> _mapLoadEliudStyleAttributesListWithDetailsToState() async* {
    int amountNow =  (state is EliudStyleAttributesListLoaded) ? (state as EliudStyleAttributesListLoaded).values!.length : 0;
    _eliudStyleAttributessListSubscription?.cancel();
    _eliudStyleAttributessListSubscription = _eliudStyleAttributesRepository.listenWithDetails(
            (list) => add(EliudStyleAttributesListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * eliudStyleAttributesLimit : null
    );
  }

  Stream<EliudStyleAttributesListState> _mapAddEliudStyleAttributesListToState(AddEliudStyleAttributesList event) async* {
    var value = event.value;
    if (value != null) 
      _eliudStyleAttributesRepository.add(value);
  }

  Stream<EliudStyleAttributesListState> _mapUpdateEliudStyleAttributesListToState(UpdateEliudStyleAttributesList event) async* {
    var value = event.value;
    if (value != null) 
      _eliudStyleAttributesRepository.update(value);
  }

  Stream<EliudStyleAttributesListState> _mapDeleteEliudStyleAttributesListToState(DeleteEliudStyleAttributesList event) async* {
    var value = event.value;
    if (value != null) 
      _eliudStyleAttributesRepository.delete(value);
  }

  Stream<EliudStyleAttributesListState> _mapEliudStyleAttributesListUpdatedToState(
      EliudStyleAttributesListUpdated event) async* {
    yield EliudStyleAttributesListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<EliudStyleAttributesListState> mapEventToState(EliudStyleAttributesListEvent event) async* {
    if (event is LoadEliudStyleAttributesList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadEliudStyleAttributesListToState();
      } else {
        yield* _mapLoadEliudStyleAttributesListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadEliudStyleAttributesListWithDetailsToState();
    } else if (event is AddEliudStyleAttributesList) {
      yield* _mapAddEliudStyleAttributesListToState(event);
    } else if (event is UpdateEliudStyleAttributesList) {
      yield* _mapUpdateEliudStyleAttributesListToState(event);
    } else if (event is DeleteEliudStyleAttributesList) {
      yield* _mapDeleteEliudStyleAttributesListToState(event);
    } else if (event is EliudStyleAttributesListUpdated) {
      yield* _mapEliudStyleAttributesListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _eliudStyleAttributessListSubscription?.cancel();
    return super.close();
  }
}


