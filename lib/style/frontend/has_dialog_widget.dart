import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDialogWidget {
  Widget messageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget ackNackDialog(
    BuildContext context, {
    required String title,
    required String message,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget entryDialog(
    BuildContext context, {
    required String title,
    String? ackButtonLabel,
    String? nackButtonLabel,
    String? hintText,
    required Function(String? response) onPressed,
    String? initialValue,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget selectionDialog(
    BuildContext context, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget complexAckNackDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget complexDialog(BuildContext context,
      {required String title,
      required Widget child,
      VoidCallback? onPressed,
      String? buttonLabel,
      bool? includeHeading,
      Key? key,
      double? widthFraction // percentage of screen width
      });
  Widget flexibleDialog(
    BuildContext context, {
    String? title,
    required Widget child,
    List<Widget>? buttons,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
}

Widget messageDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? closeLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .messageDialog(context,
            title: title,
            message: message,
            closeLabel: closeLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget errorDialog(
  BuildContext context, {
  required String title,
  required String errorMessage,
  String? closeLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .errorDialog(
          context,
          title: title,
          errorMessage: errorMessage,
          closeLabel: closeLabel,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction,
        );

Widget ackNackDialog(
  BuildContext context, {
  required String title,
  required String message,
  required OnSelection onSelection,
  String? ackButtonLabel,
  String? nackButtonLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .ackNackDialog(
          context,
          title: title,
          message: message,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction,
        );

Widget entryDialog(
  BuildContext context, {
  required String title,
  String? ackButtonLabel,
  String? nackButtonLabel,
  String? hintText,
  required Function(String? response) onPressed,
  String? initialValue,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .entryDialog(context,
            title: title,
            ackButtonLabel: ackButtonLabel,
            nackButtonLabel: nackButtonLabel,
            hintText: hintText,
            onPressed: onPressed,
            initialValue: initialValue,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget selectionDialog(
  BuildContext context, {
  required String title,
  required List<String> options,
  required OnSelection onSelection,
  String? buttonLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .selectionDialog(context,
            title: title,
            options: options,
            onSelection: onSelection,
            buttonLabel: buttonLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget complexAckNackDialog(
  BuildContext context, {
  required String title,
  required Widget child,
  required OnSelection onSelection,
  String? ackButtonLabel,
  String? nackButtonLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .complexAckNackDialog(
          context, title: title,
          child: child,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction, // percentage of screen width
        );

Widget complexDialog(BuildContext context,
        {required String title,
        required Widget child,
        VoidCallback? onPressed,
        String? buttonLabel,
        bool? includeHeading = true,
        Key? key,
        double? widthFraction // percentage of screen width
        }) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .complexDialog(context,
            title: title,
            child: child,
            onPressed: onPressed,
            buttonLabel: buttonLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction // percentage of screen width
            );

Widget flexibleDialog(
  BuildContext context, {
  required String title,
  required Widget child,
  required List<Widget> buttons,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .dialogWidgetStyle()
        .flexibleDialog(
          context,
          title: title,
          child: child,
          buttons: buttons,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction,
        );
