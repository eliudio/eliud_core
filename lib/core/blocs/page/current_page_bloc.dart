import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';

import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_component_state.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/services.dart';

import 'current_page_event.dart';
import 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, CurrentPageState> {
  StreamSubscription? _pageSubscription;
  StreamSubscription? _appSubscription;

  Stream<CurrentPageState> _mapLoadCurrentPageUpdateToState(String appId, String pageId) async* {
    _pageSubscription?.cancel();
    _pageSubscription = pageRepository(appId: appId)!.listenTo(pageId, (value) {
      if (value != null) add(CurrentPageUpdated(page: value));
    });

    _appSubscription = appRepository()!.listenTo(appId, (value) {
      if (value != null) add(CurrentAppUpdated(app: value));
    });

  }

  CurrentPageBloc(): super(CurrentPageUninitialized());

  @override
  Stream<CurrentPageState> mapEventToState(CurrentPageEvent event) async* {
    if (event is FetchCurrentPage) {
      yield* _mapLoadCurrentPageUpdateToState(event.appId, event.pageId);
    } else if (event is CurrentPageUpdated) {
      var app = await appRepository()!.get(event.page.appId);
      yield CurrentPageLoaded(page: event.page, app: app!);
    } else if (event is CurrentAppUpdated) {
      var theState = state;
      if (theState is CurrentPageLoaded) {
        yield CurrentPageLoaded(page: theState.page, app: event.app);
      } else {
        print("Unexpected: state is not CurrentPageLoaded, yet we get a CurrentAppUpdated event. Shouldn't be possible");
      }
    }
  }

  @override
  Future<void> close() {
    _pageSubscription?.cancel();
    return super.close();
  }

}

