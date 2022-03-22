
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

typedef LandscapeFitTypeCallback = Function(
    LandscapeFitType landscapeFitType);

class LandscapeFitTypeWidget extends StatefulWidget {
  LandscapeFitTypeCallback landscapeFitTypeCallback;
  final LandscapeFitType landscapeFitType;
  final AppModel app;
  LandscapeFitTypeWidget(
      {Key? key,
        required this.app,
        required this.landscapeFitTypeCallback,
        required this.landscapeFitType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LandscapeFitTypeWidgetState();
  }
}

class _LandscapeFitTypeWidgetState extends State<LandscapeFitTypeWidget> {
  int? value;

  void initState() {
    super.initState();
    value = widget.landscapeFitType.index;
  }

  String widthtTypeLandscapeStringValue(LandscapeFitType? landscapeFitType) {
    switch (landscapeFitType) {
      case LandscapeFitType.LandscapeContain:
        return 'Contains';
      case LandscapeFitType.LandscapeCover:
        return 'Cover';
      case LandscapeFitType.LandscapeFill:
        return 'Fill';
      case LandscapeFitType.LandscapeFitHeight:
        return 'Fit height';
      case LandscapeFitType.LandscapeFitWidth:
        return 'Fit width';
      case LandscapeFitType.LandscapeScaleDown:
        return 'Scale down';
      case LandscapeFitType.LandscapeNone:
        return 'None';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      value = val;
      widget.landscapeFitTypeCallback(toLandscapeFitType(val));
    });
  }

  Widget getOption(LandscapeFitType? landscapeFitType) {
    if (landscapeFitType == null) return Text("?");
    var stringValue = widthtTypeLandscapeStringValue(landscapeFitType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            landscapeFitType.index,
            value,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(LandscapeFitType.LandscapeContain),
      getOption(LandscapeFitType.LandscapeCover),
      getOption(LandscapeFitType.LandscapeFill),
      getOption(LandscapeFitType.LandscapeFitHeight),
      getOption(LandscapeFitType.LandscapeFitWidth),
      getOption(LandscapeFitType.LandscapeScaleDown),
      getOption(LandscapeFitType.LandscapeNone),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
