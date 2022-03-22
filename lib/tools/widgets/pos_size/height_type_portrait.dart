import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef HeightTypePortraitCallback = Function(
    HeightTypePortrait heightTypePortrait);

class HeightTypePortraitWidget extends StatefulWidget {
  HeightTypePortraitCallback heightTypePortraitCallback;
  final HeightTypePortrait heightTypePortrait;
  final AppModel app;
  HeightTypePortraitWidget(
      {Key? key,
        required this.app,
        required this.heightTypePortraitCallback,
        required this.heightTypePortrait})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HeightTypePortraitWidgetState();
  }
}

class _HeightTypePortraitWidgetState extends State<HeightTypePortraitWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.heightTypePortrait.index;
  }

  String heighttTypePortraitStringValue(HeightTypePortrait? heightTypePortrait) {
    switch (heightTypePortrait) {
      case HeightTypePortrait.AbsoluteHeight:
        return 'Absolute Height';
      case HeightTypePortrait.PercentageHeight:
        return 'Percentage Height';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.heightTypePortraitCallback(toHeightTypePortrait(val));
    });
  }

  Widget getPrivilegeOption(HeightTypePortrait? heightTypePortrait) {
    if (heightTypePortrait == null) return Text("?");
    var stringValue = heighttTypePortraitStringValue(heightTypePortrait);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            heightTypePortrait.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(HeightTypePortrait.PercentageHeight),
      getPrivilegeOption(HeightTypePortrait.AbsoluteHeight)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}

