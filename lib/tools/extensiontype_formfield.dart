import 'package:eliud_core/core/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/tools/registry.dart';

typedef ExtensionTypeFieldTrigger = Function(String value);

class ExtensionTypeField extends StatefulWidget {
  final String value;
  final ExtensionTypeFieldTrigger trigger;

  ExtensionTypeField(this.value, this.trigger);

  @override
  ExtensionTypeFieldState createState() {
    return ExtensionTypeFieldState();
  }
}

class ExtensionTypeFieldState extends State<ExtensionTypeField> {
  String value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var extensions = <String>[];
    Registry.registry().registryMap().forEach((key, value) { extensions.add(key); });
    var dropDownItems = extensions
        .map((extension) =>
            DropdownMenuItem(value: extension, child: Text(extension)))
        .toList();

    if (extensions.indexWhere((extension) => (extension == value)) == -1) {
      value = null;
    }

    return DropdownButton(
        value: value,
        items: dropDownItems,
        hint: Text('Select component type'),
        onChanged: !GlobalData.memberIsOwner() ? null : _onChangedDropDownItem);
  }

  void _onChangedDropDownItem(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
