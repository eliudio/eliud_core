import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogStatefulWidgetHelper {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  static void openIt(BuildContext context, Widget dialog,
      {double heightValue, double widthValue}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  width: widthValue == null
                      ? width(context)
                      : min(width(context), widthValue),
                  height: heightValue == null
                      ? height(context)
                      : min(height(context), heightValue),
                  child: dialog));
        });
  }
}

// We use this helper allowing to maintain, reuse and change common dialog behavior
class DialogStateHelper {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build({String title, Widget contents, List<FlatButton> buttons}) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _contentBox(title: title, contents: contents, buttons: buttons),
    );
  }

  Widget _contentBox(
      {String title, Widget contents, List<FlatButton> buttons}) {
    return Form(
        key: _formKey,
        child: _titleAndFields(
            title: title, contents: contents, buttons: buttons));
  }

  Widget _getRowWithButtons(List<FlatButton> buttons) {
    var widgets = <Widget>[
      Spacer(),
    ];
    widgets.addAll(buttons);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgets);
  }

  Widget _titleAndFields(
      {String title, Widget contents, List<FlatButton> buttons}) {
    var widgets = <Widget>[
      Center(
          child: Text(title,
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      Divider(
        height: 10,
        color: Colors.red,
      ),
      contents,
      Divider(
        height: 10,
        color: Colors.red,
      ),
    ];
    widgets.add(_getRowWithButtons(buttons));

    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: widgets);
  }

  /* Helper method to create a list tile */
  Widget getListTile(
      {Widget leading, Widget title, Widget subtitle, bool isThreeLine}) {
    return ListTile(
      isThreeLine: isThreeLine ?? false,
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }

  /* Helper method to format the fields */
  Widget fieldsWidget(BuildContext context, List<Widget> widgets,
      {double height, double width}) {
    return Container(
        height: (height != null)
            ? height
            : DialogStatefulWidgetHelper.height(context) -
                150 /* minus the size of the button, title and divider */,
        width:
            (width != null) ? width : DialogStatefulWidgetHelper.width(context),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: widgets));
  }

  /* Helper method to retrieve the button */
  List<FlatButton> getCloseButton(
      BuildContext context, Function closeFunction) {
    return <FlatButton>[
      FlatButton(child: Text('Close'), onPressed: closeFunction),
    ];
  }

  List<FlatButton> getDefaultCloseButton(BuildContext context) {
    return getCloseButton(context, () => Navigator.pop(context));
  }

  List<FlatButton> getYesNoButtons(
      BuildContext context, Function yesFunction, Function noFunction,
      {String yesButtonLabel, String noButtonLabel}) {
    return <FlatButton>[
      FlatButton(
          onPressed: noFunction,
          child: Text(noButtonLabel == null ? 'Cancel' : noButtonLabel)),
      FlatButton(
          onPressed: yesFunction,
          child: Text(yesButtonLabel == null ? 'Continue' : yesButtonLabel)),
    ];
  }

  List<FlatButton> getButtons(BuildContext context, List<String> buttonLabels,
      List<Function> functions) {
    if (buttonLabels.length != functions.length)
      throw Exception(
          "Amount of labels of buttons does not correspond functions");
    List<FlatButton> buttons = [];
    for (int i = 0; i < buttonLabels.length; i++) {
      String label = buttonLabels[i];
      Function function = functions[i];
      buttons.add(FlatButton(onPressed: function, child: Text(label)));
    }
    return buttons;
  }
}
