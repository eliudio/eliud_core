/*
 Bespoke code Icon
*/

import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/style.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../model/icon_model.dart';

typedef ChangeIconField = Function(IconModel value);

class IconField extends StatefulWidget {
  final IconModel? iconModel;
  final ChangeIconField trigger;

  IconField(this.iconModel, this.trigger);

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
    return button(context, label: 'Select Icon', icon: _icon, onPressed: _pickIcon);
  }

  void _pickIcon() async {
    var iconData = await (FlutterIconPicker.showIconPicker(context,
        iconSize: 40,
        iconPickerShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title:
            Text('Pick an icon', style: TextStyle(fontWeight: FontWeight.bold)),
        closeChild: Text(
          'Close',
          textScaleFactor: 1.25,
        ),
        searchHintText: 'Search icon...',
        noResultsText: 'No results for:')) ;

    if (iconData != null) {
      _icon = Icon(iconData);
      widget.trigger(
          IconModel(
              codePoint: iconData.codePoint, fontFamily: 'MaterialIcons'));
      setState(() {});
    }
  }
}
