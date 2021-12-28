import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasDialogWidget {
  Widget messageDialog(AppModel app,
      BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget errorDialog(AppModel app,
      BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget ackNackDialog(AppModel app,
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
  Widget entryDialog(AppModel app,
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
  Widget selectionDialog(AppModel app,
      BuildContext context, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
  Widget complexAckNackDialog(AppModel app,
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
  Widget complexDialog(AppModel app, BuildContext context,
      {required String title,
      required Widget child,
      VoidCallback? onPressed,
      String? buttonLabel,
      bool? includeHeading,
      Key? key,
      double? widthFraction // percentage of screen width
      });
  Widget flexibleDialog(AppModel app,
      BuildContext context, {
    String? title,
    required Widget child,
    List<Widget>? buttons,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  });
}

Widget messageDialog(AppModel app,
  BuildContext context, {
  required String title,
  required String message,
  String? closeLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .messageDialog(app, context,
            title: title,
            message: message,
            closeLabel: closeLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget errorDialog(AppModel app,
  BuildContext context, {
  required String title,
  required String errorMessage,
  String? closeLabel,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .errorDialog(app,
          context,
          title: title,
          errorMessage: errorMessage,
          closeLabel: closeLabel,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction,
        );

Widget ackNackDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .ackNackDialog(app,
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

Widget entryDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .entryDialog(app, context,
            title: title,
            ackButtonLabel: ackButtonLabel,
            nackButtonLabel: nackButtonLabel,
            hintText: hintText,
            onPressed: onPressed,
            initialValue: initialValue,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget selectionDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .selectionDialog(app, context,
            title: title,
            options: options,
            onSelection: onSelection,
            buttonLabel: buttonLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction);

Widget complexAckNackDialog(AppModel app,
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
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .complexAckNackDialog(app,
          context, title: title,
          child: child,
          onSelection: onSelection,
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction, // percentage of screen width
        );

Widget complexDialog(AppModel app,BuildContext context,
        {required String title,
        required Widget child,
        VoidCallback? onPressed,
        String? buttonLabel,
        bool? includeHeading = true,
        Key? key,
        double? widthFraction // percentage of screen width
        }) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .complexDialog(app, context,
            title: title,
            child: child,
            onPressed: onPressed,
            buttonLabel: buttonLabel,
            includeHeading: includeHeading,
            key: key,
            widthFraction: widthFraction // percentage of screen width
            );

Widget flexibleDialog(AppModel app,
  BuildContext context, {
  required String title,
  required Widget child,
  required List<Widget> buttons,
  bool? includeHeading = true,
  Key? key,
  double? widthFraction, // percentage of screen width
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .dialogWidgetStyle()
        .flexibleDialog(app,
          context,
          title: title,
          child: child,
          buttons: buttons,
          includeHeading: includeHeading,
          key: key,
          widthFraction: widthFraction,
        );
