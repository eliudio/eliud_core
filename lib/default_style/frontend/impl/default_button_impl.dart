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
      return GestureDetector(
          onTap: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: _frontEndStyle.containerStyle()
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
          child: _frontEndStyle.containerStyle().actionContainer(
              context,
              child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: _frontEndStyle.textStyle()
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
          ? _frontEndStyle.textStyle().text(context, label)
          : _frontEndStyle.textStyle().highLight1(context, label),
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
    return _frontEndStyle.containerStyle().actionContainer(context,
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
