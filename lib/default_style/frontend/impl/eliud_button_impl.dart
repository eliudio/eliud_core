import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../eliud_style.dart';
import 'eliud_menu_impl.dart';

class EliudButtonImpl implements HasButton {
  final EliudStyle _eliudStyle;

  EliudButtonImpl(this._eliudStyle);

  @override
  Widget button(BuildContext context,
      {Icon? icon, required String label, VoidCallback? onPressed}) {
    if (icon != null) {
      return GestureDetector(
        onTap: onPressed,
          child: Padding(padding: const EdgeInsets.all(7.0),
        child: _eliudStyle.frontEndStyle().containerStyle().actionContainer(context,
            child: icon)));

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
          child: _eliudStyle.frontEndStyle().containerStyle().actionContainer(context,
              child: Padding(padding: const EdgeInsets.all(7.0),
              child: Text(label))));
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
      {VoidCallback? onPressed, required String label}) {
    return TextButton(
        onPressed: onPressed,
        child: Text(label));
  }

  @override
  List<Widget> dialogButtons(BuildContext context, {required List<String> labels,
    required List<VoidCallback?> functions}) {
    if (labels.length != functions.length) {
      throw Exception(
          'Amount of labels of buttons does not correspond functions');
    }
    var buttons = <Widget>[];
    for (var i = 0; i < labels.length; i++) {
      var label = labels[i];
      var function = functions[i];
      buttons.add(dialogButton(context,
          onPressed: function, label: label));
    }
    return buttons;
  }

  @override
  Widget iconButton(BuildContext context, {VoidCallback? onPressed, required Icon icon}) {
    // TODO: implement iconButton
    throw UnimplementedError();
  }

  @override
  Widget simpleButton(BuildContext context, {VoidCallback? onPressed, required String label}) {
    // TODO: implement simpleButton
    throw UnimplementedError();
  }

}
