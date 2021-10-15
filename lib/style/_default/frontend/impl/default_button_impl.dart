import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:flutter/material.dart';

class DefaultButtonImpl implements HasButton {
  final FrontEndStyle _frontEndStyle;

  DefaultButtonImpl(this._frontEndStyle);

  @override
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return iconButton(context, onPressed: onPressed, icon: icon);
    } else {
      return _textButton(context, label: label, onPressed: onPressed);
    }
  }

  Widget _textButton(BuildContext context,
  {VoidCallback? onPressed, required String label, bool? selected}) =>
    TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Colors.pink,
        ),
        child: selected != null && selected ? _frontEndStyle.textStyle().highLight1(context, label) : _frontEndStyle.textStyle().text(context, label)
    );

  @override
  Widget dialogButton(BuildContext context,
      {VoidCallback? onPressed, required String label, bool? selected}) {
    return _textButton(context, label: label, onPressed: onPressed, selected: selected);
  }

  @override
  List<Widget> dialogButtons(BuildContext context,
      {required List<String> labels, required List<VoidCallback?> functions}) {
    if (labels.length != functions.length) {
      throw Exception(
          'Amount of labels of buttons does not correspond functions');
    }
    var buttons = <Widget>[];
    for (var i = 0; i < labels.length; i++) {
      var label = labels[i];
      var function = functions[i];
      buttons.add(dialogButton(context, onPressed: function, label: label));
    }
    return buttons;
  }

  @override
  Widget iconButton(BuildContext context,
      {VoidCallback? onPressed,
      Color? color,
      String? tooltip,
      required Widget icon}) {
    return IconButton(
            icon: icon, color: color, tooltip: tooltip, onPressed: onPressed);
  }

  @override
  Widget simpleButton(BuildContext context,
      {VoidCallback? onPressed, required String label}) {
    throw UnimplementedError();
  }
}
