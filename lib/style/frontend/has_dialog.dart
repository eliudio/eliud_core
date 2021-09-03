import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'has_dialog_widget.dart';

abstract class HasDialog {
  void openMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
  });

  void openErrorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
  });

  void openAckNackDialog(
    BuildContext context, {
    required String title,
    required String message,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    double? widthFraction, // percentage of screen width
  });

  void openEntryDialog(
    BuildContext context, {
    required String title,
    String? ackButtonLabel,
    String? nackButtonLabel,
    String? hintText,
    required Function(String? response) onPressed,
    String? initialValue,
    double? widthFraction, // percentage of screen width
  });

  void openSelectionDialog(
    BuildContext context, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
  });

  void openComplexDialog(BuildContext context,
      {required String title,
      required Widget child,
      VoidCallback? onPressed,
      String? buttonLabel,
      double? widthFraction // percentage of screen width
      });

  void openFlexibleDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required List<Widget> buttons,
    double? widthFraction, // percentage of screen width
  });

  void openWidgetDialog(
    BuildContext context, {
    required Widget child,
  });
}
