import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogField extends StatefulWidget {
  final InputDecoration? decoration;
  final ValueChanged<String> valueChanged;
  final String? initialValue;

  TextInputType? keyboardType;
  TextCapitalization? textCapitalization;
  TextAlign? textAlign;
  TextAlignVertical? textAlignVertical;
  TextDirection? textDirection;
  bool? readOnly;
  ToolbarOptions? toolbarOptions;
  bool? showCursor;
  bool? autocorrect;
  bool? enableSuggestions;
  int? maxLines;
  int? minLines;
  bool? expands;
  int? maxLength;

  DialogField({
    Key? key,
    this.decoration,
    required this.valueChanged,
    this.initialValue,
    this.keyboardType,
    this.textCapitalization,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly,
    this.toolbarOptions,
    this.showCursor,
    this.autocorrect,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DialogFieldState();
  }
}

class _DialogFieldState extends State<DialogField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_fieldChanged);
    if (widget.initialValue != null) {
      myController.text = widget.initialValue!;
    }
  }

  void _fieldChanged() {
    widget.valueChanged(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: widget.decoration,
      controller: myController,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization == null
          ? TextCapitalization.none
          : widget.textCapitalization!,
      textAlign: widget.textAlign == null ? TextAlign.start : widget.textAlign!,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly == null ? false : widget.readOnly!,
      toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      autocorrect: widget.autocorrect == null ? true : widget.autocorrect!,
      enableSuggestions:
          widget.enableSuggestions == null ? true : widget.enableSuggestions!,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands == null ? false : widget.expands!,
      maxLength: widget.maxLength,
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
