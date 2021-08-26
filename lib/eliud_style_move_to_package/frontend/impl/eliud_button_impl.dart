import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudButtonImpl implements HasButton {
  final Style _style;

  EliudButtonImpl(this._style);

  @override
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return GestureDetector(
          onTap: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: _style
                  .frontEndStyle()
                  .containerStyle()
                  .actionContainer(context, child: icon)));

/*
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
      );
*/
    } else {
      return GestureDetector(
          onTap: onPressed,
          child: _style.frontEndStyle().containerStyle().actionContainer(
              context,
              child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: _style
                      .frontEndStyle()
                      .textStyle()
                      .text(context, label))));
/*
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      );
*/
    }
  }

  @override
  Widget dialogButton(BuildContext context,
      {VoidCallback? onPressed, required String label, bool? selected}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Colors.pink,
      ),
      child: selected == null || selected == false
          ? _style.frontEndStyle().textStyle().text(context, label)
          : _style.frontEndStyle().textStyle().highLight1(context, label),
    );
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
    return _style.frontEndStyle().containerStyle().actionContainer(context,
        child: IconButton(
            icon: icon, color: color, tooltip: tooltip, onPressed: onPressed));
  }

  @override
  Widget simpleButton(BuildContext context,
      {VoidCallback? onPressed, required String label}) {
    // TODO: implement simpleButton
    throw UnimplementedError();
  }
}
