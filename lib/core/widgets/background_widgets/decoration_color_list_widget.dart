import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/decoration_color_model.dart';
import 'package:eliud_core_main/model/rgb_model.dart';
import 'package:flutter/material.dart';
import 'style_color_widget.dart';
import 'package:eliud_core_helpers/helpers/parse_helper.dart';

typedef ColorListChanged = Function(List<DecorationColorModel>? value);

class DecorationColorListWidget extends StatefulWidget {
  final AppModel app;
  final String label;
  final List<DecorationColorModel> colors;
  final ColorListChanged colorListChanged;

  DecorationColorListWidget({
    super.key,
    required this.app,
    required this.label,
    required this.colors,
    required this.colorListChanged,
  });

  @override
  State<DecorationColorListWidget> createState() => _DecorationColorListState();
}

class _DecorationColorListState extends State<DecorationColorListWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> colorEntries = [];
    if (widget.colors.isNotEmpty) {
      int i = 1;
      for (var color in widget.colors) {
        if (color.color != null) {
          colorEntries.add(topicContainer(widget.app, context,
              title: 'Gradient color #$i',
              collapsible: true,
              collapsed: true,
              children: [
                StyleColorWidget(
                    withContainer: false,
                    app: widget.app,
                    value: color.color!,
                    label: 'Gradient color #$i'),
                getListTile(context, widget.app,
                    leading: Icon(Icons.description),
                    title: dialogField(
                      widget.app,
                      context,
                      initialValue: (color.stop ?? 0).toString(),
                      valueChanged: (value) {
                        color.stop = doubleParse(value);
                      },
                      keyboardType: TextInputType.numberWithOptions(
                        signed: false,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Stop',
                        labelText: 'Stop',
                      ),
                    ))
              ]));
          i++;
        }
      }
    }
    colorEntries.add(_addButton());
    return topicContainer(
      widget.app,
      context,
      title: widget.label,
      collapsible: true,
      collapsed: true,
      children: colorEntries,
    );
  }

  Widget _addButton() {
    return Row(children: [
      Spacer(),
      if (widget.colors.isNotEmpty)
        GestureDetector(
            child: Icon(Icons.delete),
            onTap: () {
              setState(() {
                widget.colors.removeLast();
              });
            }),
      if (widget.colors.isNotEmpty) Spacer(),
      GestureDetector(
          child: Icon(Icons.add),
          onTap: () {
            setState(() {
              widget.colors.add(DecorationColorModel(
                  documentID: newRandomKey(),
                  color: RgbModel(r: 0, g: 0, b: 0, opacity: 1),
                  stop: 0));
            });
          }),
      Spacer(),
    ]);
  }
}
