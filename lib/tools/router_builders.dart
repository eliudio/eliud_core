import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/style/frontend/has_page_route_builder.dart' as pr;

// fadeTransition
abstract class SlideRoute extends PageRouteBuilder {
  final Widget? page;
  final int milliseconds;
  final Offset? begin;
  final Offset? end;

  SlideRoute(
      {String? name,
      Map<String, dynamic>? parameters,
      this.page,
      required this.milliseconds,
      this.begin,
      this.end})
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
  RightToLeftRoute(
      {super.name, super.parameters, super.page, required super.milliseconds})
      : super(begin: Offset(1.0, 0.0), end: Offset.zero);
}

class BottomToTopRoute extends SlideRoute {
  BottomToTopRoute(
      {super.name, super.parameters, super.page, required super.milliseconds})
      : super(begin: Offset(0.0, 1.0), end: Offset.zero);
}

class ScaleRoute extends PageRouteBuilder {
  final Widget? page;
  final int milliseconds;

  ScaleRoute(
      {String? name,
      Map<String, dynamic>? parameters,
      this.page,
      required this.milliseconds})
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

  RotationRoute(
      {String? name,
      Map<String, dynamic>? parameters,
      this.page,
      required this.milliseconds})
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

  FadeRoute(
      {String? name,
      Map<String, dynamic>? parameters,
      this.page,
      required this.milliseconds})
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

String getName(String appId, String? pageId) =>
    appId + ((pageId == null) ? '/?' : '/$pageId');

PageRouteBuilder pageRouteBuilderWithAppId(AccessState state, String appId,
    {String? pageId, Map<String, dynamic>? parameters, required Widget page}) {
  var name = getName(appId, pageId);
  if (state is AccessDetermined) {
    var app = state.getApp(appId);
    if (app != null) {
      return pr.pageRoute(app, name, parameters, page);
    }
  }
  return FadeRoute(
      name: name, parameters: parameters, page: page, milliseconds: 1000);
}

PageRouteBuilder pageRouteBuilder(AppModel app,
    {String? pageId, Map<String, dynamic>? parameters, required Widget page}) {
  return FadeRoute(
      name: app.documentID + ((pageId == null) ? '/?' : '/$pageId'),
      parameters: parameters,
      page: page,
      milliseconds: 1000);
}
