import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDialog {
  void openMessageDialog(AppModel app,
      BuildContext context,
    String name, {
    required String title,
    required String message,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openErrorDialog(AppModel app,
      BuildContext context,
    String name, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openAckNackDialog(AppModel app,
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

  void openEntryDialog(AppModel app,
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

  void openSelectionDialog(AppModel app,
      BuildContext context,
    String name, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openComplexDialog(AppModel app,
      BuildContext context,
    String name, {
    required String title,
    required Widget child,
    VoidCallback? onPressed,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openFlexibleDialog(AppModel app,
      BuildContext context,
    String name, {
    String? title,
    required Widget child,
    List<Widget>? buttons,
    double? widthFraction, // percentage of screen width
    bool? includeHeading = true,
  });

  void openWidgetDialog(AppModel app,
      BuildContext context,
    String name, {
    required Widget child,
  });
}

void openMessageDialog(AppModel app,
  BuildContext context, String name, {
  required String title,
  required String message,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openMessageDialog(app, context,
            name,
            title: title,
            message: message,
            closeLabel: closeLabel,
            widthFraction: widthFraction,
            includeHeading: includeHeading);

void openErrorDialog(AppModel app,
  BuildContext context, String name, {
  required String title,
  required String errorMessage,
  String? closeLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openErrorDialog(app,
          context, name, title: title,
          errorMessage: errorMessage,
          closeLabel: closeLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openAckNackDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openAckNackDialog(app,
          context, name, title: title,
          message: message,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openEntryDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openEntryDialog(app,
          context, name, title: title,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          hintText: hintText, onPressed: onPressed,
          initialValue: initialValue,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openSelectionDialog(AppModel app,
  BuildContext context, String name, {
  required String title,
  required List<String> options,
  required OnSelection onSelection,
  String? buttonLabel,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openSelectionDialog(app,
          context, name, title: title,
          options: options, onSelection: onSelection,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openComplexDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openComplexDialog(app,
          context, name, title: title,
          child: child, onPressed: onPressed,
          buttonLabel: buttonLabel,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openFlexibleDialog(AppModel app,
  BuildContext context,
  String name, {
  String? title,
  required Widget child,
  List<Widget>? buttons,
  double? widthFraction, // percentage of screen width
  bool? includeHeading = true,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openFlexibleDialog(app,
          context, name, title: title,
          child: child,
          buttons: buttons,
          widthFraction: widthFraction, // percentage of screen width
          includeHeading: includeHeading,
        );

void openWidgetDialog(AppModel app,
  BuildContext context,
  String name, {
  required Widget child,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogStyle()
        .openWidgetDialog(app, context, name, child: child);
