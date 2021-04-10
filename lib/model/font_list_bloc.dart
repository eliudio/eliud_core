/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/font_repository.dart';
import 'package:eliud_core/model/font_list_event.dart';
import 'package:eliud_core/model/font_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _fontLimit = 5;

class FontListBloc extends Bloc<FontListEvent, FontListState> {
  final FontRepository _fontRepository;
  StreamSubscription? _fontsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  FontListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FontRepository fontRepository})
      : assert(fontRepository != null),
        _fontRepository = fontRepository,
        super(FontListLoading());

  Stream<FontListState> _mapLoadFontListToState() async* {
    int amountNow =  (state is FontListLoaded) ? (state as FontListLoaded).values!.length : 0;
    _fontsListSubscription?.cancel();
    _fontsListSubscription = _fontRepository.listen(
          (list) => add(FontListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _fontLimit : null
    );
  }

  Stream<FontListState> _mapLoadFontListWithDetailsToState() async* {
    int amountNow =  (state is FontListLoaded) ? (state as FontListLoaded).values!.length : 0;
    _fontsListSubscription?.cancel();
    _fontsListSubscription = _fontRepository.listenWithDetails(
            (list) => add(FontListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _fontLimit : null
    );
  }

  Stream<FontListState> _mapAddFontListToState(AddFontList event) async* {
    var value = event.value;
    if (value != null) 
      _fontRepository.add(value);
  }

  Stream<FontListState> _mapUpdateFontListToState(UpdateFontList event) async* {
    var value = event.value;
    if (value != null) 
      _fontRepository.update(value);
  }

  Stream<FontListState> _mapDeleteFontListToState(DeleteFontList event) async* {
    var value = event.value;
    if (value != null) 
      _fontRepository.delete(value);
  }

  Stream<FontListState> _mapFontListUpdatedToState(
      FontListUpdated event) async* {
    yield FontListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FontListState> mapEventToState(FontListEvent event) async* {
    if (event is LoadFontList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFontListToState();
      } else {
        yield* _mapLoadFontListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadFontListWithDetailsToState();
    } else if (event is AddFontList) {
      yield* _mapAddFontListToState(event);
    } else if (event is UpdateFontList) {
      yield* _mapUpdateFontListToState(event);
    } else if (event is DeleteFontList) {
      yield* _mapDeleteFontListToState(event);
    } else if (event is FontListUpdated) {
      yield* _mapFontListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _fontsListSubscription?.cancel();
    return super.close();
  }
}


