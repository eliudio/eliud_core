import 'package:eliud_core/default_style/frontend/impl/dialog/request_value_dialog.dart';
import 'package:eliud_core/default_style/frontend/impl/dialog/widget_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';
import 'dialog/ack_nack_dialog.dart';
import 'dialog/complex_ack_nack_dialog.dart';
import 'dialog/dialog_helper.dart';
import 'dialog/dialog_with_options.dart';
import 'dialog/error_dialog.dart';
import 'dialog/flexible_dialog.dart';

class EliudDialogWidgetImpl implements HasDialogWidget {
  final EliudStyle _eliudStyle;

  EliudDialogWidgetImpl(this._eliudStyle);

  @override
  Widget messageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
  }) {
    // MessageDialog
    return messageDialog(
      context,
      title: title,
      message: message,
      closeLabel: closeLabel,
    );
  }

  @override
  Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  }) =>
      ErrorDialog(_eliudStyle.frontEndStyle(),
        title: title,
        message: errorMessage,
        onPressed: () => Navigator.of(context).pop(),
        buttonLabel: closeLabel,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  @override
  Widget ackNackDialog(BuildContext context,
          {required String title,
          required String message,
          required OnSelection onSelection,
          String? ackButtonLabel,
          String? nackButtonLabel}) =>
      AckNackDialog(_eliudStyle.frontEndStyle(),
        title: title,
        message: message,
        ackFunction: () {
          Navigator.of(context).pop();
          onSelection(0);
        },
        nackFunction: () {
          Navigator.of(context).pop();
          onSelection(1);
        },
        ackButtonLabel: ackButtonLabel,
        nackButtonLabel: nackButtonLabel,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  @override
  Widget entryDialog(BuildContext context,
          {required String title,
          String? ackButtonLabel,
          String? nackButtonLabel,
          String? hintText,
          required Function(String? response) onPressed,
          String? initialValue}) =>
      RequestValueDialog(_eliudStyle.frontEndStyle(),
        title: title,
        ackButtonLabel: ackButtonLabel,
        nackButtonLabel: nackButtonLabel,
        hintText: hintText,
        onPressed: (value) {
          Navigator.of(context).pop();
          onPressed(value);
        },
        initialValue: initialValue,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  @override
  Widget selectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel}) {
    var newOptions = <DialogOption>[];
    for (var i = 0; i < options.length; i++) {
      newOptions.add(DialogOption(
          value: options[i],
          optionTriggered: () {
            Navigator.of(context).pop();
            onSelection(i);
          }));
    }
    return DialogWithOptions(_eliudStyle.frontEndStyle(),
      title: title,
      options: newOptions,
      buttonLabel: buttonLabel,
      dialogButtonPosition: DialogButtonPosition.TopRight,
    );
  }

  @override
  Widget complexAckNackDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
  }) =>
      ComplexAckNackDialog(_eliudStyle.frontEndStyle(),
        title: title,
        widget: child,
        ackFunction: () {
          Navigator.of(context).pop();
          onSelection(0);
        },
        nackFunction: () {
          Navigator.of(context).pop();
          onSelection(1);
        },
        ackButtonLabel: ackButtonLabel,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  @override
  Widget complexDialog(BuildContext context,
          {required String title,
          required Widget child,
          VoidCallback? onPressed,
          String? buttonLabel}) =>
      WidgetDialog(_eliudStyle.frontEndStyle(),
        title: title,
        widget: child,
        onPressed: () {
          Navigator.of(context).pop();
          if (onPressed != null) {
            onPressed();
          }
        },
        buttonLabel: buttonLabel,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  @override
  Widget flexibleDialog(BuildContext context,
      {required String title,
      required Widget child,
      required List<Widget> buttons}) {
    return FlexibleDialog(_eliudStyle.frontEndStyle(),
        title: title,
        widget: child,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        buttons: buttons);
  }
}
