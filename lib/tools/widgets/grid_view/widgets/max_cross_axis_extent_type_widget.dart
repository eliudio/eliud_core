import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/grid_view_model.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef MaxCrossAxisExtentTypeCallback = Function(
    MaxCrossAxisExtentType maxCrossAxisExtentType);

class MaxCrossAxisExtentTypeWidget extends StatefulWidget {
  final MaxCrossAxisExtentTypeCallback maxCrossAxisExtentTypeCallback;
  final MaxCrossAxisExtentType maxCrossAxisExtentType;
  final AppModel app;
  MaxCrossAxisExtentTypeWidget(
      {super.key,
      required this.app,
      required this.maxCrossAxisExtentTypeCallback,
      required this.maxCrossAxisExtentType});

  @override
  State<StatefulWidget> createState() {
    return _MaxCrossAxisExtentTypeWidgetState();
  }
}

class _MaxCrossAxisExtentTypeWidgetState
    extends State<MaxCrossAxisExtentTypeWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.maxCrossAxisExtentType.index;
  }

  String heighttTypeLandscapeStringValue(
      MaxCrossAxisExtentType? maxCrossAxisExtentType) {
    switch (maxCrossAxisExtentType) {
      case MaxCrossAxisExtentType.absolute:
        return 'Absolute';
      case MaxCrossAxisExtentType.relative:
        return 'Relative';
      case MaxCrossAxisExtentType.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.maxCrossAxisExtentTypeCallback(toMaxCrossAxisExtentType(val));
    });
  }

  Widget getPrivilegeOption(MaxCrossAxisExtentType? maxCrossAxisExtentType) {
    if (maxCrossAxisExtentType == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(maxCrossAxisExtentType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            maxCrossAxisExtentType.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(MaxCrossAxisExtentType.relative),
      getPrivilegeOption(MaxCrossAxisExtentType.absolute)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
