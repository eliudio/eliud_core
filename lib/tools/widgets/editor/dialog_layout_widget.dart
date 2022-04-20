import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef DialogLayoutCallback = Function(
    DialogLayout dialogLayout);

class DialogLayoutWidget extends StatefulWidget {
  DialogLayoutCallback dialogLayoutCallback;
  final DialogLayout dialogLayout;
  final AppModel app;
  DialogLayoutWidget(
      {Key? key,
        required this.app,
        required this.dialogLayoutCallback,
        required this.dialogLayout})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DialogLayoutWidgetState();
  }
}

class _DialogLayoutWidgetState extends State<DialogLayoutWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.dialogLayout.index;
  }

  String heighttTypeLandscapeStringValue(DialogLayout? dialogLayout) {
    switch (dialogLayout) {
      case DialogLayout.ListView:
        return 'List';
      case DialogLayout.GridView:
        return 'Grid';
      case DialogLayout.OnlyTheFirstComponent:
        return 'Only first';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.dialogLayoutCallback(toDialogLayout(val));
    });
  }

  Widget getPrivilegeOption(DialogLayout? dialogLayout) {
    if (dialogLayout == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(dialogLayout);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            dialogLayout.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(DialogLayout.ListView),
      getPrivilegeOption(DialogLayout.GridView),
      getPrivilegeOption(DialogLayout.OnlyTheFirstComponent),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
