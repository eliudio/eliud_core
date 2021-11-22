import 'package:eliud_core/model/app_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// fadeTransition
abstract class SlideRoute extends PageRouteBuilder {
  final Widget? page;
  final int milliseconds;
  final Offset? begin;
  final Offset? end;

  SlideRoute({String? name, Map<String, dynamic>? parameters, this.page, required this.milliseconds, this.begin, this.end})
      : super(
          settings: RouteSettings(name: name, arguments: parameters),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page!;
          },
          transitionDuration: Duration(milliseconds: milliseconds),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: begin,
                end: end,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class RightToLeftRoute extends SlideRoute {
  RightToLeftRoute({String? name, Map<String, dynamic>? parameters, Widget? page, required int milliseconds})
      : super(
            name: name,
            parameters: parameters,
            page: page,
            milliseconds: milliseconds,
            begin: Offset(1.0, 0.0),
            end: Offset.zero);
}

class BottomToTopRoute extends SlideRoute {
  BottomToTopRoute({String? name, Map<String, dynamic>? parameters, Widget? page, required int milliseconds})
      : super(
            name: name,
            parameters: parameters,
            page: page,
            milliseconds: milliseconds,
            begin: Offset(0.0, 1.0),
            end: Offset.zero);
}

class ScaleRoute extends PageRouteBuilder {
  final Widget? page;
  final int milliseconds;

  ScaleRoute({String? name, Map<String, dynamic>? parameters, this.page, required this.milliseconds})
      : super(
        settings: RouteSettings(name: name, arguments: parameters),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
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
  final Widget? page;
  final int milliseconds;

  RotationRoute({String? name, Map<String, dynamic>? parameters, this.page, required this.milliseconds})
      : super(
          settings: RouteSettings(name: name, arguments: parameters),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
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
  final Widget? page;
  final int milliseconds;

  FadeRoute({String? name, Map<String, dynamic>? parameters, this.page, required this.milliseconds})
      : super(
          settings: RouteSettings(name: name, arguments: parameters),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
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

PageRouteBuilder pageRouteBuilder(AppModel appModel, {String? pageId, Map<String, dynamic>? parameters, Widget? page}) {
  return pageRouteBuilderWithAppId(appModel.documentID!, pageId: pageId, parameters: parameters, page: page);
}

PageRouteBuilder pageRouteBuilderWithAppId(String appId, {String? pageId, Map<String, dynamic>? parameters, Widget? page}) {
/*
  var milliseconds = app != null ? app.routeAnimationDuration : 1000;
  if (app != null) {
    switch (app.routeBuilder) {
      case PageTransitionAnimation.SlideRightToLeft:
        return RightToLeftRoute(name: app.documentID! + ((pageId == null) ? '' : ((pageId == null) ? '' : '/' + pageId)), parameters: parameters, page: page, milliseconds: milliseconds!);
      case PageTransitionAnimation.SlideBottomToTop:
        return BottomToTopRoute(name: app.documentID! + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: milliseconds!);
      case PageTransitionAnimation.ScaleRoute:
        return ScaleRoute(name: appId + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: 1000);
      case PageTransitionAnimation.RotationRoute:
        return RotationRoute(name: appId + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: 1000);
      case PageTransitionAnimation.FadeRoute:
      */
        return FadeRoute(name: appId + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: 1000);
        /*
      default:
        return FadeRoute(name: app.documentID! + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: 1000);
    }
  }
  return FadeRoute(name: app!.documentID! + ((pageId == null) ? '' : '/' + pageId), parameters: parameters, page: page, milliseconds: 1000);
*/
}
