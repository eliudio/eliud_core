import 'file:///C:/src/eliud/eliud_core/lib/eliud.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

typedef ChangeRgbField(RgbModel value);

class RgbField extends StatefulWidget {
  final String label;
  final RgbModel rgbModel;
  final ChangeRgbField trigger;

  RgbField(this.label, this.rgbModel, this.trigger);

  @override
  createState() {
    return new RgbFieldState();
  }
}

class RgbFieldState extends State<RgbField> {
  Color color;

  @override
  void initState() {
    super.initState();
    if (widget.rgbModel != null)
      color = Color.fromRGBO(widget.rgbModel.r, widget.rgbModel.g, widget.rgbModel.b, widget.rgbModel.opacity);
    else
      color = Color.fromRGBO(255, 0, 0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = List();
    if (GlobalData.memberIsOwner()) {
      widgets.add(ExpandablePanel(
        header: Text(widget.label),
        collapsed: Center(
            child: new Container(
              height: 20.0,
              width: fullScreenWidth(context) / 1.5,
              color: color,
            )),
        expanded: ColorPicker(
          pickerColor: color,
          onColorChanged: changeColor,
          //enableLabel: true,
          pickerAreaHeightPercent: 0.8,
        )));
    }
    widgets.add(
      new Container(
        height: 15.0,
      ));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets
    );
  }

  void changeColor(Color c) {
    setState(() => color = c);
    RgbModel rgbModel =
        RgbModel(r: c.red, g: c.green, b: c.blue, opacity: c.opacity);
    widget.trigger(rgbModel);
  }
}
