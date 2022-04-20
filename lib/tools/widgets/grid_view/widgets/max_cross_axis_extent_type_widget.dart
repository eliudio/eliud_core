import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/grid_view_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef MaxCrossAxisExtentTypeCallback = Function(
    MaxCrossAxisExtentType maxCrossAxisExtentType);

class MaxCrossAxisExtentTypeWidget extends StatefulWidget {
  MaxCrossAxisExtentTypeCallback maxCrossAxisExtentTypeCallback;
  final MaxCrossAxisExtentType maxCrossAxisExtentType;
  final AppModel app;
  MaxCrossAxisExtentTypeWidget(
      {Key? key,
        required this.app,
        required this.maxCrossAxisExtentTypeCallback,
        required this.maxCrossAxisExtentType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MaxCrossAxisExtentTypeWidgetState();
  }
}

class _MaxCrossAxisExtentTypeWidgetState extends State<MaxCrossAxisExtentTypeWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.maxCrossAxisExtentType.index;
  }

  String heighttTypeLandscapeStringValue(MaxCrossAxisExtentType? maxCrossAxisExtentType) {
    switch (maxCrossAxisExtentType) {
      case MaxCrossAxisExtentType.Absolute:
        return 'Absolute';
      case MaxCrossAxisExtentType.Relative:
        return 'Relative';
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
      getPrivilegeOption(MaxCrossAxisExtentType.Relative),
      getPrivilegeOption(MaxCrossAxisExtentType.Absolute)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
