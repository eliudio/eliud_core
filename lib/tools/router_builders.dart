import 'package:eliud_core/model/app_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// fadeTransition
abstract class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final int milliseconds;
  final Offset begin;
  final Offset end;

  SlideRoute({this.page, this.milliseconds, this.begin, this.end})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: begin,
                end: end,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class RightToLeftRoute extends SlideRoute {
  RightToLeftRoute({Widget page, int milliseconds})
      : super(
            page: page,
            milliseconds: milliseconds,
            begin: Offset(1.0, 0.0),
            end: Offset.zero);
}

class BottomToTopRoute extends SlideRoute {
  BottomToTopRoute({Widget page, int milliseconds})
      : super(
            page: page,
            milliseconds: milliseconds,
            begin: Offset(0.0, 1.0),
            end: Offset.zero);
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  final int milliseconds;

  ScaleRoute({this.page, this.milliseconds})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class RotationRoute extends PageRouteBuilder {
  final Widget page;
  final int milliseconds;

  RotationRoute({this.page, this.milliseconds})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              RotationTransition(
            turns: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              ),
            ),
            child: child,
          ),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final int milliseconds;

  FadeRoute({this.page, this.milliseconds})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

PageRouteBuilder pageRouteBuilder(AppModel app, {Widget page}) {
  debugPrint('pageRouteBuilder()');
  int milliseconds = app != null ? app.routeAnimationDuration : 1000;
  if (app != null) {
    switch (app.routeBuilder) {
      case PageTransitionAnimation.SlideRightToLeft:
        return RightToLeftRoute(page: page, milliseconds: milliseconds);
      case PageTransitionAnimation.SlideBottomToTop:
        return BottomToTopRoute(page: page, milliseconds: milliseconds);
      case PageTransitionAnimation.ScaleRoute:
        return ScaleRoute(page: page, milliseconds: milliseconds);
      case PageTransitionAnimation.RotationRoute:
        return RotationRoute(page: page, milliseconds: milliseconds);
      case PageTransitionAnimation.FadeRoute:
        return FadeRoute(page: page, milliseconds: milliseconds);
      default:
        return FadeRoute(page: page, milliseconds: 1000);
    }
  }
  return FadeRoute(page: page, milliseconds: 1000);
}
