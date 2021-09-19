import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasButton {
  // Most common button(s), e.g. to confirm a form
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});
  // Search for OutlineButton and RaisedButton

  // Simpler button, e.g. the 'like' or 'reply' button below a post in a feed
  Widget simpleButton(BuildContext context,
      {VoidCallback? onPressed, required String label});
  // Search for FlatButton and TextButton, take all inputs for the input of this method and copy it's implementation

  // Button in a dialog, e.g. to close the dialog
  Widget dialogButton(BuildContext context,
      {VoidCallback? onPressed, required String label, bool? selected});
  List<Widget> dialogButtons(BuildContext context,
      {required List<String> labels, required List<VoidCallback?> functions});

  // Button with icon only
  Widget iconButton(BuildContext context,
      {VoidCallback? onPressed,
      Color? color,
      String? tooltip,
      required Widget icon});
}

Widget button(BuildContext context,
        {Icon? icon, required String label, VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .buttonStyle()
        .button(context, icon: icon, label: label, onPressed: onPressed);

Widget simpleButton(BuildContext context,
        {VoidCallback? onPressed, required String label}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .buttonStyle()
        .simpleButton(context, onPressed: onPressed, label: label);

Widget dialogButton(BuildContext context,
        {VoidCallback? onPressed, required String label, bool? selected}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .buttonStyle()
        .dialogButton(context,
            onPressed: onPressed, label: label, selected: selected);

List<Widget> dialogButtons(BuildContext context,
        {required List<String> labels,
        required List<VoidCallback?> functions}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .buttonStyle()
        .dialogButtons(context, labels: labels, functions: functions);

Widget iconButton(BuildContext context,
        {VoidCallback? onPressed,
        Color? color,
        String? tooltip,
        required Widget icon}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .buttonStyle()
        .iconButton(context,
            onPressed: onPressed, color: color, tooltip: tooltip, icon: icon);
