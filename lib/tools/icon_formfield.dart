/*
 Bespoke code Icon
*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
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
    var appState = AccessBloc.getState(context);
    if ((appState is AppLoaded) && (_icon != null)) {
      return RaisedButton.icon(
          onPressed: !appState.memberIsOwner() ? null : _pickIcon,
          icon: _icon!,
          label: Text('Select Icon'),
          color: RgbHelper.color(rgbo: appState.app.formSubmitButtonColor));
    } else {
      return RaisedButton(
        onPressed: _pickIcon,
        child: Text('Select Icon'),
      );
    }
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
