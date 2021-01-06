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
        insetPadding:EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
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
      BuildContext context, Function yesFunction, Function noFunction) {
    return <FlatButton>[
      FlatButton(onPressed: noFunction, child: Text('Cancel')),
      FlatButton(onPressed: yesFunction, child: Text('Continue')),
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
    this.message,
    this.yesFunction,
    this.noFunction,
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
        buttons: dialogHelper.getYesNoButtons(
            context, widget.yesFunction, widget.noFunction));
  }
}

typedef void ValueChanged(String value);

class DialogField extends StatefulWidget {
  final InputDecoration decoration;
  final ValueChanged valueChanged;

  const DialogField({Key key, this.decoration, this.valueChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DialogFieldState();
  }
}

class _DialogFieldState extends State<DialogField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_fieldChanged);
  }

  void _fieldChanged() {
    widget.valueChanged(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: widget.decoration, controller: myController);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}

class RequestValueDialog extends StatefulWidget {
  final String title;
  final String yesButtonText;
  final String noButtonText;
  final String hintText;
  final Function(String response) yesFunction;
  final Function noFunction;

  RequestValueDialog({
    Key key,
    this.title,
    this.yesButtonText,
    this.noButtonText,
    this.hintText,
    this.yesFunction,
    this.noFunction,
  }) : super(key: key);

  @override
  _RequestValueDialogState createState() => _RequestValueDialogState();
}

class _RequestValueDialogState extends State<RequestValueDialog> {
  final DialogStateHelper dialogHelper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    String feedback;
    return dialogHelper.build(
        title: widget.title,
        contents: DialogStateHelper().getListTile(
            leading: Icon(Icons.payment),
            title: DialogField(
              valueChanged: (value) => feedback = value,
              decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.hintText,
              ),
            )),
        buttons: <FlatButton>[
          FlatButton(
              onPressed: widget.noFunction, child: Text(widget.noButtonText)),
          FlatButton(
              onPressed: widget.yesFunction(feedback),
              child: Text(widget.yesButtonText)),
        ]);
  }
}

