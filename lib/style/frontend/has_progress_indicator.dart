import 'package:flutter/material.dart';

abstract class HasProgressIndicator {
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor});
  Widget progressIndicatorWithValue(BuildContext context, {Animation<Color>? valueColor, required double value});
}
