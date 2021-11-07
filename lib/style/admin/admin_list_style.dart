import 'package:flutter/material.dart';

abstract class AdminListStyle {
  Widget floatingActionButton(BuildContext context, String heroTag,
      Widget child, {VoidCallback? onPressed});
  Widget divider(BuildContext context);
  BoxDecoration? boxDecorator(BuildContext context);
  Widget listItem(BuildContext context, String text);
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor});
}
