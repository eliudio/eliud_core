import 'package:flutter/material.dart';

abstract class HasStyle {
  TextStyle? styleText(BuildContext context);
  TextStyle? styleSmallText(BuildContext context);
  TextStyle? styleHighLight1(BuildContext context);
  TextStyle? styleHighLight2(BuildContext context);
  TextStyle? styleH1(BuildContext context);
  TextStyle? styleH2(BuildContext context);
  TextStyle? styleH3(BuildContext context);
  TextStyle? styleH4(BuildContext context);
  TextStyle? styleH5(BuildContext context);
}
