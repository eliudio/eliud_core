import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:flutter/cupertino.dart';

typedef PortraitAlignTypeCallback = Function(
    PortraitAlignType portraitAlignType);

class PortraitAlignTypeWidget extends StatefulWidget {
  final PortraitAlignTypeCallback portraitAlignTypeCallback;
  final PortraitAlignType portraitAlignType;
  final AppModel app;
  PortraitAlignTypeWidget(
      {super.key,
      required this.app,
      required this.portraitAlignTypeCallback,
      required this.portraitAlignType});

  @override
  State<StatefulWidget> createState() {
    return _PortraitAlignTypeWidgetState();
  }
}

class _PortraitAlignTypeWidgetState extends State<PortraitAlignTypeWidget> {
  int? value;

  @override
  void initState() {
    super.initState();
    value = widget.portraitAlignType.index;
  }

  String widthtTypePortraitStringValue(PortraitAlignType? portraitAlignType) {
    switch (portraitAlignType) {
      case PortraitAlignType.portraitAlignBottomCenter:
        return 'Bottom Center';
      case PortraitAlignType.portraitAlignTopLeft:
        return 'Top Left';
      case PortraitAlignType.portraitAlignTopCenter:
        return 'Top Center';
      case PortraitAlignType.portraitAlignTopRight:
        return 'Top Right';
      case PortraitAlignType.portraitAlignCenterLeft:
        return 'Center Left';
      case PortraitAlignType.portraitAlignCenter:
        return 'Center';
      case PortraitAlignType.portraitAlignCenterRight:
        return 'Center Right';
      case PortraitAlignType.portraitAlignBottomLeft:
        return 'Bottom Left';
      case PortraitAlignType.portraitAlignBottomRight:
        return 'Bottom Right';
      case PortraitAlignType.unknown:
        break;
      case null:
        break;
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
        child: radioListTile(widget.app, context, portraitAlignType.index,
            value, stringValue, null, (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getOption(PortraitAlignType.portraitAlignBottomCenter),
      getOption(PortraitAlignType.portraitAlignTopLeft),
      getOption(PortraitAlignType.portraitAlignTopCenter),
      getOption(PortraitAlignType.portraitAlignTopRight),
      getOption(PortraitAlignType.portraitAlignCenterLeft),
      getOption(PortraitAlignType.portraitAlignCenter),
      getOption(PortraitAlignType.portraitAlignCenterRight),
      getOption(PortraitAlignType.portraitAlignBottomLeft),
      getOption(PortraitAlignType.portraitAlignBottomCenter),
      getOption(PortraitAlignType.portraitAlignBottomRight),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
