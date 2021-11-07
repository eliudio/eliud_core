import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/app/app_bloc.dart';
import 'package:eliud_core/style/frontend/has_text_form_field.dart';
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
    var appId = AppBloc.currentAppId(context);
    return textFormField(
      context,
      readOnly: !appState.memberIsOwner(appId),
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
