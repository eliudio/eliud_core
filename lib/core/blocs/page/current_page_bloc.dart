import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

import 'current_page_event.dart';
import 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, CurrentPageState> {
  StreamSubscription? _pageSubscription;
  StreamSubscription? _appSubscription;

  void _mapLoadCurrentPageUpdateToState(
      String appId, String pageId) {
    _pageSubscription?.cancel();
    _pageSubscription = pageRepository(appId: appId)!.listenTo(pageId, (value) {
      if (value != null) add(CurrentPageUpdated(page: value));
    }, errorHandler: (x, y) {
      add(ErrorLoadingPage(appId: appId, pageId: pageId));
    });

    _appSubscription?.cancel();
    _appSubscription = appRepository()!.listenTo(appId, (value) {
      if (value != null) add(CurrentAppUpdated(app: value));
    });
  }

  CurrentPageBloc() : super(CurrentPageUninitialized()) {
    on<FetchCurrentPage>((event, emit) =>
        _mapLoadCurrentPageUpdateToState(event.appId, event.pageId));
    on<CurrentPageUpdated>((event, emit) async {
      var app = await appRepository()!.get(event.page.appId);
      emit(CurrentPageLoaded(page: event.page, app: app!));
    });

    on<CurrentAppUpdated>((event, emit) {
      var theState = state;
      if (theState is CurrentPageLoaded) {
        emit(CurrentPageLoaded(page: theState.page, app: event.app));
      }
    });

    on<ErrorLoadingPage>((event, emit) async {
      var theState = state;
      var app = await appRepository()!.get(event.appId);
      if (app != null) {
        emit(CurrentPageLoadError(app: app!, pageId: event.pageId));
      } else {
        print("App " + event.appId + " not available whilst trying to load the page " + event.pageId);
      }
    });
  }

  @override
  Future<void> close() {
    _pageSubscription?.cancel();
    _appSubscription?.cancel();
    return super.close();
  }
}
