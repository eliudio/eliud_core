import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../style/frontend/has_dialog_field.dart';
import '../../../style/frontend/has_list_tile.dart';
import '../../../style/frontend/has_tabs.dart';
import '../../helpers/parse_helper.dart';

class StyleColorWidget extends StatefulWidget {
  final AppModel app;
  final RgbModel value;
  final String label;
  final bool withContainer;
  final VoidCallback? changeTrigger;

  StyleColorWidget({
    super.key,
    required this.app,
    required this.label,
    required this.value,
    this.withContainer = true,
    this.changeTrigger,
  });

  @override
  State<StyleColorWidget> createState() => _StyleColorWidgetState();
}

class _StyleColorWidgetState extends State<StyleColorWidget>
    with SingleTickerProviderStateMixin {
  Color? color;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    defineColor();
    _tabController = TabController(vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.index = 0;
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController!.dispose();
    }
    super.dispose();
  }

  void _handleTabSelection() {
    if ((_tabController != null) && (_tabController!.indexIsChanging)) {
      setState(() {});
    }
  }

  void defineColor() {
    color = Color.fromRGBO(widget.value.r!, widget.value.g!, widget.value.b!,
        widget.value.opacity!);
  }

  Widget colorSelection() {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      tabBar(widget.app, context,
          items: ['Picker', 'Entry'], tabController: _tabController!),
      if (_tabController!.index == 0)
        ColorPicker(
          pickerColor: color!,
          onColorChanged: changeColor,
          //enableLabel: true,
          pickerAreaHeightPercent: 0.8,
        ),
      if (_tabController!.index == 1)
        ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: (widget.value.r ?? 0).toString(),
                valueChanged: (value) {
                  setState(() {
                    var colourValue = intParse(value);
                    if ((colourValue >= 0) && (colourValue <= 255)) {
                      widget.value.r = colourValue;
                      defineColor();
                    }
                  });
                },
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                ),
                decoration: const InputDecoration(
                  hintText: 'Red',
                  labelText: 'R',
                ),
              )),
          getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: (widget.value.g ?? 0).toString(),
                valueChanged: (value) {
                  setState(() {
                    var colourValue = intParse(value);
                    if ((colourValue >= 0) && (colourValue <= 255)) {
                      widget.value.g = colourValue;
                      defineColor();
                    }
                  });
                },
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                ),
                decoration: const InputDecoration(
                  hintText: 'Green',
                  labelText: 'G',
                ),
              )),
          getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: (widget.value.b ?? 0).toString(),
                valueChanged: (value) {
                  setState(() {
                    var colourValue = intParse(value);
                    if ((colourValue >= 0) && (colourValue <= 255)) {
                      widget.value.b = colourValue;
                      defineColor();
                    }
                  });
                },
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                ),
                decoration: const InputDecoration(
                  hintText: 'Blue',
                  labelText: 'B',
                ),
              )),
          getListTile(context, widget.app,
              leading: Icon(Icons.description),
              title: dialogField(
                widget.app,
                context,
                initialValue: (widget.value.opacity ?? 0).toString(),
                valueChanged: (value) {
                  setState(() {
                    var opacity = doubleParse(value);
                    if ((opacity >= 0) && (opacity <= 100)) {
                      widget.value.opacity = opacity;
                      defineColor();
                    }
                  });
                },
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                ),
                decoration: const InputDecoration(
                  hintText: 'Opacity',
                  labelText: 'Opacity',
                ),
              )),
        ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withContainer) {
      return topicContainer(widget.app, context,
          title: widget.label,
          collapsible: true,
          collapsed: true,
          children: [colorSelection()]);
    } else {
      return colorSelection();
    }
  }

  void changeColor(Color c) {
    setState(() {
      if (widget.changeTrigger != null) {
        widget.changeTrigger!();
      }
      color = c;
      widget.value.r = c.red;
      widget.value.g = c.green;
      widget.value.b = c.blue;
      widget.value.opacity = c.opacity;
    });
  }
}
