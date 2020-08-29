import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'navigation_event.dart';
import 'router.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorBloc({this.navigatorKey}): super(0);

  @override
  Stream<dynamic> mapEventToState(NavigatorEvent event) async* {
    if (event is Pop) {
      navigatorKey.currentState.pop();
    } else if (event is JustASecond) {
      yield navigatorKey.currentState.pushReplacementNamed(Router.justASecond, arguments: event.message);
    } if (event is GoHome) {
      yield navigatorKey.currentState.pushNamed(Router.homeRoute);
    } else if (event is GoToPageEvent) {
      yield navigatorKey.currentState.pushReplacementNamed(Router.pageRoute, arguments: Arguments(event.ID, event.parameters));
    }
  }
}
