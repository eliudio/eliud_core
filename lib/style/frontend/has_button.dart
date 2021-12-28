import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasButton {
  // Most common button(s), e.g. to confirm a form
  Widget button(AppModel app, BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed});
  // Search for OutlineButton and RaisedButton

  // Simpler button, e.g. the 'like' or 'reply' button below a post in a feed
  Widget simpleButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed, required String label});
  // Search for FlatButton and TextButton, take all inputs for the input of this method and copy it's implementation

  // Button in a dialog, e.g. to close the dialog
  Widget dialogButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed, required String label, bool? selected});
  List<Widget> dialogButtons(AppModel app, BuildContext context,
      {required List<String> labels, required List<VoidCallback?> functions});

  // Button with icon only
  Widget iconButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed,
      Color? color,
      String? tooltip,
      required Widget icon});
}

Widget button(AppModel app, BuildContext context,
        {Icon? icon, required String label, VoidCallback? onPressed}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .button(app, context, icon: icon, label: label, onPressed: onPressed);

Widget simpleButton(AppModel app, BuildContext context,
        {VoidCallback? onPressed, required String label}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .simpleButton(app, context, onPressed: onPressed, label: label);

Widget dialogButton(AppModel app, BuildContext context,
        {VoidCallback? onPressed, required String label, bool? selected}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .dialogButton(app, context,
            onPressed: onPressed, label: label, selected: selected);

List<Widget> dialogButtons(AppModel app, BuildContext context,
        {required List<String> labels,
        required List<VoidCallback?> functions}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .dialogButtons(app, context, labels: labels, functions: functions);

Widget iconButton(AppModel app, BuildContext context,
        {VoidCallback? onPressed,
        Color? color,
        String? tooltip,
        required Widget icon}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .iconButton(app, context,
            onPressed: onPressed, color: color, tooltip: tooltip, icon: icon);
/*

Widget popupMenuButton(...)

todo

we should also have a "boxed" and "non boxed" parameter for popupMenuButton
as well as for the other buttons so that the iconButton and popupMenuButton
used in paged_posts_lists.dart, line 151 and 203 look the same
*/
