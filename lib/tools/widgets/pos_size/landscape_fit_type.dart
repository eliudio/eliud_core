import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

typedef LandscapeFitTypeCallback = Function(LandscapeFitType landscapeFitType);

class LandscapeFitTypeWidget extends StatefulWidget {
  final LandscapeFitTypeCallback landscapeFitTypeCallback;
  final LandscapeFitType landscapeFitType;
  final AppModel app;
  LandscapeFitTypeWidget(
      {super.key,
      required this.app,
      required this.landscapeFitTypeCallback,
      required this.landscapeFitType});

  @override
  State<StatefulWidget> createState() {
    return _LandscapeFitTypeWidgetState();
  }
}

class _LandscapeFitTypeWidgetState extends State<LandscapeFitTypeWidget> {
  int? value;

  @override
  void initState() {
    super.initState();
    value = widget.landscapeFitType.index;
  }

  String widthtTypeLandscapeStringValue(LandscapeFitType? landscapeFitType) {
    switch (landscapeFitType) {
      case LandscapeFitType.landscapeContain:
        return 'Contains';
      case LandscapeFitType.landscapeCover:
        return 'Cover';
      case LandscapeFitType.landscapeFill:
        return 'Fill';
      case LandscapeFitType.landscapeFitHeight:
        return 'Fit height';
      case LandscapeFitType.landscapeFitWidth:
        return 'Fit width';
      case LandscapeFitType.landscapeScaleDown:
        return 'Scale down';
      case LandscapeFitType.landscapeNone:
        return 'None';
      case LandscapeFitType.unknown:
        break;
      case null:
        break;
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
        child: radioListTile(widget.app, context, landscapeFitType.index, value,
            stringValue, null, (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(LandscapeFitType.landscapeContain),
      getOption(LandscapeFitType.landscapeCover),
      getOption(LandscapeFitType.landscapeFill),
      getOption(LandscapeFitType.landscapeFitHeight),
      getOption(LandscapeFitType.landscapeFitWidth),
      getOption(LandscapeFitType.landscapeScaleDown),
      getOption(LandscapeFitType.landscapeNone),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
