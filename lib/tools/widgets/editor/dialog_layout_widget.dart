import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef DialogLayoutCallback = Function(DialogLayout dialogLayout);

class DialogLayoutWidget extends StatefulWidget {
  final DialogLayoutCallback dialogLayoutCallback;
  final DialogLayout dialogLayout;
  final AppModel app;
  DialogLayoutWidget(
      {super.key,
      required this.app,
      required this.dialogLayoutCallback,
      required this.dialogLayout});

  @override
  State<StatefulWidget> createState() {
    return _DialogLayoutWidgetState();
  }
}

class _DialogLayoutWidgetState extends State<DialogLayoutWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.dialogLayout.index;
  }

  String heighttTypeLandscapeStringValue(DialogLayout? dialogLayout) {
    switch (dialogLayout) {
      case DialogLayout.listView:
        return 'List';
      case DialogLayout.gridView:
        return 'Grid';
      case DialogLayout.onlyTheFirstComponent:
        return 'Only first';
      case DialogLayout.unknown:
        break;
      case null:
        break;
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
      getPrivilegeOption(DialogLayout.listView),
      getPrivilegeOption(DialogLayout.gridView),
      getPrivilegeOption(DialogLayout.onlyTheFirstComponent),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
