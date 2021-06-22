import 'package:eliud_core/style/frontend/frontend_style.dart';
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
  late DialogStateHelper dialogHelper;

  List<DialogOption> options;
  final String title;
  final String? buttonLabel;
  final DialogButtonPosition dialogButtonPosition;

  DialogWithOptions(FrontEndStyle frontEndStyle, {
      Key? key,
      required this.options,
      required this.title,
      this.buttonLabel,
      required this.dialogButtonPosition
  }) : super(key: key) {
  dialogHelper = DialogStateHelper(frontEndStyle);
  }

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
  @override
  Widget build(BuildContext context) {
    return widget.dialogHelper.build(
        dialogButtonPosition: widget.dialogButtonPosition,
        title: widget.title,
        contents: getOptions(context),
        buttons: widget.dialogHelper.getCloseButton(context,
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
    return widget.dialogHelper.fieldsWidget(context, <Widget>[]);
  }

  void pressed() {
    Navigator.pop(context);
  }
}
