import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/border_radius_model.dart';

typedef BorderRadiusTypeCallback = Function(BorderRadiusType borderRadiusType);

class BorderRadiusTypeWidget extends StatefulWidget {
  final BorderRadiusTypeCallback borderRadiusTypeCallback;
  final BorderRadiusType borderRadiusType;
  final AppModel app;
  BorderRadiusTypeWidget(
      {super.key,
      required this.app,
      required this.borderRadiusTypeCallback,
      required this.borderRadiusType});

  @override
  State<StatefulWidget> createState() {
    return _BorderRadiusTypeWidgetState();
  }
}

class _BorderRadiusTypeWidgetState extends State<BorderRadiusTypeWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.borderRadiusType.index;
  }

  String heighttTypeLandscapeStringValue(BorderRadiusType? borderRadiusType) {
    switch (borderRadiusType) {
      case BorderRadiusType.circular:
        return 'Circular';
      case BorderRadiusType.elliptical:
        return 'Elliptical';
      case BorderRadiusType.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.borderRadiusTypeCallback(toBorderRadiusType(val));
    });
  }

  Widget getPrivilegeOption(BorderRadiusType? borderRadiusType) {
    if (borderRadiusType == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(borderRadiusType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            borderRadiusType.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(BorderRadiusType.circular),
      getPrivilegeOption(BorderRadiusType.elliptical)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
