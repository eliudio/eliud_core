/*
 Bespoke code Icon
*/

import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/icon_model.dart';
import 'package:eliud_core_model/style/frontend/has_button.dart';
import 'package:eliud_core_model/widgets/icon/icon_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ChangeIconField = Function(IconModel value);

class IconField extends StatefulWidget {
  final AppModel app;
  final IconModel? iconModel;
  final ChangeIconField trigger;

  IconField(this.app, this.iconModel, this.trigger);

  @override
  State<IconField> createState() {
    return IconFieldState();
  }
}

class IconFieldState extends State<IconField> {
  Icon? _icon;

  @override
  void initState() {
    super.initState();
    if (widget.iconModel != null) {
      _icon = Icon(IconData(widget.iconModel!.codePoint!,
          fontFamily: widget.iconModel!.fontFamily));
    }
  }

  @override
  Widget build(BuildContext context) {
    return button(widget.app, context,
        label: 'Select Icon', icon: _icon, onPressed: _pickIcon);
  }

  void _pickIcon() async {
    var iconData = await (showIconPicker(
        app: widget.app,
        context: context,
        defaultIcon: IconData(widget.iconModel!.codePoint!,
            fontFamily: widget.iconModel!.fontFamily)));

    if (iconData != null) {
      _icon = Icon(iconData);
      widget.trigger(IconModel(
          codePoint: iconData.codePoint, fontFamily: 'MaterialIcons'));
      setState(() {});
    }
  }
}
