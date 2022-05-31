/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/decoration_color_repository.dart';
import 'package:eliud_core/model/decoration_color_list_event.dart';
import 'package:eliud_core/model/decoration_color_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class DecorationColorListBloc extends Bloc<DecorationColorListEvent, DecorationColorListState> {
  final DecorationColorRepository _decorationColorRepository;
  StreamSubscription? _decorationColorsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int decorationColorLimit;

  DecorationColorListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DecorationColorRepository decorationColorRepository, this.decorationColorLimit = 5})
      : assert(decorationColorRepository != null),
        _decorationColorRepository = decorationColorRepository,
        super(DecorationColorListLoading()) {
    on <LoadDecorationColorList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDecorationColorListToState();
      } else {
        _mapLoadDecorationColorListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDecorationColorListWithDetailsToState();
    });
    
    on <DecorationColorChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDecorationColorListToState();
      } else {
        _mapLoadDecorationColorListWithDetailsToState();
      }
    });
      
    on <AddDecorationColorList> ((event, emit) async {
      await _mapAddDecorationColorListToState(event);
    });
    
    on <UpdateDecorationColorList> ((event, emit) async {
      await _mapUpdateDecorationColorListToState(event);
    });
    
    on <DeleteDecorationColorList> ((event, emit) async {
      await _mapDeleteDecorationColorListToState(event);
    });
    
    on <DecorationColorListUpdated> ((event, emit) {
      emit(_mapDecorationColorListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadDecorationColorListToState() async {
    int amountNow =  (state is DecorationColorListLoaded) ? (state as DecorationColorListLoaded).values!.length : 0;
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listen(
          (list) => add(DecorationColorListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * decorationColorLimit : null
    );
  }

  Future<void> _mapLoadDecorationColorListWithDetailsToState() async {
    int amountNow =  (state is DecorationColorListLoaded) ? (state as DecorationColorListLoaded).values!.length : 0;
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listenWithDetails(
            (list) => add(DecorationColorListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * decorationColorLimit : null
    );
  }

  Future<void> _mapAddDecorationColorListToState(AddDecorationColorList event) async {
    var value = event.value;
    if (value != null) {
      await _decorationColorRepository.add(value);
    }
  }

  Future<void> _mapUpdateDecorationColorListToState(UpdateDecorationColorList event) async {
    var value = event.value;
    if (value != null) {
      await _decorationColorRepository.update(value);
    }
  }

  Future<void> _mapDeleteDecorationColorListToState(DeleteDecorationColorList event) async {
    var value = event.value;
    if (value != null) {
      await _decorationColorRepository.delete(value);
    }
  }

  DecorationColorListLoaded _mapDecorationColorListUpdatedToState(
      DecorationColorListUpdated event) => DecorationColorListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _decorationColorsListSubscription?.cancel();
    return super.close();
  }
}


