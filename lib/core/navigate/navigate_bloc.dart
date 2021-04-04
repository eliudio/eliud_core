import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/core/navigate/navigation_event.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorBloc({this.navigatorKey}): super(0);

  @override
  Stream<dynamic> mapEventToState(NavigatorEvent event) async* {
    if (event is Pop) {
      navigatorKey.currentState.pop();
    } else if (event is JustASecondWait) {
      yield navigatorKey.currentState.pushNamed(eliudrouter.Router.justASecond, arguments: eliudrouter.Arguments(event.message, null));
    } if (event is GoHome) {
      if (navigatorKey.currentState != null)
        yield navigatorKey.currentState.pushNamed(eliudrouter.Router.homeRoute);
      else
        yield state;
    } else if (event is MessageEvent) {
      yield navigatorKey.currentState.pushNamed(eliudrouter.Router.messageRoute, arguments: event.message);
    } else if (event is GoToPageEvent) {
      yield navigatorKey.currentState.pushNamed(eliudrouter.Router.pageRoute, arguments: eliudrouter.Arguments(event.ID, event.parameters));
    }
  }
}
