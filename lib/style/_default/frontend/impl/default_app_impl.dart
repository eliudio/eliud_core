import 'package:eliud_core/style/frontend/has_app.dart';
import 'package:flutter/material.dart';

class DefaultAppImpl implements HasApp {
  @override
  // on apple we would possibly use CupertinoApp
  Widget app(
          {Key? key,
          GlobalKey<NavigatorState>? navigatorKey,
          GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
          String? initialRoute,
          RouteFactory? onGenerateRoute,
          RouteFactory? onUnknownRoute,
          required String title}) =>
      MaterialApp(
        key: key,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onUnknownRoute: onUnknownRoute,
        title: title,
      );
}
