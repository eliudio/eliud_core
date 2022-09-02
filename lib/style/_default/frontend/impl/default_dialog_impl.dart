import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/dialog/dialog_helper.dart';

class DefaultDialogImpl implements HasDialog {
  final FrontEndStyle _frontEndStyle;

  DefaultDialogImpl(this._frontEndStyle);

  @override
  Future<void> openMessageDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    required String message,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async {
    // MessageDialog
    await DialogStatefulWidgetHelper.openIt(
      context, name,
      _frontEndStyle.dialogWidgetStyle().messageDialog(app,
            context,
            title: title,
            message: message,
            widthFraction: widthFraction,
            includeHeading: includeHeading,
          ),
    );
  }

  @override
  Future<void> openErrorDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async =>
      await DialogStatefulWidgetHelper.openIt(
        context, name,
        _frontEndStyle.dialogWidgetStyle().errorDialog(app,
              context,
              title: title,
              errorMessage: errorMessage,
              widthFraction: widthFraction,
              includeHeading: includeHeading,
            ),
      );

  @override
  Future<void> openAckNackDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    required String message,
    required OnSelection onSelection,
    String? ackButtonLabel,
    String? nackButtonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async =>
      await DialogStatefulWidgetHelper.openIt(
          context, name,
          _frontEndStyle.dialogWidgetStyle().ackNackDialog(app,
                context,
                title: title,
                message: message,
                onSelection: onSelection,
                ackButtonLabel: ackButtonLabel,
                nackButtonLabel: nackButtonLabel,
                widthFraction: widthFraction,
                includeHeading: includeHeading,
              ));

  @override
  Future<void> openEntryDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    String? ackButtonLabel,
    String? nackButtonLabel,
    String? hintText,
    required Function(String? response) onPressed,
    String? initialValue,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async =>
      await DialogStatefulWidgetHelper.openIt(
        context,
        name,
        _frontEndStyle.dialogWidgetStyle().entryDialog(app,
              context,
              title: title,
              ackButtonLabel: ackButtonLabel,
              nackButtonLabel: nackButtonLabel,
              hintText: hintText,
              onPressed: onPressed,
              initialValue: initialValue,
              widthFraction: widthFraction,
              includeHeading: includeHeading,
            ),
      );

  @override
  Future<void> openSelectionDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    required List<String> options,
    required OnSelection onSelection,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async {
    await DialogStatefulWidgetHelper.openIt(
        context,
        name,
        _frontEndStyle.dialogWidgetStyle().selectionDialog(app,
              context,
              title: title,
              options: options,
              buttonLabel: buttonLabel,
              onSelection: onSelection,
              widthFraction: widthFraction,
              includeHeading: includeHeading,
            ));
  }

  @override
  Future<void> openComplexDialog(AppModel app,
      BuildContext context, String name, {
    required String title,
    required Widget child,
    VoidCallback? onPressed,
    String? buttonLabel,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async =>
      await DialogStatefulWidgetHelper.openIt(
          context,
          name,
          _frontEndStyle.dialogWidgetStyle().complexDialog(app,
                context,
                title: title,
                child: child,
                onPressed: onPressed,
                buttonLabel: buttonLabel,
                widthFraction: widthFraction,
                includeHeading: includeHeading,
              ));

  @override
  Future<void> openFlexibleDialog(AppModel app,
      BuildContext context, String name, {
    String? title,
    required Widget child,
    List<Widget>? buttons,
    double? widthFraction, // percentage of screen width
    bool? includeHeading,
  }) async {
    await DialogStatefulWidgetHelper.openIt(
        context, name,
        _frontEndStyle.dialogWidgetStyle().flexibleDialog(app,
              context,
              title: title,
              child: child,
              buttons: buttons,
              widthFraction: widthFraction,
              includeHeading: includeHeading,
            ));
  }

  @override
  Future<void> openWidgetDialog(AppModel app,
      BuildContext context, String name, {
    required Widget child,
  }) async {
    await DialogStatefulWidgetHelper.openIt(
      context, name,
      child,
    );
  }
}
