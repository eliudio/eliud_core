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

import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/model/page_list_event.dart';
import 'package:eliud_core/model/page_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'page_model.dart';

typedef FilterPageModels = List<PageModel?> Function(List<PageModel?> values);

class PageListBloc extends Bloc<PageListEvent, PageListState> {
  final FilterPageModels? filter;
  final PageRepository _pageRepository;
  StreamSubscription? _pagesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int pageLimit;

  PageListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PageRepository pageRepository,
      this.pageLimit = 5})
      : _pageRepository = pageRepository,
        super(PageListLoading()) {
    on<LoadPageList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPageListToState();
      } else {
        _mapLoadPageListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPageListWithDetailsToState();
    });

    on<PageChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPageListToState();
      } else {
        _mapLoadPageListWithDetailsToState();
      }
    });

    on<AddPageList>((event, emit) async {
      await _mapAddPageListToState(event);
    });

    on<UpdatePageList>((event, emit) async {
      await _mapUpdatePageListToState(event);
    });

    on<DeletePageList>((event, emit) async {
      await _mapDeletePageListToState(event);
    });

    on<PageListUpdated>((event, emit) {
      emit(_mapPageListUpdatedToState(event));
    });
  }

  List<PageModel?> _filter(List<PageModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPageListToState() async {
    int amountNow = (state is PageListLoaded)
        ? (state as PageListLoaded).values!.length
        : 0;
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listen(
        (list) => add(PageListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * pageLimit : null);
  }

  Future<void> _mapLoadPageListWithDetailsToState() async {
    int amountNow = (state is PageListLoaded)
        ? (state as PageListLoaded).values!.length
        : 0;
    _pagesListSubscription?.cancel();
    _pagesListSubscription = _pageRepository.listenWithDetails(
        (list) => add(PageListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * pageLimit : null);
  }

  Future<void> _mapAddPageListToState(AddPageList event) async {
    var value = event.value;
    if (value != null) {
      await _pageRepository.add(value);
    }
  }

  Future<void> _mapUpdatePageListToState(UpdatePageList event) async {
    var value = event.value;
    if (value != null) {
      await _pageRepository.update(value);
    }
  }

  Future<void> _mapDeletePageListToState(DeletePageList event) async {
    var value = event.value;
    if (value != null) {
      await _pageRepository.delete(value);
    }
  }

  PageListLoaded _mapPageListUpdatedToState(PageListUpdated event) =>
      PageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _pagesListSubscription?.cancel();
    return super.close();
  }
}
