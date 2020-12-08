/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/model/page_list_event.dart';
import 'package:eliud_core/model/page_list_state.dart';


class PageListBloc extends Bloc<PageListEvent, PageListState> {
  final PageRepository _pageRepository;
  StreamSubscription _pagesListSubscription;

  PageListBloc({ @required PageRepository pageRepository })
      : assert(pageRepository != null),
      _pageRepository = pageRepository,
      super(PageListLoading());

  Stream<PageListState> _mapLoadPageListToState({ String orderBy, bool descending }) async* {
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listen( (list) => add(PageListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<PageListState> _mapLoadPageListWithDetailsToState() async* {
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listenWithDetails( (list) => add(PageListUpdated(value: list)));
  }

  Stream<PageListState> _mapAddPageListToState(AddPageList event) async* {
    _pageRepository.add(event.value);
  }

  Stream<PageListState> _mapUpdatePageListToState(UpdatePageList event) async* {
    _pageRepository.update(event.value);
  }

  Stream<PageListState> _mapDeletePageListToState(DeletePageList event) async* {
    _pageRepository.delete(event.value);
  }

  Stream<PageListState> _mapPageListUpdatedToState(PageListUpdated event) async* {
    yield PageListLoaded(values: event.value);
  }


  @override
  Stream<PageListState> mapEventToState(PageListEvent event) async* {
    final currentState = state;
    if (event is LoadPageList) {
      yield* _mapLoadPageListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadPageListWithDetails) {
      yield* _mapLoadPageListWithDetailsToState();
    } else if (event is AddPageList) {
      yield* _mapAddPageListToState(event);
    } else if (event is UpdatePageList) {
      yield* _mapUpdatePageListToState(event);
    } else if (event is DeletePageList) {
      yield* _mapDeletePageListToState(event);
    } else if (event is PageListUpdated) {
      yield* _mapPageListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _pagesListSubscription?.cancel();
    return super.close();
  }

}


