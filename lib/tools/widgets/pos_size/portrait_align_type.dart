import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/cupertino.dart';

typedef PortraitAlignTypeCallback = Function(
    PortraitAlignType portraitAlignType);

class PortraitAlignTypeWidget extends StatefulWidget {
  PortraitAlignTypeCallback portraitAlignTypeCallback;
  final PortraitAlignType portraitAlignType;
  final AppModel app;
  PortraitAlignTypeWidget(
      {Key? key,
      required this.app,
      required this.portraitAlignTypeCallback,
      required this.portraitAlignType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PortraitAlignTypeWidgetState();
  }
}

class _PortraitAlignTypeWidgetState extends State<PortraitAlignTypeWidget> {
  int? value;

  void initState() {
    super.initState();
    value = widget.portraitAlignType.index;
  }

  String widthtTypePortraitStringValue(PortraitAlignType? portraitAlignType) {
    switch (portraitAlignType) {
      case PortraitAlignType.PortraitAlignBottomCenter:
        return 'Bottom Center';
      case PortraitAlignType.PortraitAlignTopLeft:
        return 'Top Left';
      case PortraitAlignType.PortraitAlignTopCenter:
        return 'Top Center';
      case PortraitAlignType.PortraitAlignTopRight:
        return 'Top Right';
      case PortraitAlignType.PortraitAlignCenterLeft:
        return 'Center Left';
      case PortraitAlignType.PortraitAlignCenter:
        return 'Center';
      case PortraitAlignType.PortraitAlignCenterRight:
        return 'Center Right';
      case PortraitAlignType.PortraitAlignBottomLeft:
        return 'Bottom Left';
      case PortraitAlignType.PortraitAlignBottomCenter:
        return 'Bottom Center';
      case PortraitAlignType.PortraitAlignBottomRight:
        return 'Bottom Right';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      value = val;
      widget.portraitAlignTypeCallback(toPortraitAlignType(val));
    });
  }

  Widget getOption(PortraitAlignType? portraitAlignType) {
    if (portraitAlignType == null) return Text("?");
    var stringValue = widthtTypePortraitStringValue(portraitAlignType);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            portraitAlignType.index,
            value,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(PortraitAlignType.PortraitAlignBottomCenter),
      getOption(PortraitAlignType.PortraitAlignTopLeft),
      getOption(PortraitAlignType.PortraitAlignTopCenter),
      getOption(PortraitAlignType.PortraitAlignTopRight),
      getOption(PortraitAlignType.PortraitAlignCenterLeft),
      getOption(PortraitAlignType.PortraitAlignCenter),
      getOption(PortraitAlignType.PortraitAlignCenterRight),
      getOption(PortraitAlignType.PortraitAlignBottomLeft),
      getOption(PortraitAlignType.PortraitAlignBottomCenter),
      getOption(PortraitAlignType.PortraitAlignBottomRight),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
