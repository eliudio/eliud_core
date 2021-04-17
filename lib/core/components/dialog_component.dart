import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/components/page_body_helper.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/widgets/dialog_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogComponent extends StatefulWidget {
  final DialogModel? dialog;
  final Map<String, dynamic>? parameters;
  DialogComponent({
    Key? key,
    this.dialog,
    this.parameters,
  }) : super(key: key);

  @override
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  final DialogStateHelper dialogHelper = DialogStateHelper();
  final PageBodyHelper pageHelper = PageBodyHelper();

  @override
  Widget build(BuildContext context) {
    return dialogHelper.build(
        title: widget.dialog!.title!,
        contents: getContents(context),
        buttons: getButtons(context));
  }

  List<TextButton> getButtons(BuildContext context) {
    return <TextButton>[
      TextButton(onPressed: () => pressed(true), child: Text('Close')),
    ];
  }

  Widget getContents(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return dialogHelper.fieldsWidget(context, <Widget>[
      pageHelper.theBody(context, accessState,
          backgroundDecoration: null,
          components: pageHelper.getComponents(
              widget.dialog!.bodyComponents!, widget.parameters),
          layout: fromDialogLayout(widget.dialog!.layout),
          gridView: widget.dialog!.gridView)
      ]);
  }


  void pressed(bool success) {
    Navigator.pop(context);
  }
}
