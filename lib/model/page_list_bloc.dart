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
import 'package:eliud_core/tools/query/query_tools.dart';


const _pageLimit = 5;

class PageListBloc extends Bloc<PageListEvent, PageListState> {
  final PageRepository _pageRepository;
  StreamSubscription _pagesListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  PageListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required PageRepository pageRepository})
      : assert(pageRepository != null),
        _pageRepository = pageRepository,
        super(PageListLoading());

  Stream<PageListState> _mapLoadPageListToState() async* {
    int amountNow =  (state is PageListLoaded) ? (state as PageListLoaded).values.length : 0;
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listen(
          (list) => add(PageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _pageLimit : null
    );
  }

  Stream<PageListState> _mapLoadPageListWithDetailsToState() async* {
    int amountNow =  (state is PageListLoaded) ? (state as PageListLoaded).values.length : 0;
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listenWithDetails(
            (list) => add(PageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _pageLimit : null
    );
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

  Stream<PageListState> _mapPageListUpdatedToState(
      PageListUpdated event) async* {
    yield PageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PageListState> mapEventToState(PageListEvent event) async* {
    if (event is LoadPageList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadPageListToState();
      } else {
        yield* _mapLoadPageListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


