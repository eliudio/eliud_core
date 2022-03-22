import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef WidthTypePortraitCallback = Function(
    WidthTypePortrait widthTypePortrait);

class WidthTypePortraitWidget extends StatefulWidget {
  WidthTypePortraitCallback widthTypePortraitCallback;
  final WidthTypePortrait widthTypePortrait;
  final AppModel app;
  WidthTypePortraitWidget(
      {Key? key,
      required this.app,
      required this.widthTypePortraitCallback,
      required this.widthTypePortrait})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WidthTypePortraitWidgetState();
  }
}

class _WidthTypePortraitWidgetState extends State<WidthTypePortraitWidget> {
  int? _widthTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _widthTypeSelectedRadioTile = widget.widthTypePortrait.index;
  }

  String widthtTypePortraitStringValue(WidthTypePortrait? widthTypePortrait) {
    switch (widthTypePortrait) {
      case WidthTypePortrait.AbsoluteWidth:
        return 'Absolute Width';
      case WidthTypePortrait.PercentageWidth:
        return 'Percentage Width';
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
      getPrivilegeOption(WidthTypePortrait.PercentageWidth),
      getPrivilegeOption(WidthTypePortrait.AbsoluteWidth)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
