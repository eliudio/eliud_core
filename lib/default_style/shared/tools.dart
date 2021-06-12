import 'package:flutter/cupertino.dart';

class ScreenSize {
  static double width(BuildContext context, {double? fraction }) =>
      MediaQuery.of(context).size.width * (fraction ?? 1);
  static double height(BuildContext context, {double? fraction }) =>
      MediaQuery.of(context).size.height * (fraction ?? 1);
}