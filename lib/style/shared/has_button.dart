import 'package:flutter/material.dart';

abstract class HasButton {
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});
  Widget buttonWithChild(BuildContext context,
      {Icon? icon, required Widget child, VoidCallback? onPressed});
  Widget dialogButton(BuildContext context,
      {VoidCallback? onPressed, required String label});
  List<Widget> dialogButtons(BuildContext context, {required List<String> labels,
    required List<VoidCallback?> functions});
}
