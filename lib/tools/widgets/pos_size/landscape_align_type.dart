import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/cupertino.dart';

typedef LandscapeAlignTypeCallback = Function(
    LandscapeAlignType landscapeAlignType);

class LandscapeAlignTypeWidget extends StatefulWidget {
  LandscapeAlignTypeCallback landscapeAlignTypeCallback;
  final LandscapeAlignType landscapeAlignType;
  final AppModel app;
  LandscapeAlignTypeWidget(
      {Key? key,
      required this.app,
      required this.landscapeAlignTypeCallback,
      required this.landscapeAlignType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LandscapeAlignTypeWidgetState();
  }
}

class _LandscapeAlignTypeWidgetState extends State<LandscapeAlignTypeWidget> {
  int? value;

  void initState() {
    super.initState();
    value = widget.landscapeAlignType.index;
  }

  String widthtTypeLandscapeStringValue(LandscapeAlignType? landscapeAlignType) {
    switch (landscapeAlignType) {
      case LandscapeAlignType.LandscapeAlignBottomCenter:
        return 'Bottom Center';
      case LandscapeAlignType.LandscapeAlignTopLeft:
        return 'Top Left';
      case LandscapeAlignType.LandscapeAlignTopCenter:
        return 'Top Center';
      case LandscapeAlignType.LandscapeAlignTopRight:
        return 'Top Right';
      case LandscapeAlignType.LandscapeAlignCenterLeft:
        return 'Center Left';
      case LandscapeAlignType.LandscapeAlignCenter:
        return 'Center';
      case LandscapeAlignType.LandscapeAlignCenterRight:
        return 'Center Right';
      case LandscapeAlignType.LandscapeAlignBottomLeft:
        return 'Bottom Left';
      case LandscapeAlignType.LandscapeAlignBottomCenter:
        return 'Bottom Center';
      case LandscapeAlignType.LandscapeAlignBottomRight:
        return 'Bottom Right';
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
        child: radioListTile(
            widget.app,
            context,
            landscapeAlignType.index,
            value,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(LandscapeAlignType.LandscapeAlignBottomCenter),
      getOption(LandscapeAlignType.LandscapeAlignTopLeft),
      getOption(LandscapeAlignType.LandscapeAlignTopCenter),
      getOption(LandscapeAlignType.LandscapeAlignTopRight),
      getOption(LandscapeAlignType.LandscapeAlignCenterLeft),
      getOption(LandscapeAlignType.LandscapeAlignCenter),
      getOption(LandscapeAlignType.LandscapeAlignCenterRight),
      getOption(LandscapeAlignType.LandscapeAlignBottomLeft),
      getOption(LandscapeAlignType.LandscapeAlignBottomCenter),
      getOption(LandscapeAlignType.LandscapeAlignBottomRight),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
