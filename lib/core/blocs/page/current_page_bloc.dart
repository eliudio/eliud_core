import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'current_page_event.dart';
import 'current_page_state.dart';

class CurrentPageBloc extends Bloc<CurrentPageEvent, CurrentPageState> {
  StreamSubscription? _pageSubscription;
  StreamSubscription? _appSubscription;

  Stream<CurrentPageState> _mapLoadCurrentPageUpdateToState(String appId, String pageId) async* {
    _pageSubscription?.cancel();
//    final waitForFirstToComplete = Completer<void>();
    _pageSubscription = pageRepository(appId: appId)!.listenTo(pageId, (value) {
      if (value != null) add(CurrentPageUpdated(page: value));
/*
      if (!waitForFirstToComplete.isCompleted) {
        waitForFirstToComplete.complete();
      }
*/
    });
/*
    await waitForFirstToComplete.future;
*/

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

