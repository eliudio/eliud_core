import 'package:eliud_core/default_style/frontend/impl/dialog/dialog_helper.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EliudDialogImpl implements HasDialog {
  final Style _style;

  EliudDialogImpl(this._style);

  @override
  void openMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
  }) {
    // MessageDialog
    DialogStatefulWidgetHelper.openIt(
      context,
      _style.frontEndStyle().dialogWidgetStyle().messageDialog(
        context,
        title: title,
        message: message,
      ),
    );
  }

  @override
  void openErrorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  }) =>
      DialogStatefulWidgetHelper.openIt(
        context,
        _style.frontEndStyle().dialogWidgetStyle().errorDialog(
          context,
          title: title,
          errorMessage: errorMessage,
        ),
      );

  @override
  void openAckNackDialog(BuildContext context,
          {required String title,
          required String message,
          required OnSelection onSelection,
          String? ackButtonLabel,
          String? nackButtonLabel}) =>
      DialogStatefulWidgetHelper.openIt(
          context,
          _style.frontEndStyle().dialogWidgetStyle().ackNackDialog(
            context,
            title: title,
            message: message,
            onSelection: onSelection,
            ackButtonLabel: ackButtonLabel,
            nackButtonLabel: nackButtonLabel,
          ));

  @override
  void openEntryDialog(BuildContext context,
          {required String title,
          String? ackButtonLabel,
          String? nackButtonLabel,
          String? hintText,
          required Function(String? response) onPressed,
          String? initialValue}) =>
      DialogStatefulWidgetHelper.openIt(
        context,
        _style.frontEndStyle().dialogWidgetStyle().entryDialog(
          context,
          title: title,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          hintText: hintText,
          onPressed: onPressed,
          initialValue: initialValue,
        ),
      );

  @override
  void openSelectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel}) {
    DialogStatefulWidgetHelper.openIt(
        context,
        _style.frontEndStyle().dialogWidgetStyle().selectionDialog(
          context,
          title: title,
          options: options,
          buttonLabel: buttonLabel,
          onSelection: onSelection,
        ));
  }

  @override
  void openComplexDialog(BuildContext context,
          {required String title,
          required Widget child,
          VoidCallback? onPressed,
          String? buttonLabel}) =>
      DialogStatefulWidgetHelper.openIt(
          context,
          _style.frontEndStyle().dialogWidgetStyle().complexDialog(
            context,
            title: title,
            child: child,
            onPressed: onPressed,
            buttonLabel: buttonLabel,
          ));

  @override
  void openFlexibleDialog(BuildContext context,
      {required String title,
      required Widget child,
      required List<Widget> buttons}) {
    DialogStatefulWidgetHelper.openIt(context,
        _style.frontEndStyle().dialogWidgetStyle().flexibleDialog(context, title: title, child: child, buttons: buttons));
  }

  @override
  void openWidgetDialog(BuildContext context, {required Widget child}) {
    DialogStatefulWidgetHelper.openIt(context, child);
  }
}
