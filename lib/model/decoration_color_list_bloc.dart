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


const _decorationColorLimit = 5;

class DecorationColorListBloc extends Bloc<DecorationColorListEvent, DecorationColorListState> {
  final DecorationColorRepository _decorationColorRepository;
  StreamSubscription? _decorationColorsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  DecorationColorListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DecorationColorRepository decorationColorRepository})
      : assert(decorationColorRepository != null),
        _decorationColorRepository = decorationColorRepository,
        super(DecorationColorListLoading());

  Stream<DecorationColorListState> _mapLoadDecorationColorListToState() async* {
    int amountNow =  (state is DecorationColorListLoaded) ? (state as DecorationColorListLoaded).values!.length : 0;
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listen(
          (list) => add(DecorationColorListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _decorationColorLimit : null
    );
  }

  Stream<DecorationColorListState> _mapLoadDecorationColorListWithDetailsToState() async* {
    int amountNow =  (state is DecorationColorListLoaded) ? (state as DecorationColorListLoaded).values!.length : 0;
    _decorationColorsListSubscription?.cancel();
    _decorationColorsListSubscription = _decorationColorRepository.listenWithDetails(
            (list) => add(DecorationColorListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _decorationColorLimit : null
    );
  }

  Stream<DecorationColorListState> _mapAddDecorationColorListToState(AddDecorationColorList event) async* {
    _decorationColorRepository.add(event.value);
  }

  Stream<DecorationColorListState> _mapUpdateDecorationColorListToState(UpdateDecorationColorList event) async* {
    _decorationColorRepository.update(event.value);
  }

  Stream<DecorationColorListState> _mapDeleteDecorationColorListToState(DeleteDecorationColorList event) async* {
    _decorationColorRepository.delete(event.value);
  }

  Stream<DecorationColorListState> _mapDecorationColorListUpdatedToState(
      DecorationColorListUpdated event) async* {
    yield DecorationColorListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DecorationColorListState> mapEventToState(DecorationColorListEvent event) async* {
    if (event is LoadDecorationColorList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDecorationColorListToState();
      } else {
        yield* _mapLoadDecorationColorListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDecorationColorListWithDetailsToState();
    } else if (event is AddDecorationColorList) {
      yield* _mapAddDecorationColorListToState(event);
    } else if (event is UpdateDecorationColorList) {
      yield* _mapUpdateDecorationColorListToState(event);
    } else if (event is DeleteDecorationColorList) {
      yield* _mapDeleteDecorationColorListToState(event);
    } else if (event is DecorationColorListUpdated) {
      yield* _mapDecorationColorListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _decorationColorsListSubscription?.cancel();
    return super.close();
  }
}


