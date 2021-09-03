import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class HasDialogWidget {
  Widget messageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget ackNackDialog(BuildContext context,
          {required String title,
          required String message,
          required OnSelection onSelection,
          String? ackButtonLabel,
          String? nackButtonLabel,
          Key? key,
          double? widthFraction, // percentage of screen width
          });
  Widget entryDialog(BuildContext context,
          {required String title,
          String? ackButtonLabel,
          String? nackButtonLabel,
          String? hintText,
          required Function(String? response) onPressed,
          String? initialValue,
          Key? key,
            double? widthFraction, // percentage of screen width
          });
  Widget selectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel,
      Key? key,    double? widthFraction, // percentage of screen width
      });
  Widget complexAckNackDialog(
    BuildContext context, {
    required String title,
    required Widget child,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget complexDialog(BuildContext context,
          {required String title,
          required Widget child,
          VoidCallback? onPressed,
          String? buttonLabel,
          Key? key,
          double? widthFraction // percentage of screen width
          });
  Widget flexibleDialog(BuildContext context,
      {required String title,
      required Widget child,
      required List<Widget> buttons,
      bool? includeHeading,
      Key? key,
        double? widthFraction, // percentage of screen width
      });
}
