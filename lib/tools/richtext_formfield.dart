import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef RichTextFieldTrigger(String value);

class RichTextField extends StatefulWidget {
  final AppModel app;
  final String value;
  final RichTextFieldTrigger trigger;
  final String label;
  final String hint;
  final int rows;

  RichTextField(this.app, this.value, this.trigger, this.label, this.hint, this.rows);

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
    return textFormField(widget.app,
      context,
      readOnly: !appState.memberIsOwner(widget.app.documentID),
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
