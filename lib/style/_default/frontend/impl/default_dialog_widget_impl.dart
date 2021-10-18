import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/dialog/dialog_field.dart';
import '../helper/dialog/dialog_helper.dart';

class DefaultDialogWidgetImpl implements HasDialogWidget {
  final FrontEndStyle _frontEndStyle;
  late DialogStateHelper dialogHelper;

  DefaultDialogWidgetImpl(this._frontEndStyle) {
    dialogHelper = DialogStateHelper();
  }

  @override
  Widget messageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  }) {
    return dialogHelper.build(context,
        includeHeading: includeHeading,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents: _frontEndStyle.textStyle().text(context, message),
        buttons: dialogHelper.getCloseButton(context,
            onPressed: () => Navigator.pop(context), buttonLabel: closeLabel));
  }

  @override
  Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
    bool? includeHeading,
    Key? key,
    double? widthFraction, // percentage of screen width
  }) {
    return dialogHelper.build(context,
        includeHeading: includeHeading,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        title: title,
        contents:
        _frontEndStyle.textStyle().text(context, errorMessage),
        dialogButtonPosition: DialogButtonPosition.TopRight,
        buttons: dialogHelper.getCloseButton(context,
            buttonLabel: closeLabel, onPressed: () => Navigator.pop(context)));
  }

  @override
  Widget ackNackDialog(BuildContext context,
      {required String title,
      required String message,
      required OnSelection onSelection,
      String? ackButtonLabel,
      String? nackButtonLabel,
      bool? includeHeading,
      Key? key,
      double? widthFraction, // percentage of screen width
      }) {
    return dialogHelper.build(context,
        includeHeading: includeHeading,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: title,
        contents: _frontEndStyle.textStyle().text(context, message),
        buttons: dialogHelper.getAckNackButtons(context, ackFunction: () {
          Navigator.of(context).pop();
          onSelection(0);
        }, nackFunction: () {
          Navigator.of(context).pop();
          onSelection(1);
        }, ackButtonLabel: ackButtonLabel, nackButtonLabel: nackButtonLabel));
  }

  @override
  Widget entryDialog(BuildContext context,
      {required String title,
      String? ackButtonLabel,
      String? nackButtonLabel,
      String? hintText,
      required Function(String? response) onPressed,
      String? initialValue,
      bool? includeHeading,
      Key? key,
      double? widthFraction, // percentage of screen width

        TextInputType? keyboardType,
        TextCapitalization? textCapitalization,
        TextAlign? textAlign,
        TextAlignVertical? textAlignVertical,
        TextDirection? textDirection,
        bool? readOnly,
        ToolbarOptions? toolbarOptions,
        bool? showCursor,
        bool? autocorrect,
        bool? enableSuggestions,
        int? maxLines,
        int? minLines,
        bool? expands,
        int? maxLength,
    }) {
    String? feedback;
    return dialogHelper.build(context,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        includeHeading: includeHeading,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: title,
        contents: dialogHelper.getListTile(
            leading: Icon(Icons.message),
            title: DialogField(
              valueChanged: (value) => feedback = value,
              initialValue: initialValue,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: hintText,
              ),
                keyboardType: keyboardType,
                textCapitalization: textCapitalization,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                readOnly: readOnly,
                toolbarOptions: toolbarOptions,
                showCursor: showCursor,
                autocorrect: autocorrect,
                enableSuggestions: enableSuggestions,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,


            )),
        buttons: dialogHelper.getAckNackButtons(
          context,
          ackFunction: () {
            Navigator.of(context).pop();
            onPressed(feedback);
          },
          nackFunction: () {
            Navigator.of(context).pop();
            onPressed(null);
          },
          ackButtonLabel: ackButtonLabel,
          nackButtonLabel: nackButtonLabel,
        ));
  }

  @override
  Widget selectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel,
      bool? includeHeading,
      Key? key,
      double? widthFraction, // percentage of screen width
    }) {
    return dialogHelper.build(context,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        includeHeading: includeHeading,
        key: key,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: title,
        buttons: dialogHelper.getCloseButton(context, onPressed: () {
          Navigator.of(context).pop();
        }),
        contents: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, i) {
              return _frontEndStyle.buttonStyle().dialogButton(
                context,
                label: options[i],
                onPressed: () {
                  onSelection(i);
                  Navigator.of(context).pop();
                },
              );
            }));
  }

  @override
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
  }) {
    return dialogHelper.build(context,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        includeHeading: includeHeading,
        key: key,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents: child,
        buttons: dialogHelper.getAckNackButtons(context, ackFunction: () {
          Navigator.of(context).pop();
          onSelection(0);
        }, nackFunction: () {
          Navigator.of(context).pop();
          onSelection(1);
        }, ackButtonLabel: ackButtonLabel, nackButtonLabel: nackButtonLabel));
  }

  @override
  Widget complexDialog(BuildContext context,
      {required String title,
      required Widget child,
      VoidCallback? onPressed,
      String? buttonLabel,
      bool? includeHeading,
      Key? key,
      double? widthFraction, // percentage of screen width
    }) {
    return dialogHelper.build(context,
        includeHeading: includeHeading,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents: child,
        buttons: dialogHelper.getCloseButton(context, onPressed: () {
          Navigator.of(context).pop();
          if (onPressed != null) {
            onPressed();
          }
        }, buttonLabel: buttonLabel));
  }

  @override
  Widget flexibleDialog(BuildContext context,
      {String? title,
      required Widget child,
      List<Widget>? buttons,
      bool? includeHeading,
      Key? key,
      double? widthFraction, // percentage of screen width
      }) {
    return dialogHelper.build(context,
        width: widthFraction == null ? null : fullScreenWidth(context) * widthFraction,
        key: key,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents: child,
        buttons: buttons,
        includeHeading: includeHeading);
  }
}
