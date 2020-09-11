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
    } else if (event is JustASecond) {
      yield navigatorKey.currentState.pushReplacementNamed(eliudrouter.Router.justASecond, arguments: eliudrouter.Arguments(event.message, null));
    } if (event is GoHome) {
      yield navigatorKey.currentState.pushNamed(eliudrouter.Router.homeRoute);
    } else if (event is GoToPageEvent) {
      yield navigatorKey.currentState.pushReplacementNamed(eliudrouter.Router.pageRoute, arguments: eliudrouter.Arguments(event.ID, event.parameters));
    }
  }
}
