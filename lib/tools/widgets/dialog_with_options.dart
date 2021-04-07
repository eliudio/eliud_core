import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/tools/widgets/dialog_helper.dart';

typedef OptionTriggered = void Function();

class DialogOption {
  final String? value;
  final OptionTriggered? optionTriggered;

  DialogOption({this.value, this.optionTriggered});
}

class DialogWithOptions extends StatefulWidget {
  List<DialogOption>? options;
  final String? title;

  DialogWithOptions(
      {Key? key, this.options, this.title,
      })
      : super(key: key);

  DialogWithOptions withOptionConditional(bool condition, String option, OptionTriggered triggered) {
    if (condition) {
      return withOption(option, triggered);
    } else {
      return this;
    }
  }

  DialogWithOptions withOption(String option, OptionTriggered triggered) {
    options ??= [];
    options!.add(DialogOption(value: option, optionTriggered: triggered));
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
        title: widget.title!,
        contents: getOptions(context),
        buttons: helper.getCloseButton(
            context, pressed));
  }

  Widget getOptions(BuildContext context) {
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.options!.length,
        itemBuilder: (context, i) {
          return TextButton(onPressed: () => onPressed(i), child: Text(widget.options![i].value!));
      });
  }

  void onPressed(int index) {
    Navigator.pop(context);
    widget.options![index].optionTriggered!();
  }

  Widget getFieldsWidget(BuildContext context) {
    return helper.fieldsWidget(context, <Widget>[
    ]);
  }

  void pressed() {
    Navigator.pop(context);
  }
}
