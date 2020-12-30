import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogStatefulWidgetHelper {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.9;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.9;

  static void openIt(BuildContext context, Widget dialog) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              width: width(context), height: height(context), child: dialog));
        });
  }
}

// We use this helper allowing to maintain, reuse and change common dialog behavior
class DialogStateHelper {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build({String title, Widget contents, List<FlatButton> buttons}) {
    return Dialog(
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
  Widget fieldsWidget(BuildContext context, List<Widget> widgets) {
    return Container(
        height: DialogStatefulWidgetHelper.height(context) -
            150 /* minus the size of the button, title and divider */,
        width: DialogStatefulWidgetHelper.width(context),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: widgets));
  }

  /* Helper method to retrieve the close button */
  List<FlatButton> getCloseButton(BuildContext context, Function closeFunction) {
    return <FlatButton>[
      FlatButton( child: Text('Close'), onPressed: closeFunction),
    ];
  }

  List<FlatButton> getDefaultCloseButton(BuildContext context) {
    return getCloseButton(context, () => Navigator.pop(context));
  }

  List<FlatButton> getYesNoButtons(BuildContext context, Function yesFunction, Function noFunction) {
    return <FlatButton>[
      FlatButton(
          onPressed: noFunction,
          child: Text('Cancel')),
      FlatButton(
          onPressed: yesFunction,
          child: Text('Continue')),
    ];
  }
}

class MessageDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function yesFunction;

  MessageDialog({
    Key key,
    this.title,
    this.message,
    this.yesFunction,
  }) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: Text(widget.message),
        buttons: dialogHelper.getCloseButton(context, widget.yesFunction));
  }
}

class YesNoDialog extends StatefulWidget {
  final String title;
  final String message;
  final Function yesFunction;
  final Function noFunction;

  YesNoDialog({
    Key key,
    this.title,
    this.message, this.yesFunction, this.noFunction,
  }) : super(key: key);

  @override
  _YesNoState createState() => _YesNoState();
}

class _YesNoState extends State<YesNoDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.title,
        contents: Text(widget.message),
        buttons: dialogHelper.getYesNoButtons(context, widget.yesFunction, widget.noFunction));
  }
}