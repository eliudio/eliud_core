import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef WidthTypePortraitCallback = Function(
    WidthTypePortrait widthTypePortrait);

class WidthTypePortraitWidget extends StatefulWidget {
  final WidthTypePortraitCallback widthTypePortraitCallback;
  final WidthTypePortrait widthTypePortrait;
  final AppModel app;
  WidthTypePortraitWidget(
      {super.key,
      required this.app,
      required this.widthTypePortraitCallback,
      required this.widthTypePortrait});

  @override
  State<StatefulWidget> createState() {
    return _WidthTypePortraitWidgetState();
  }
}

class _WidthTypePortraitWidgetState extends State<WidthTypePortraitWidget> {
  int? _widthTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _widthTypeSelectedRadioTile = widget.widthTypePortrait.index;
  }

  String widthtTypePortraitStringValue(WidthTypePortrait? widthTypePortrait) {
    switch (widthTypePortrait) {
      case WidthTypePortrait.absoluteWidth:
        return 'Absolute Width';
      case WidthTypePortrait.percentageWidth:
        return 'Percentage Width';
      case WidthTypePortrait.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _widthTypeSelectedRadioTile = val;
      widget.widthTypePortraitCallback(toWidthTypePortrait(val));
    });
  }

  Widget getPrivilegeOption(WidthTypePortrait? widthTypePortrait) {
    if (widthTypePortrait == null) return Text("?");
    var stringValue = widthtTypePortraitStringValue(widthTypePortrait);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            widthTypePortrait.index,
            _widthTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(WidthTypePortrait.percentageWidth),
      getPrivilegeOption(WidthTypePortrait.absoluteWidth)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
