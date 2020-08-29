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

import 'font_repository.dart';
import 'font_list_event.dart';
import 'font_list_state.dart';


class FontListBloc extends Bloc<FontListEvent, FontListState> {
  final FontRepository _fontRepository;
  StreamSubscription _fontsListSubscription;

  FontListBloc({ @required FontRepository fontRepository })
      : assert(fontRepository != null),
      _fontRepository = fontRepository,
      super(FontListLoading());

  Stream<FontListState> _mapLoadFontListToState() async* {
    _fontsListSubscription?.cancel();
    _fontsListSubscription = _fontRepository.listen((list) => add(FontListUpdated(value: list)));
  }

  Stream<FontListState> _mapLoadFontListWithDetailsToState() async* {
    _fontsListSubscription?.cancel();
    _fontsListSubscription = _fontRepository.listenWithDetails((list) => add(FontListUpdated(value: list)));
  }

  Stream<FontListState> _mapAddFontListToState(AddFontList event) async* {
    _fontRepository.add(event.value);
  }

  Stream<FontListState> _mapUpdateFontListToState(UpdateFontList event) async* {
    _fontRepository.update(event.value);
  }

  Stream<FontListState> _mapDeleteFontListToState(DeleteFontList event) async* {
    _fontRepository.delete(event.value);
  }

  Stream<FontListState> _mapFontListUpdatedToState(FontListUpdated event) async* {
    yield FontListLoaded(values: event.value);
  }


  @override
  Stream<FontListState> mapEventToState(FontListEvent event) async* {
    final currentState = state;
    if (event is LoadFontList) {
      yield* _mapLoadFontListToState();
    } if (event is LoadFontListWithDetails) {
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


