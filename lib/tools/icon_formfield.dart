/*
 Bespoke code Icon
*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../model/icon_model.dart';

typedef ChangeIconField(IconModel value);

class IconField extends StatefulWidget {
  final IconModel iconModel;
  final ChangeIconField trigger;

  IconField(this.iconModel, this.trigger);

  @override
  createState() {
    return new IconFieldState();
  }
}

class IconFieldState extends State<IconField> {
  Icon _icon;

  @override
  void initState() {
    super.initState();
    if (widget.iconModel != null)
      _icon = Icon(IconData(widget.iconModel.codePoint, fontFamily: widget.iconModel.fontFamily));
  }

  @override
  Widget build(BuildContext context) {
    if (_icon != null) {
      return RaisedButton.icon(onPressed: !GlobalData.memberIsOwner() ? null : _pickIcon, icon: _icon, label: Text("Select Icon"),
          color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor)
      );
    } else {
      return RaisedButton(
        onPressed: _pickIcon,
        child: Text('Select Icon'),
      );
    }
  }

  _pickIcon() async {
    IconData iconData = await FlutterIconPicker.showIconPicker(context,
        iconSize: 40,
        iconPickerShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text('Pick an icon',
            style: TextStyle(fontWeight: FontWeight.bold)),
        closeChild: Text(
          'Close',
          textScaleFactor: 1.25,
        ),
        searchHintText: 'Search icon...',
        noResultsText: 'No results for:'
    );

    _icon = Icon(iconData);
    widget.trigger(IconModel(codePoint: iconData.codePoint, fontFamily: "MaterialIcons"));
    setState((){});
  }

}
