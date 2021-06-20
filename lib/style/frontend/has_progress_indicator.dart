import 'package:flutter/material.dart';

abstract class HasProgressIndicator {
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor});
}
