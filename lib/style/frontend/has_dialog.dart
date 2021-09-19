import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';
import 'has_dialog_widget.dart';

abstract class HasDialog {
  void openMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  });

  void openErrorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  });

  void openAckNackDialog(
    BuildContext context, {
    required String title,
    required String message,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
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
    bool? includeHeading,
  });

  void openSelectionDialog(
    BuildContext context, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  });

  void openComplexDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    VoidCallback? onPressed,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  });

  void openFlexibleDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required List<Widget> buttons,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  });

  void openWidgetDialog(
    BuildContext context, {
    required Widget child,
  });
}

void openMessageDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openMessageDialog(context,
            title: title,
            message: message,
            closeLabel: closeLabel,
            widthFraction: widthFraction,
            includeHeading: includeHeading);

void openErrorDialog(
  BuildContext context, {
  required String title,
  required String errorMessage,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openErrorDialog(
          context, title: title,
          errorMessage: errorMessage,
          closeLabel: closeLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openAckNackDialog(
  BuildContext context, {
  required String title,
  required String message,
  required OnSelection onSelection,
  String? ackButtonLabel,
  String? nackButtonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openAckNackDialog(
          context, title: title,
          message: message,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openEntryDialog(
  BuildContext context, {
  required String title,
  String? ackButtonLabel,
  String? nackButtonLabel,
  String? hintText,
  required Function(String? response) onPressed,
  String? initialValue,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openEntryDialog(
          context, title: title,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          hintText: hintText, onPressed: onPressed,
          initialValue: initialValue,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openSelectionDialog(
  BuildContext context, {
  required String title,
  required List<String> options,
  required OnSelection onSelection,
  String? buttonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openSelectionDialog(
          context, title: title,
          options: options, onSelection: onSelection,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openComplexDialog(
  BuildContext context, {
  required String title,
  required Widget child,
  VoidCallback? onPressed,
  String? buttonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openComplexDialog(
          context, title: title,
          child: child, onPressed: onPressed,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openFlexibleDialog(
  BuildContext context, {
  required String title,
  required Widget child,
  required List<Widget> buttons,
  double? widthFraction, // percentage of screen width
  bool? includeHeading,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openFlexibleDialog(
          context, title: title,
          child: child, buttons: buttons,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openWidgetDialog(
  BuildContext context, {
  required Widget child,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openWidgetDialog(context, child: child);
