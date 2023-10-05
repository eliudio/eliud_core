import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/frontend/has_button.dart';

typedef ExtensionTypeFieldTrigger = Function(String? value);

class ExtensionTypeField extends StatefulWidget {
  final AppModel app;
  final String? value;
  final ExtensionTypeFieldTrigger trigger;

  ExtensionTypeField(this.app, this.value, this.trigger);

  @override
  ExtensionTypeFieldState createState() {
    return ExtensionTypeFieldState();
  }
}

class ExtensionTypeFieldState extends State<ExtensionTypeField> {
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var extensions = Registry.registry()!.getExtensions();
    var dropDownItems = extensions
        .map((extension) =>
            DropdownMenuItem(value: extension, child: text(widget.app, context, extension)))
        .toList();

    if (extensions.indexWhere((extension) => (extension == value)) == -1) {
      value = null;
    }

    return dropdownButton<String>(
      widget.app, context,
        value: value,
        items: dropDownItems,
        hint: text(widget.app, context, 'Select component type'),
        onChanged: !accessState.memberIsOwner(widget.app.documentID) ? null : _onChangedDropDownItem);
  }

  void _onChangedDropDownItem(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
