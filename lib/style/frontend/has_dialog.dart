import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'has_dialog_widget.dart';

abstract class HasDialog {
  void openMessageDialog(BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
  });

  void openErrorDialog(BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  });

  void openAckNackDialog(BuildContext context,
      {required String title,
        required String message,
        required OnSelection onSelection,
        String? ackButtonLabel,
        String? nackButtonLabel});

  void openEntryDialog(BuildContext context,
      {required String title,
        String? ackButtonLabel,
        String? nackButtonLabel,
        String? hintText,
        required Function(String? response) onPressed,
        String? initialValue});

  void openSelectionDialog(BuildContext context,
      {required String title,
        required List<String> options,
        required OnSelection onSelection,
        String? buttonLabel});

  void openComplexDialog(BuildContext context,
      {required String title,
        required Widget child,
        VoidCallback? onPressed,
        String? buttonLabel});

  void openFlexibleDialog(BuildContext context,
      {required String title,
        required Widget child,
        required List<Widget> buttons});

  void openWidgetDialog(BuildContext context, {required Widget child});
}
