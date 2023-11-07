import 'package:flutter/material.dart';

double fullScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullScreenHeight(BuildContext context) {
  // TODO: Need to find out if the AppBar and BottomNavigationBar are visible on the current screen
  return MediaQuery.of(context).size.height -
      kToolbarHeight // AppBar
      -
      kBottomNavigationBarHeight; // BottomNavigationBar
}

double fullFullScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenRatio(BuildContext context) {
  return fullScreenWidth(context) / fullScreenHeight(context);
}
