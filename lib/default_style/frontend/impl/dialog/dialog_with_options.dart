import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_helper.dart';

typedef OptionTriggered = void Function();

class DialogOption {
  final String value;
  final OptionTriggered optionTriggered;

  DialogOption({required this.value, required this.optionTriggered});
}

class DialogWithOptions extends StatefulWidget {
  List<DialogOption> options;
  final String title;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  DialogWithOptions(
      {Key? key,
      required this.options,
      required this.title,
      this.buttonLabel,
      required this.dialogButtonPosition})
      : super(key: key);

  DialogWithOptions withOptionConditional(
      bool condition, String option, OptionTriggered triggered) {
    if (condition) {
      return withOption(option, triggered);
    } else {
      return this;
    }
  }

  DialogWithOptions withOption(String option, OptionTriggered triggered) {
    options.add(DialogOption(value: option, optionTriggered: triggered));
    return this;
  }

  @override
  _DialogWithOptionsState createState() => _DialogWithOptionsState();
}

class _DialogWithOptionsState extends State<DialogWithOptions> {
  final DialogStateHelper helper = DialogStateHelper();

  @override
  Widget build(BuildContext context) {
    return helper.build(
        dialogButtonPosition: widget.dialogButtonPosition,
        title: widget.title,
        contents: getOptions(context),
        buttons: helper.getCloseButton(context,
            onPressed: pressed, buttonLabel: widget.buttonLabel));
  }

  Widget getOptions(BuildContext context) {
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.options.length,
        itemBuilder: (context, i) {
          return TextButton(
              onPressed: () => onPressed(i),
              child: Text(widget.options[i].value));
        });
  }

  void onPressed(int index) {
    Navigator.pop(context);
    widget.options[index].optionTriggered();
  }

  Widget getFieldsWidget(BuildContext context) {
    return helper.fieldsWidget(context, <Widget>[]);
  }

  void pressed() {
    Navigator.pop(context);
  }
}
