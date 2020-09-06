import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_model.dart';
import 'package:eliud_core/model/internal_component.dart';

typedef RichTextFieldTrigger(String value);

class RichTextField extends StatefulWidget {
  final String value;
  final RichTextFieldTrigger trigger;
  final String label;
  final String hint;
  final int rows;

  RichTextField(this.value, this.trigger, this.label, this.hint, this.rows);

  @override
  createState() {
    return new RichTextFieldState();
  }
}

class RichTextFieldState extends State<RichTextField> {
  String value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !GlobalData.memberIsOwner(),
      initialValue: value,
      style: TextStyle(
          color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),
        icon: Icon(Icons.folder,
            color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
        labelText: widget.label,
        hintText: widget.hint,
      ),
      onChanged: _onChanged,
      keyboardType: TextInputType.multiline,
      maxLines: widget.rows,
      autovalidate: true,
    );
  }

  void _onChanged(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
