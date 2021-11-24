import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';
import 'has_dialog_widget.dart';

abstract class HasDialog {
  void openMessageDialog(
    BuildContext context,
    String name, {
    required String title,
    required String message,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openErrorDialog(
    BuildContext context,
    String name, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openAckNackDialog(
    BuildContext context,
    String name, {
    required String title,
    required String message,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openEntryDialog(
    BuildContext context,
    String name, {
    required String title,
    String? ackButtonLabel,
    String? nackButtonLabel,
    String? hintText,
    required Function(String? response) onPressed,
    String? initialValue,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openSelectionDialog(
    BuildContext context,
    String name, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openComplexDialog(
    BuildContext context,
    String name, {
    required String title,
    required Widget child,
    VoidCallback? onPressed,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openFlexibleDialog(
    BuildContext context,
    String name, {
    String? title,
    required Widget child,
    List<Widget>? buttons,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openWidgetDialog(
    BuildContext context,
    String name, {
    required Widget child,
  });
}

void openMessageDialog(
  BuildContext context, String name, {
  required String title,
  required String message,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openMessageDialog(context,
            name,
            title: title,
            message: message,
            closeLabel: closeLabel,
            widthFraction: widthFraction,
            includeHeading: includeHeading);

void openErrorDialog(
  BuildContext context, String name, {
  required String title,
  required String errorMessage,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openErrorDialog(
          context, name, title: title,
          errorMessage: errorMessage,
          closeLabel: closeLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openAckNackDialog(
  BuildContext context, String name, {
  required String title,
  required String message,
  required OnSelection onSelection,
  String? ackButtonLabel,
  String? nackButtonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openAckNackDialog(
          context, name, title: title,
          message: message,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openEntryDialog(
  BuildContext context, String name, {
  required String title,
  String? ackButtonLabel,
  String? nackButtonLabel,
  String? hintText,
  required Function(String? response) onPressed,
  String? initialValue,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openEntryDialog(
          context, name, title: title,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          hintText: hintText, onPressed: onPressed,
          initialValue: initialValue,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openSelectionDialog(
  BuildContext context, String name, {
  required String title,
  required List<String> options,
  required OnSelection onSelection,
  String? buttonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openSelectionDialog(
          context, name, title: title,
          options: options, onSelection: onSelection,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openComplexDialog(
  BuildContext context,
  String name, {
  required String title,
  required Widget child,
  VoidCallback? onPressed,
  String? buttonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openComplexDialog(
          context, name, title: title,
          child: child, onPressed: onPressed,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openFlexibleDialog(
  BuildContext context,
  String name, {
  String? title,
  required Widget child,
  List<Widget>? buttons,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openFlexibleDialog(
          context, name, title: title,
          child: child,
          buttons: buttons,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openWidgetDialog(
  BuildContext context,
  String name, {
  required Widget child,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogStyle()
        .openWidgetDialog(context, name, child: child);
