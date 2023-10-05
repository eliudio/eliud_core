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

  PopupMenuItem<T> popupMenuItem<T>(AppModel app, BuildContext context,
      {required String label, bool enabled = true, T? value});
  PopupMenuDivider popupMenuDivider(AppModel app, BuildContext context);
  PopupMenuButton<T> popupMenuButton<T>(AppModel app, BuildContext context,
      {String? tooltip,
      Widget? icon,
      Widget? child,
      required PopupMenuItemBuilder<T> itemBuilder,
      PopupMenuItemSelected<T>? onSelected});

  DropdownButton<T> dropdownButton<T>(
    AppModel app,
    BuildContext context, {
    T? value,
    List<DropdownMenuItem<T>>? items,
    Widget? hint,
    ValueChanged<T?>? onChanged,
    bool isDense = false,
    bool isExpanded = false,
  });
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

PopupMenuItem<T> popupMenuItem<T>(AppModel app, BuildContext context,
        {required String label, bool enabled = true, T? value}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .popupMenuItem(app, context,
            label: label, enabled: enabled, value: value);

PopupMenuDivider popupMenuDivider(AppModel app, BuildContext context) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .popupMenuDivider(app, context);

PopupMenuButton<T> popupMenuButton<T>(AppModel app, BuildContext context,
        {String? tooltip,
        Widget? icon,
        Widget? child,
        required PopupMenuItemBuilder<T> itemBuilder,
        PopupMenuItemSelected<T>? onSelected}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .popupMenuButton(app, context,
            tooltip: tooltip,
            icon: icon,
            child: child,
            itemBuilder: itemBuilder,
            onSelected: onSelected);

DropdownButton<T> dropdownButton<T>(AppModel app, BuildContext context,
        {T? value,
        List<DropdownMenuItem<T>>? items,
        Widget? hint,
        ValueChanged<T?>? onChanged,
          bool isDense = false,
          bool isExpanded = false,}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .buttonStyle()
        .dropdownButton(app, context,
            value: value, items: items, hint: hint, onChanged: onChanged, isDense: isDense, isExpanded: isExpanded);
