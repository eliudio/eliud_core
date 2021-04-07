import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var appState = AccessBloc.getState(context);
    return TextFormField(
      readOnly: !appState.memberIsOwner(),
      initialValue: value,
      style: appState is AppLoaded ? TextStyle(
          color: RgbHelper.color(rgbo: appState.app.formFieldTextColor)) : null,
      decoration: appState is AppLoaded ? InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    RgbHelper.color(rgbo: appState.app.formFieldTextColor))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color:
                    RgbHelper.color(rgbo: appState.app.formFieldFocusColor)) ),
        icon: Icon(Icons.folder,
            color: RgbHelper.color(rgbo: appState.app.formFieldHeaderColor)),
        labelText: widget.label,
        hintText: widget.hint,
      ) : null,
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
