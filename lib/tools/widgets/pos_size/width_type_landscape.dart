import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef WidthTypeLandscapeCallback = Function(
    WidthTypeLandscape widthTypeLandscape);

class WidthTypeLandscapeWidget extends StatefulWidget {
  final WidthTypeLandscapeCallback widthTypeLandscapeCallback;
  final WidthTypeLandscape widthTypeLandscape;
  final AppModel app;
  WidthTypeLandscapeWidget(
      {super.key,
      required this.app,
      required this.widthTypeLandscapeCallback,
      required this.widthTypeLandscape});

  @override
  State<StatefulWidget> createState() {
    return _WidthTypeLandscapeWidgetState();
  }
}

class _WidthTypeLandscapeWidgetState extends State<WidthTypeLandscapeWidget> {
  int? _widthTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _widthTypeSelectedRadioTile = widget.widthTypeLandscape.index;
  }

  String widthtTypeLandscapeStringValue(
      WidthTypeLandscape? widthTypeLandscape) {
    switch (widthTypeLandscape) {
      case WidthTypeLandscape.absoluteWidth:
        return 'Absolute Width';
      case WidthTypeLandscape.percentageWidth:
        return 'Percentage Width';
      case WidthTypeLandscape.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _widthTypeSelectedRadioTile = val;
      widget.widthTypeLandscapeCallback(toWidthTypeLandscape(val));
    });
  }

  Widget getPrivilegeOption(WidthTypeLandscape? widthTypeLandscape) {
    if (widthTypeLandscape == null) return Text("?");
    var stringValue = widthtTypeLandscapeStringValue(widthTypeLandscape);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            widthTypeLandscape.index,
            _widthTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(WidthTypeLandscape.percentageWidth),
      getPrivilegeOption(WidthTypeLandscape.absoluteWidth)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
