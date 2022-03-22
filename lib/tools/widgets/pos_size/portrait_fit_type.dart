
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';

typedef PortraitFitTypeCallback = Function(
    PortraitFitType portraitFitType);

class PortraitFitTypeWidget extends StatefulWidget {
  PortraitFitTypeCallback portraitFitTypeCallback;
  final PortraitFitType portraitFitType;
  final AppModel app;
  PortraitFitTypeWidget(
      {Key? key,
        required this.app,
        required this.portraitFitTypeCallback,
        required this.portraitFitType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PortraitFitTypeWidgetState();
  }
}

class _PortraitFitTypeWidgetState extends State<PortraitFitTypeWidget> {
  int? value;

  void initState() {
    super.initState();
    value = widget.portraitFitType.index;
  }

  String widthtTypePortraitStringValue(PortraitFitType? portraitFitType) {
    switch (portraitFitType) {
      case PortraitFitType.PortraitContain:
        return 'Contains';
      case PortraitFitType.PortraitCover:
        return 'Cover';
      case PortraitFitType.PortraitFill:
        return 'Fill';
      case PortraitFitType.PortraitFitHeight:
        return 'Fit height';
      case PortraitFitType.PortraitFitWidth:
        return 'Fit width';
      case PortraitFitType.PortraitScaleDown:
        return 'Scale down';
      case PortraitFitType.PortraitNone:
        return 'None';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      value = val;
      widget.portraitFitTypeCallback(toPortraitFitType(val));
    });
  }

  Widget getOption(PortraitFitType? portraitFitType) {
    if (portraitFitType == null) return Text("?");
    var stringValue = widthtTypePortraitStringValue(portraitFitType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            portraitFitType.index,
            value,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(PortraitFitType.PortraitContain),
      getOption(PortraitFitType.PortraitCover),
      getOption(PortraitFitType.PortraitFill),
      getOption(PortraitFitType.PortraitFitHeight),
      getOption(PortraitFitType.PortraitFitWidth),
      getOption(PortraitFitType.PortraitScaleDown),
      getOption(PortraitFitType.PortraitNone),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
