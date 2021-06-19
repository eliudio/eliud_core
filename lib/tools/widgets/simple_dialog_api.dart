import 'package:eliud_core/tools/widgets/ack_nack_dialog.dart';
import 'package:eliud_core/tools/widgets/request_value_dialog.dart';
import 'package:eliud_core/tools/widgets/widget_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'complex_ack_nack_dialog.dart';
import 'dialog_field.dart';
import 'dialog_helper.dart';
import 'dialog_with_options.dart';
import 'error_dialog.dart';
import 'flexible_dialog.dart';
import 'message_dialog.dart';

typedef OnSelection = void Function(int choice);

class SimpleDialogApi {
  static DialogStateHelper dialogHelper = DialogStateHelper();
/*
  Widget simpleListTileField(BuildContext context, {Widget? leading, ValueChanged? valueChange, required Widget title, String? fieldHintText, String? labelText);
  -> DialogStateHelper().getListTile(title: DialogField(...))

*/

  // *************************************************** For HasOpenDialog
  static void openMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
  }) {
    // MessageDialog
    DialogStatefulWidgetHelper.openIt(
      context,
      messageDialog(
        context,
        title: title,
        message: message,
      ),
    );
  }

  static void openErrorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  }) =>
      DialogStatefulWidgetHelper.openIt(
        context,
        errorDialog(
          context,
          title: title,
          errorMessage: errorMessage,
        ),
      );

  static void openAckNackDialog(BuildContext context,
          {required String title,
          required String message,
          required OnSelection onSelection,
          String? ackButtonLabel,
          String? nackButtonLabel}) =>
      DialogStatefulWidgetHelper.openIt(
          context,
          ackNackDialog(
            context,
            title: title,
            message: message,
            onSelection: onSelection,
            ackButtonLabel: ackButtonLabel,
            nackButtonLabel: nackButtonLabel,
          ));

  static void openEntryDialog(BuildContext context,
          {required String title,
          String? ackButtonLabel,
          String? nackButtonLabel,
          String? hintText,
          required Function(String? response) onPressed,
          String? initialValue}) =>
      DialogStatefulWidgetHelper.openIt(
        context,
        entryDialog(
          context,
          title: title,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          hintText: hintText,
          onPressed: (value) {
            Navigator.of(context).pop();
            onPressed(value);
          },
          initialValue: initialValue,
        ),
      );

  static void openSelectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel}) {
    DialogStatefulWidgetHelper.openIt(
        context,
        selectionDialog(
          context,
          title: title,
          options: options,
          buttonLabel: buttonLabel,
          onSelection: onSelection,
        ));
  }

  static void openComplexDialog(BuildContext context,
          {required String title,
          required Widget child,
          VoidCallback? onPressed,
          String? buttonLabel}) =>
      DialogStatefulWidgetHelper.openIt(
          context,
          complexDialog(
            context,
            title: title,
            child: child,
            onPressed: () {
              Navigator.of(context).pop();
              if (onPressed != null) {
                onPressed();
              }
            },
            buttonLabel: buttonLabel,
          ));

  static void openFlexibleDialog(BuildContext context,
      {required String title,
      required Widget child,
      required List<Widget> buttons}) {
    DialogStatefulWidgetHelper.openIt(context,
        flexibleDialog(context, title: title, child: child, buttons: buttons));
  }

  // *************************************************** For HasDialog
  static Widget messageDialog(
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

  static Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  }) =>
      ErrorDialog(
        title: title,
        message: errorMessage,
        onPressed: () => Navigator.of(context).pop(),
        buttonLabel: closeLabel,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );

  static Widget ackNackDialog(BuildContext context,
          {required String title,
          required String message,
          required OnSelection onSelection,
          String? ackButtonLabel,
          String? nackButtonLabel}) =>
      AckNackDialog(
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

  static Widget entryDialog(BuildContext context,
          {required String title,
          String? ackButtonLabel,
          String? nackButtonLabel,
          String? hintText,
          required Function(String? response) onPressed,
          String? initialValue}) =>
      RequestValueDialog(
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

  static Widget selectionDialog(BuildContext context,
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
    return DialogWithOptions(
      title: title,
      options: newOptions,
      buttonLabel: buttonLabel,
      dialogButtonPosition: DialogButtonPosition.TopRight,
    );
  }

  static Widget complexAckNackDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
  }) =>
      ComplexAckNackDialog(
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

  static Widget complexDialog(BuildContext context,
          {required String title,
          required Widget child,
          VoidCallback? onPressed,
          String? buttonLabel}) =>
      WidgetDialog(
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

  static Widget flexibleDialog(BuildContext context,
      {required String title,
      required Widget child,
      required List<Widget> buttons}) {
    return FlexibleDialog(
        title: title,
        widget: child,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        buttons: buttons);
  }

  // *************************************************** For HasDialogField
  static Widget dialogField(BuildContext context,
      {InputDecoration? decoration,
      required ValueChanged<String> valueChanged,
      String? initialValue}) {
    return DialogField(
        decoration: decoration,
        valueChanged: valueChanged,
        initialValue: initialValue);
  }
}
