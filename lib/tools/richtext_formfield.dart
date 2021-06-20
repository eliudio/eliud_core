import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/style/style_registry.dart';
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
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().texFormFieldStyle().textFormField(context,
    readOnly: !appState.memberIsOwner(),
    initialValue: value,
    onChanged: _onChanged,
    keyboardType: TextInputType.multiline,
    maxLines: widget.rows,
    );
  }

  void _onChanged(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
