import 'package:eliud_core/style/frontend/has_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../eliud_style.dart';

class EliudAppImpl implements HasApp {
  final EliudStyle _eliudStyle;

  EliudAppImpl(this._eliudStyle);

  @override
  // on apple we would possibly use CupertinoApp
  Widget app(
          {GlobalKey<NavigatorState>? navigatorKey,
          GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
          String? initialRoute,
          RouteFactory? onGenerateRoute,
          RouteFactory? onUnknownRoute,
          required String title}) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: onUnknownRoute,
        title: title,
      );
}
