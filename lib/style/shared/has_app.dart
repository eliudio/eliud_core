import 'package:flutter/material.dart';

abstract class HasApp {
  Widget app({GlobalKey<NavigatorState>? navigatorKey, GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, String? initialRoute, RouteFactory? onGenerateRoute, RouteFactory? onUnknownRoute, required String title});
}
