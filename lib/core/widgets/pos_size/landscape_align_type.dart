import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

typedef LandscapeAlignTypeCallback = Function(
    LandscapeAlignType landscapeAlignType);

class LandscapeAlignTypeWidget extends StatefulWidget {
  final LandscapeAlignTypeCallback landscapeAlignTypeCallback;
  final LandscapeAlignType landscapeAlignType;
  final AppModel app;
  LandscapeAlignTypeWidget(
      {super.key,
      required this.app,
      required this.landscapeAlignTypeCallback,
      required this.landscapeAlignType});

  @override
  State<StatefulWidget> createState() {
    return _LandscapeAlignTypeWidgetState();
  }
}

class _LandscapeAlignTypeWidgetState extends State<LandscapeAlignTypeWidget> {
  int? value;

  @override
  void initState() {
    super.initState();
    value = widget.landscapeAlignType.index;
  }

  String widthtTypeLandscapeStringValue(
      LandscapeAlignType? landscapeAlignType) {
    switch (landscapeAlignType) {
      case LandscapeAlignType.landscapeAlignBottomCenter:
        return 'Bottom Center';
      case LandscapeAlignType.landscapeAlignTopLeft:
        return 'Top Left';
      case LandscapeAlignType.landscapeAlignTopCenter:
        return 'Top Center';
      case LandscapeAlignType.landscapeAlignTopRight:
        return 'Top Right';
      case LandscapeAlignType.landscapeAlignCenterLeft:
        return 'Center Left';
      case LandscapeAlignType.landscapeAlignCenter:
        return 'Center';
      case LandscapeAlignType.landscapeAlignCenterRight:
        return 'Center Right';
      case LandscapeAlignType.landscapeAlignBottomLeft:
        return 'Bottom Left';
      case LandscapeAlignType.landscapeAlignBottomRight:
        return 'Bottom Right';
      case LandscapeAlignType.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      value = val;
      widget.landscapeAlignTypeCallback(toLandscapeAlignType(val));
    });
  }

  Widget getOption(LandscapeAlignType? landscapeAlignType) {
    if (landscapeAlignType == null) return Text("?");
    var stringValue = widthtTypeLandscapeStringValue(landscapeAlignType);
    return Center(
        child: radioListTile(widget.app, context, landscapeAlignType.index,
            value, stringValue, null, (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(LandscapeAlignType.landscapeAlignBottomCenter),
      getOption(LandscapeAlignType.landscapeAlignTopLeft),
      getOption(LandscapeAlignType.landscapeAlignTopCenter),
      getOption(LandscapeAlignType.landscapeAlignTopRight),
      getOption(LandscapeAlignType.landscapeAlignCenterLeft),
      getOption(LandscapeAlignType.landscapeAlignCenter),
      getOption(LandscapeAlignType.landscapeAlignCenterRight),
      getOption(LandscapeAlignType.landscapeAlignBottomLeft),
      getOption(LandscapeAlignType.landscapeAlignBottomCenter),
      getOption(LandscapeAlignType.landscapeAlignBottomRight),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
