import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/border_radius_model.dart';

typedef BorderRadiusTypeCallback = Function(
    BorderRadiusType borderRadiusType);

class BorderRadiusTypeWidget extends StatefulWidget {
  BorderRadiusTypeCallback borderRadiusTypeCallback;
  final BorderRadiusType borderRadiusType;
  final AppModel app;
  BorderRadiusTypeWidget(
      {Key? key,
        required this.app,
        required this.borderRadiusTypeCallback,
        required this.borderRadiusType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BorderRadiusTypeWidgetState();
  }
}

class _BorderRadiusTypeWidgetState extends State<BorderRadiusTypeWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.borderRadiusType.index;
  }

  String heighttTypeLandscapeStringValue(BorderRadiusType? borderRadiusType) {
    switch (borderRadiusType) {
      case BorderRadiusType.Circular:
        return 'Circular';
      case BorderRadiusType.Elliptical:
        return 'Elliptical';
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
      getPrivilegeOption(BorderRadiusType.Circular),
      getPrivilegeOption(BorderRadiusType.Elliptical)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
