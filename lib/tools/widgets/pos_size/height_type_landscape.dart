import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef HeightTypeLandscapeCallback = Function(
    HeightTypeLandscape heightTypeLandscape);

class HeightTypeLandscapeWidget extends StatefulWidget {
  HeightTypeLandscapeCallback heightTypeLandscapeCallback;
  final HeightTypeLandscape heightTypeLandscape;
  final AppModel app;
  HeightTypeLandscapeWidget(
      {Key? key,
        required this.app,
        required this.heightTypeLandscapeCallback,
        required this.heightTypeLandscape})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeightTypeLandscapeWidgetState();
  }
}

class _HeightTypeLandscapeWidgetState extends State<HeightTypeLandscapeWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.heightTypeLandscape.index;
  }

  String heighttTypeLandscapeStringValue(HeightTypeLandscape? heightTypeLandscape) {
    switch (heightTypeLandscape) {
      case HeightTypeLandscape.AbsoluteHeight:
        return 'Absolute Height';
      case HeightTypeLandscape.PercentageHeight:
        return 'Percentage Height';
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
      getPrivilegeOption(HeightTypeLandscape.PercentageHeight),
      getPrivilegeOption(HeightTypeLandscape.AbsoluteHeight)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
