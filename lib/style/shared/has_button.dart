import 'package:flutter/material.dart';

abstract class HasButton {
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});
  Widget buttonWithChild(BuildContext context,
      {Icon? icon, required Widget child, VoidCallback? onPressed});
}
