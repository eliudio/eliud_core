import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PortraitFitTypeCallback = Function(PortraitFitType portraitFitType);

class PortraitFitTypeWidget extends StatefulWidget {
  final PortraitFitTypeCallback portraitFitTypeCallback;
  final PortraitFitType portraitFitType;
  final AppModel app;
  PortraitFitTypeWidget(
      {super.key,
      required this.app,
      required this.portraitFitTypeCallback,
      required this.portraitFitType});

  @override
  State<StatefulWidget> createState() {
    return _PortraitFitTypeWidgetState();
  }
}

class _PortraitFitTypeWidgetState extends State<PortraitFitTypeWidget> {
  int? value;

  @override
  void initState() {
    super.initState();
    value = widget.portraitFitType.index;
  }

  String widthtTypePortraitStringValue(PortraitFitType? portraitFitType) {
    switch (portraitFitType) {
      case PortraitFitType.portraitContain:
        return 'Contains';
      case PortraitFitType.portraitCover:
        return 'Cover';
      case PortraitFitType.portraitFill:
        return 'Fill';
      case PortraitFitType.portraitFitHeight:
        return 'Fit height';
      case PortraitFitType.portraitFitWidth:
        return 'Fit width';
      case PortraitFitType.portraitScaleDown:
        return 'Scale down';
      case PortraitFitType.portraitNone:
        return 'None';
      case PortraitFitType.unknown:
        break;
      case null:
        break;
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
        child: radioListTile(widget.app, context, portraitFitType.index, value,
            stringValue, null, (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(PortraitFitType.portraitContain),
      getOption(PortraitFitType.portraitCover),
      getOption(PortraitFitType.portraitFill),
      getOption(PortraitFitType.portraitFitHeight),
      getOption(PortraitFitType.portraitFitWidth),
      getOption(PortraitFitType.portraitScaleDown),
      getOption(PortraitFitType.portraitNone),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
