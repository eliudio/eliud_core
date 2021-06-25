import 'package:eliud_core/style/frontend/has_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';
import 'dialog/dialog_field.dart';
import 'dialog/dialog_helper.dart';

class EliudDialogWidgetImpl implements HasDialogWidget {
  final EliudStyle _eliudStyle;
  late DialogStateHelper dialogHelper;

  EliudDialogWidgetImpl(this._eliudStyle) {
    dialogHelper = DialogStateHelper();
  }

  @override
  Widget messageDialog(
    BuildContext context, {
    required String title,
    required String message,
    String? closeLabel,
  }) {
    return dialogHelper.build(context,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents:
            _eliudStyle.frontEndStyle().textStyle().text(context, message),
        buttons: dialogHelper.getCloseButton(context,
            onPressed: () => Navigator.pop(context), buttonLabel: closeLabel));
  }

  @override
  Widget errorDialog(
    BuildContext context, {
    required String title,
    required String errorMessage,
    String? closeLabel,
  }) {
    return dialogHelper.build(context,
        title: title,
        contents:
            _eliudStyle.frontEndStyle().textStyle().text(context, errorMessage),
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
      String? nackButtonLabel}) {
    return dialogHelper.build(context,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        title: title,
        contents:
            _eliudStyle.frontEndStyle().textStyle().text(context, message),
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
      String? initialValue}) {
    String? feedback;
    return dialogHelper.build(context,
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

/*
  =>
      RequestValueDialog(
        _eliudStyle.frontEndStyle(),
        title: title,
        ackButtonLabel: ackButtonLabel,
        nackButtonLabel: nackButtonLabel,
        hintText: hintText,
        onPressed: (value) {
          Navigator.of(context).pop();
          onPressed(value);
        },
        initialValue: initialValue,
        dialogButtonPosition: DialogButtonPosition.TopRight,
      );
*/

  @override
  Widget selectionDialog(BuildContext context,
      {required String title,
      required List<String> options,
      required OnSelection onSelection,
      String? buttonLabel}) {
    return dialogHelper.build(context,
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
              return _eliudStyle.frontEndStyle().buttonStyle().dialogButton(
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
  }) {
    return dialogHelper.build(context,
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
      String? buttonLabel}) {
    return dialogHelper.build(context,
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
      {required String title,
      required Widget child,
      required List<Widget> buttons}) {
    return dialogHelper.build(context,
        title: title,
        dialogButtonPosition: DialogButtonPosition.TopRight,
        contents: child,
        buttons: buttons);
  }
}
