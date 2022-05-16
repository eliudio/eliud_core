import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:flutter/material.dart';

import '../../../frontend/has_text.dart';

class DefaultButtonImpl implements HasButton {
  final FrontEndStyle _frontEndStyle;

  DefaultButtonImpl(this._frontEndStyle);

  @override
  Widget button(AppModel app, BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return iconButton(app, context, onPressed: onPressed, icon: icon);
    } else {
      return _textButton(app, context, label: label, onPressed: onPressed);
    }
  }

  Widget _textButton(AppModel app, BuildContext context,
  {VoidCallback? onPressed, required String label, bool? selected}) =>
    TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.pink,
        ),
        child: selected != null && selected ? _frontEndStyle.textStyle().highLight1(app, context, label) : _frontEndStyle.textStyle().text(app, context, label)
    );

  @override
  Widget dialogButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed, required String label, bool? selected}) {
    return _textButton(app, context, label: label, onPressed: onPressed, selected: selected);
  }

  @override
  List<Widget> dialogButtons(AppModel app, BuildContext context,
      {required List<String> labels, required List<VoidCallback?> functions}) {
    if (labels.length != functions.length) {
      throw Exception(
          'Amount of labels of buttons does not correspond functions');
    }
    var buttons = <Widget>[];
    for (var i = 0; i < labels.length; i++) {
      var label = labels[i];
      var function = functions[i];
      buttons.add(dialogButton(app, context, onPressed: function, label: label));
    }
    return buttons;
  }

  @override
  Widget iconButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed,
      Color? color,
      String? tooltip,
      required Widget icon}) {
    return IconButton(
            icon: icon, color: color, tooltip: tooltip, onPressed: onPressed);
  }

  @override
  Widget simpleButton(AppModel app, BuildContext context,
      {VoidCallback? onPressed, required String label}) {
    return TextButton(onPressed: onPressed, child: text(app, context, label),);
  }

  @override
  PopupMenuItem<T> popupMenuItem<T>(AppModel app, BuildContext context, {required String label, bool enabled = true, T? value}) {
    return PopupMenuItem<T>(child: text(app, context, label), enabled: enabled, value: value);
  }

  @override
  PopupMenuButton<T> popupMenuButton<T>(AppModel app, BuildContext context, {String? tooltip, Widget? child, Widget? icon, required PopupMenuItemBuilder<T> itemBuilder,
      PopupMenuItemSelected<T>? onSelected}) {
    return PopupMenuButton<T>(
        tooltip: tooltip,
        padding: EdgeInsets.all(8.0),
        child: child,
        icon: icon,
        itemBuilder: itemBuilder,
        onSelected: onSelected);
  }

  @override
  PopupMenuDivider popupMenuDivider(AppModel app, BuildContext context) => PopupMenuDivider();
}
