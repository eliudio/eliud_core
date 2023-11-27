import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef HeightTypeLandscapeCallback = Function(
    HeightTypeLandscape heightTypeLandscape);

class HeightTypeLandscapeWidget extends StatefulWidget {
  final HeightTypeLandscapeCallback heightTypeLandscapeCallback;
  final HeightTypeLandscape heightTypeLandscape;
  final AppModel app;
  HeightTypeLandscapeWidget(
      {super.key,
      required this.app,
      required this.heightTypeLandscapeCallback,
      required this.heightTypeLandscape});

  @override
  State<StatefulWidget> createState() {
    return _HeightTypeLandscapeWidgetState();
  }
}

class _HeightTypeLandscapeWidgetState extends State<HeightTypeLandscapeWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.heightTypeLandscape.index;
  }

  String heighttTypeLandscapeStringValue(
      HeightTypeLandscape? heightTypeLandscape) {
    switch (heightTypeLandscape) {
      case HeightTypeLandscape.absoluteHeight:
        return 'Absolute Height';
      case HeightTypeLandscape.percentageHeight:
        return 'Percentage Height';
      case HeightTypeLandscape.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.heightTypeLandscapeCallback(toHeightTypeLandscape(val));
    });
  }

  Widget getPrivilegeOption(HeightTypeLandscape? heightTypeLandscape) {
    if (heightTypeLandscape == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(heightTypeLandscape);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            heightTypeLandscape.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(HeightTypeLandscape.percentageHeight),
      getPrivilegeOption(HeightTypeLandscape.absoluteHeight)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
