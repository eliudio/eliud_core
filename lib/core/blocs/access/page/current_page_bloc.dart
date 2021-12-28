import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_component_state.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:flutter/services.dart';

import 'current_page_event.dart';
import 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, CurrentPageState> {
  final PageRepository? pageRepository;
  StreamSubscription? _pageSubscription;

  Stream<CurrentPageState> _mapLoadCurrentPageUpdateToState(String documentId) async* {
    _pageSubscription?.cancel();
    _pageSubscription = pageRepository!.listenTo(documentId, (value) {
      if (value != null) add(CurrentPageUpdated(value: value));
    });
  }

  CurrentPageBloc({ this.pageRepository }): super(CurrentPageUninitialized());

  @override
  Stream<CurrentPageState> mapEventToState(CurrentPageEvent event) async* {
    final currentState = state;
    if (event is FetchCurrentPage) {
      yield* _mapLoadCurrentPageUpdateToState(event.id!);
    } else if (event is CurrentPageUpdated) {
      var app = await appRepository()!.get(event.value.appId);
      yield CurrentPageLoaded(value: event.value, app: app!);
    }
  }

  @override
  Future<void> close() {
    _pageSubscription?.cancel();
    return super.close();
  }

}

