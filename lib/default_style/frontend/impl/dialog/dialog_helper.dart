import 'dart:math';
import 'dart:ui';
import 'package:eliud_core/style/frontend/frontend_style.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogButtonPosition { BottomRight, TopRight }

class DialogStatefulWidgetHelper {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  static void openIt(BuildContext context, Widget dialog,
      {double? heightValue, double? widthValue}) {
    var _width =
        widthValue == null ? width(context) : min(width(context), widthValue);
    var _height = heightValue == null
        ? height(context)
        : min(height(context), heightValue);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Align(
                  alignment: Alignment.center,
                  child:
                      SizedBox(width: _width, height: _height, child: dialog)));
        });
  }
}

// We use this helper allowing to maintain, reuse and change common dialog behavior
class DialogStateHelper {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FrontEndStyle frontEndStyle;

  DialogStateHelper(this.frontEndStyle);

  Widget build(
      {required String title,
      required Widget contents,
      required List<Widget> buttons,
      double? width,
      required DialogButtonPosition dialogButtonPosition,
      Widget? separator}) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _contentBox(
          title: title,
          contents: contents,
          buttons: buttons,
          dialogButtonPosition: dialogButtonPosition,
          separator: separator),
    );
  }

  Widget _contentBox(
      {required String title,
      required Widget contents,
      required List<Widget> buttons,
      double? width,
      DialogButtonPosition? dialogButtonPosition,
      Widget? separator}) {
    return Form(
        key: _formKey,
        child: _titleAndFields(
            title: title,
            contents: contents,
            buttons: buttons,
            width: width,
            dialogButtonPosition: dialogButtonPosition,
            separator: separator));
  }

  Widget _getRowWithButtons(List<Widget> buttons, {Widget? title}) {
    var widgets = <Widget>[];
    if (title != null) {
      widgets.add(title);
    }
    widgets.add(Spacer());
    widgets.addAll(buttons);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  Widget _titleAndFields(
      {required String title,
      required Widget contents,
      required List<Widget> buttons,
      double? width,
      DialogButtonPosition? dialogButtonPosition,
      Widget? separator}) {
    var widgets = <Widget>[];
    Widget _title = Text(title,
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 20));
    if ((dialogButtonPosition != null) &&
        (dialogButtonPosition == DialogButtonPosition.TopRight)) {
      widgets.add(_getRowWithButtons(buttons, title: _title));
    } else {
      widgets.add(Center(child: _title));
    }
    if (separator == null) {
      widgets.add(Divider(
        height: 10,
        color: Colors.red,
      ));
    } else {
      widgets.add(separator);
    }
    widgets.add(contents);
    if (!((dialogButtonPosition != null) &&
        (dialogButtonPosition == DialogButtonPosition.TopRight))) {
      widgets.add(Divider(
        height: 10,
        color: Colors.red,
      ));
      widgets.add(_getRowWithButtons(buttons));
    }

    return Container(
        width: width,
        child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: widgets));
  }

  /* Helper method to create a list tile */
  Widget getListTile(
      {Widget? leading, Widget? title, Widget? subtitle, bool? isThreeLine}) {
    return ListTile(
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }

  /* Helper method to format the fields */
  Widget fieldsWidget(BuildContext context, List<Widget> widgets,
      {double? height, double? width}) {
    return StyleRegistry.registry().styleWithContext(context).frontEndStyle().containerStyle().simpleTopicContainer(context, children: widgets, height: height, width: width);
/*
    return Container(
        height: (height != null)
            ? height
            : DialogStatefulWidgetHelper.height(context) -
                150 */
/* minus the size of the button, title and divider *//*
,
        width:
            (width != null) ? width : DialogStatefulWidgetHelper.width(context),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: widgets));
*/
  }

  /* Helper method to retrieve the button */
  List<Widget> getCloseButton(
    BuildContext context, {
    required VoidCallback onPressed,
    String? buttonLabel,
  }) {

    return <Widget>[
      frontEndStyle.buttonStyle().dialogButton(context, label: buttonLabel ?? 'Close', onPressed: onPressed),
    ];
  }

  List<Widget> getDefaultCloseButton(BuildContext context) {
    return getCloseButton(context,
        buttonLabel: 'Close', onPressed: () => Navigator.pop(context));
  }

  List<Widget> getAckNackButtons(BuildContext context,
      {required VoidCallback ackFunction,
      required VoidCallback nackFunction,
      String? ackButtonLabel,
      String? nackButtonLabel}) {
    return <Widget>[
      frontEndStyle.buttonStyle().dialogButton(context, label: nackButtonLabel ?? 'Cancel',        onPressed: nackFunction,
      ),
      frontEndStyle.buttonStyle().dialogButton(context, label: ackButtonLabel ?? 'Continue',          onPressed: ackFunction),
    ];
  }

  List<Widget> getButtons(BuildContext context, List<String> buttonLabels,
      List<VoidCallback> functions) {
    if (buttonLabels.length != functions.length) {
      throw Exception(
          'Amount of labels of buttons does not correspond functions');
    }
    var buttons = <Widget>[];
    for (var i = 0; i < buttonLabels.length; i++) {
      var label = buttonLabels[i];
      var function = functions[i];
      buttons.add(
          frontEndStyle.buttonStyle().dialogButton(context, label: label,
          onPressed: function));
    }
    return buttons;
  }
}
